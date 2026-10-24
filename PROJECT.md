# ISP Billing — Own Project Guide

This is an independent copy of the billing platform, rebranded for our own use.

**Modified by johirxofficial.**
It is **not connected** to the original GitHub repository and has its own
database, sessions, cache, domain and service.

## Running instance

| Item | Value |
|---|---|
| Main site | **http://127.0.0.1:8001** |
| Admin login | **http://127.0.0.1:8001/login** |
| Admin panel | **http://127.0.0.1:8001/dashboard** |
| Customer portal | **http://127.0.0.1:8001/portal** |
| Project folder | `/home/desktop/spacex/isp-billing` |
| Database | `isp_billing` (MySQL) |
| Web service | `isp-billing.service` |
| Queue worker | `isp-billing-queue.service` |
| Scheduler | `isp-billing-scheduler.service` |
| Server port | `8001` |

Admin login: `rohan9222@gmail.com` / `rohan9222@gmail.com`

> This project uses a **single-host layout** — no third-party domain or
> subdomain is needed. Everything runs on `127.0.0.1:8001`:
> `/` = website, `/login` + `/dashboard` = admin, `/portal` = customer portal.
>
> When you get your own domain, just change `APP_URL` in `.env` (and optionally
> `SESSION_DOMAIN`) and restart. No route changes are required.

## Everyday commands

```bash
cd /home/desktop/spacex/isp-billing

systemctl --user status isp-billing      # web
systemctl --user status isp-billing-queue
systemctl --user status isp-billing-scheduler
systemctl --user restart isp-billing     # restart after code changes
systemctl --user stop isp-billing        # stop

php artisan migrate                      # database changes
php artisan optimize:clear               # clear config/route/view cache
npm run build                            # rebuild frontend assets
php artisan test                         # tests (needs pdo_sqlite)
```

## Where to change the brand

1. **App name** — `.env` → `APP_NAME="ISP Billing"`
2. **Site name / title** — Admin → Site Settings, or table `main_site_data`
   (`site_name`, `site_title`).
3. **Logo** — `public/images/` (see `resources/views/filament/application-logo.blade.php`).
4. **Colors / theme** — Admin → Site Settings (`theme_*` keys in `main_site_data`).
5. **Frontend fallback text** — search for `ISP Billing` in `app/` and `resources/views/`.

After changing `.env` run:

```bash
php artisan optimize:clear
systemctl --user restart isp-billing
```

## Database

```bash
# Backup
mysqldump -uroot -p isp_billing > backup-$(date +%F).sql

# Restore
mysql -uroot -p isp_billing < backup.sql
```

## Separate from the original

- `.git` was recreated as a fresh repository (no `origin` remote).
- New database: `isp_billing` (copy of the previous data).
- New session cookie/domain and cache prefix, so logins do not clash.
- Runs on a different port (`8001`) while the original runs on `8000`.

## License

Licensed under **AGPL-3.0**. See `/LICENSE`.

**Modified by johirxofficial.**
