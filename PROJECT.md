# johirxofficial — Own Project Guide

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
| Project folder | `/home/desktop/spacex/johirxofficial` |
| Database | `johirxofficial` (MySQL) |
| Web service | `johirxofficial.service` |
| Queue worker | `johirxofficial-queue.service` |
| Scheduler | `johirxofficial-scheduler.service` |
| Server port | `8001` |

Admin login: `admin@johirxofficial.local` / `johirxofficial`

> This project uses a **single-host layout** — no third-party domain or
> subdomain is needed. Everything runs on `127.0.0.1:8001`:
> `/` = website, `/login` + `/dashboard` = admin, `/portal` = customer portal.
>
> When you get your own domain, just change `APP_URL` in `.env` (and optionally
> `SESSION_DOMAIN`) and restart. No route changes are required.

## Everyday commands

```bash
cd /home/desktop/spacex/johirxofficial

systemctl --user status johirxofficial      # web
systemctl --user status johirxofficial-queue
systemctl --user status johirxofficial-scheduler
systemctl --user restart johirxofficial     # restart after code changes
systemctl --user stop johirxofficial        # stop

php artisan migrate                      # database changes
php artisan optimize:clear               # clear config/route/view cache
npm run build                            # rebuild frontend assets
php artisan test                         # tests (needs pdo_sqlite)
```

## Where to change the brand

1. **App name** — `.env` → `APP_NAME="johirxofficial"`
2. **Site name / title** — Admin → Site Settings, or table `main_site_data`
   (`site_name`, `site_title`).
3. **Logo** — `public/images/` (see `resources/views/filament/application-logo.blade.php`).
4. **Colors / theme** — Admin → Site Settings (`theme_*` keys in `main_site_data`).
5. **Frontend fallback text** — search for `johirxofficial` in `app/` and `resources/views/`.

After changing `.env` run:

```bash
php artisan optimize:clear
systemctl --user restart johirxofficial
```

## Database

```bash
# Backup
mysqldump -uroot -p johirxofficial > backup-$(date +%F).sql

# Restore
mysql -uroot -p johirxofficial < backup.sql
```

## Separate from the original

- `.git` was recreated as a fresh repository (no `origin` remote).
- New database: `johirxofficial` (copy of the previous data).
- New session cookie/domain and cache prefix, so logins do not clash.
- Runs on a different port (`8001`) while the original runs on `8000`.

## License

Licensed under **AGPL-3.0**. See `/LICENSE`.

**Modified by johirxofficial.**
