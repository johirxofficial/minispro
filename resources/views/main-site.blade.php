{{-- Simple landing page for minispro ISP Billing --}}
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ siteUrlSettings('site_name') ?? config('app.name') }}</title>
    <meta name="description" content="{{ siteUrlSettings('site_description') ?? 'ISP Billing and Network Management System' }}">
    <link rel="shortcut icon" href="{{ site_image(siteUrlSettings('site_favicon')) }}" type="image/x-icon">
    <style>
        :root {
            --brand: #06ad73;
            --brand-dark: #059669;
            --ink: #111827;
            --muted: #6b7280;
            --line: #e5e7eb;
        }

        * { box-sizing: border-box; }

        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            font-family: "Segoe UI", system-ui, -apple-system, Roboto, Arial, sans-serif;
            color: var(--ink);
            background:
                radial-gradient(circle at 15% 15%, rgba(6, 173, 115, .14), transparent 42%),
                radial-gradient(circle at 85% 20%, rgba(99, 102, 241, .14), transparent 42%),
                #f9fafb;
        }

        .site-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
            padding: 22px 32px;
            max-width: 1080px;
            width: 100%;
            margin: 0 auto;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
            text-decoration: none;
            color: var(--ink);
        }

        .brand img { height: 42px; width: auto; display: block; }

        .brand-name {
            font-size: 1.15rem;
            font-weight: 800;
            letter-spacing: .2px;
        }

        .badge {
            font-size: .72rem;
            font-weight: 700;
            letter-spacing: .08em;
            text-transform: uppercase;
            color: var(--brand-dark);
            background: rgba(6, 173, 115, .1);
            border: 1px solid rgba(6, 173, 115, .25);
            border-radius: 999px;
            padding: 5px 10px;
        }

        main {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 32px 24px 56px;
        }

        .hero {
            width: 100%;
            max-width: 720px;
            text-align: center;
            background: #fff;
            border: 1px solid var(--line);
            border-radius: 22px;
            padding: 56px 40px;
            box-shadow: 0 24px 70px rgba(17, 24, 39, .08);
        }

        h1 {
            margin: 0 0 18px;
            font-size: clamp(1.9rem, 4vw, 2.7rem);
            line-height: 1.15;
            letter-spacing: -0.02em;
        }

        h1 span { color: var(--brand); }

        p {
            margin: 0 auto 30px;
            max-width: 540px;
            font-size: 1.02rem;
            line-height: 1.7;
            color: var(--muted);
        }

        .btn-login {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            padding: 14px 32px;
            font-size: 1rem;
            font-weight: 700;
            color: #fff;
            text-decoration: none;
            border-radius: 12px;
            background: linear-gradient(135deg, var(--brand) 0%, var(--brand-dark) 100%);
            box-shadow: 0 10px 24px rgba(6, 173, 115, .28);
            transition: transform .15s ease, box-shadow .15s ease;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 14px 30px rgba(6, 173, 115, .34);
        }

        .btn-login svg { width: 19px; height: 19px; }

        footer {
            padding: 20px 24px 28px;
            text-align: center;
            font-size: .82rem;
            color: var(--muted);
        }

        @media (max-width: 520px) {
            .site-header { padding: 18px 20px; }
            .brand img { height: 34px; }
            .hero { padding: 40px 24px; border-radius: 18px; }
        }
    </style>
</head>

<body>
    <header class="site-header">
        <a class="brand" href="{{ url('/') }}">
            @if (siteUrlSettings('site_logo'))
                <img src="{{ site_image(siteUrlSettings('site_logo')) }}" alt="{{ siteUrlSettings('site_name') ?? config('app.name') }}">
            @else
                <img src="{{ asset('images/logo.png') }}" alt="{{ siteUrlSettings('site_name') ?? config('app.name') }}">
            @endif
            <span class="brand-name">{{ siteUrlSettings('site_name') ?? config('app.name') }}</span>
        </a>
        <span class="badge">{{ __('ISP Billing') }}</span>
    </header>

    <main>
        <section class="hero">
            <h1>{{ __('Welcome to') }} <span>{{ siteUrlSettings('site_name') ?? config('app.name') }}</span></h1>
            <p>
                {{ __('A complete ISP billing and network management platform. Manage customers, packages, invoices, payments, MikroTik routers, hotspot vouchers and reports — all from one secure dashboard.') }}
            </p>
            <a class="btn-login" href="{{ url('/login') }}">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9" />
                </svg>
                {{ __('Go to Login') }}
            </a>
        </section>
    </main>

    <footer>
        &copy; {{ date('Y') }} {{ siteUrlSettings('site_name') ?? config('app.name') }}. {{ __('All rights reserved.') }}
        &middot; {{ __('Modified by johirxofficial') }}
    </footer>
</body>

</html>
