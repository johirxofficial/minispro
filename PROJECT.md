# minispro — Own Project Guide

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
| Project folder | `/home/desktop/spacex/minispro` |
| Database | `minispro` (MySQL) |
| Web service | `minispro.service` |
| Queue worker | `minispro-queue.service` |
| Scheduler | `minispro-scheduler.service` |
| Server port | `8001` |

Admin login: `admin@minispro.local` / `minispro`

> This project uses a **single-host layout** — no third-party domain or
> subdomain is needed. Everything runs on `127.0.0.1:8001`:
> `/` = website, `/login` + `/dashboard` = admin, `/portal` = customer portal.
>
> When you get your own domain, just change `APP_URL` in `.env` (and optionally
> `SESSION_DOMAIN`) and restart. No route changes are required.

## Everyday commands

```bash
cd /home/desktop/spacex/minispro

systemctl --user status minispro      # web
systemctl --user status minispro-queue
systemctl --user status minispro-scheduler
systemctl --user restart minispro     # restart after code changes
systemctl --user stop minispro        # stop

php artisan migrate                      # database changes
php artisan optimize:clear               # clear config/route/view cache
npm run build                            # rebuild frontend assets
php artisan test                         # tests (needs pdo_sqlite)
```

## Where to change the brand

1. **App name** — `.env` → `APP_NAME="minispro"`
2. **Site name / title** — Admin → Site Settings, or table `main_site_data`
   (`site_name`, `site_title`).
3. **Logo** — `public/images/` (see `resources/views/filament/application-logo.blade.php`).
4. **Colors / theme** — Admin → Site Settings (`theme_*` keys in `main_site_data`).
5. **Frontend fallback text** — search for `minispro` in `app/` and `resources/views/`.

After changing `.env` run:

```bash
php artisan optimize:clear
systemctl --user restart minispro
```

## Database

```bash
# Import the bundled demo database (schema + demo data)
mysql -u minispro -p minispro < database/demo.sql

# Backup
mysqldump -u minispro -p --single-transaction minispro > backup-$(date +%F).sql

# Restore
mysql -u minispro -p minispro < backup.sql
```

## Separate from the original

- `.git` is its own repository with no connection to the original project.
- Own database: `minispro`.
- Own session cookie, cache prefix and systemd services.
- Runs on port `8001` while the original runs on `8000`.
- Full server installation guide: [`README.md`](README.md).
- Demo database: [`database/demo.sql`](database/demo.sql).

## License

Licensed under **AGPL-3.0**. See `/LICENSE`.

**Modified by johirxofficial.**
