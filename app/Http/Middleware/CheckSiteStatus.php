<?php

namespace App\Http\Middleware;

use App\Models\MainSiteData;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckSiteStatus
{
    /**
     * Handle an incoming request.
     *
     * @param  Closure(Request): (Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {

        try {
            $maintenance = (bool) MainSiteData::getValue('site_maintenance', false);
            $status = MainSiteData::getValue('site_status', 'active');
            $disabled = ($status === 'disabled');
        } catch (\Throwable $e) {
            $maintenance = false;
            $disabled = false;
        }

        if ($maintenance || $disabled) {
            // Never block the admin panel — admins must be able to re-enable the site.
            $isAdminArea = ! $request->is('/', 'all-packages', 'lang/*', 'warning', 'recharge/*', 'privacy-policy', 'terms-of-service')
                && ! $request->is('portal', 'portal/*');

            if ($isAdminArea) {
                return $next($request);
            }

            $title = $maintenance ? 'Under Maintenance' : 'Site Temporarily Offline';
            $heading = $maintenance ? 'We\'ll Be Back Soon' : 'Closed Temporarily';
            $message = MainSiteData::getValue('site_message') ?: ($maintenance
                ? 'We are currently performing scheduled maintenance. Please check back shortly.'
                : 'This portal and website are temporarily offline. Please check back later.');

            return response()->view('errors.site-closed', [
                'title' => $title,
                'heading' => $heading,
                'message' => $message,
                'is_maintenance' => $maintenance,
            ], 503);
        }

        return $next($request);
    }
}
