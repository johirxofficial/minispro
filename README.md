# minispro ISP Billing

A complete, self-hosted ISP billing and network management platform for MikroTik-based ISPs.

Manage customers, packages, billing, payments, MikroTik routers, PPPoE users, hotspot vouchers, resellers, SMS and reports — all from one dashboard.

> **Modified by johirxofficial**

---

## Contents

- [Features](#features)
- [Server requirements](#server-requirements)
- [What is in the ZIP](#what-is-in-the-zip)
- [Installation on a fresh server](#installation-on-a-fresh-server)
  - [1. Install server packages](#1-install-server-packages)
  - [2. Create the database](#2-create-the-database)
  - [3. Upload and extract the project](#3-upload-and-extract-the-project)
  - [4. Install PHP dependencies](#4-install-php-dependencies)
  - [5. Configure `.env`](#5-configure-env)
  - [6. Import the demo database](#6-import-the-demo-database)
  - [7. Storage link and permissions](#7-storage-link-and-permissions)
  - [8. Quick test with PHP's built-in server](#8-quick-test-with-phps-built-in-server)
  - [9. Production web server (Nginx)](#9-production-web-server-nginx)
  - [10. Queue worker (Supervisor)](#10-queue-worker-supervisor)
  - [11. Scheduler (cron)](#11-scheduler-cron)
- [Default login credentials](#default-login-credentials)
- [First things to do after login](#first-things-to-do-after-login)
- [MikroTik setup and user import](#mikrotik-setup-and-user-import)
- [Billing workflow](#billing-workflow)
- [Payment gateways and SMS](#payment-gateways-and-sms)
- [Backup and restore](#backup-and-restore)
- [Updating the application](#updating-the-application)
- [Troubleshooting](#troubleshooting)
- [Security checklist](#security-checklist)
- [License](#license)

---

## Features

- Customer management with complete profile, billing and official records
- ISP packages with router/profile matching
- Monthly bill generation, due tracking, advance and discount support
- Payment collection, invoices and due reports
- MikroTik router integration over API or SSH
- PPPoE secrets import from MikroTik into the web panel
- Auto package matching during import (router-specific package first, then global)
- Hotspot voucher generation, printing and sales tracking
- Customer self-service portal (`/portal`)
- Reseller panel with wallet and commissions
- SMS notifications and templates
- Multiple payment gateway integrations (bKash, Nagad, SSLCommerz, Stripe, PayPal and more)
- Role and permission management
- Activity logs, login logs and system logs

---

## Server requirements

| Component | Minimum |
|---|---|
| OS | Ubuntu 22.04 / 24.04, Debian 12, or any Linux server |
| PHP | **8.3 or newer** |
| PHP extensions | `bcmath`, `ctype`, `curl`, `dom`, `fileinfo`, `gd`, `intl`, `mbstring`, `openssl`, `pdo_mysql`, `tokenizer`, `xml`, `zip` |
| Database | MySQL 8.0+ or MariaDB 10.6+ |
| Composer | 2.x |
| Web server | Nginx (recommended) or Apache |
| Node.js | Optional — compiled frontend assets are already included |

You also need:

- A domain name pointed to the server (optional for LAN-only use)
- MikroTik router API/SSH access for router features

---

## What is in the ZIP

```
minispro/
├── app/                  Laravel application code
├── bootstrap/
├── config/
├── database/
│   ├── demo.sql          Full demo database (schema + demo data)
│   ├── migrations/
│   └── seeders/
├── deploy/               systemd service examples
├── lang/
├── public/               Web root (contains compiled assets in public/build)
├── resources/
├── routes/
├── storage/
├── tests/
├── .env.example          Environment template
├── artisan
├── composer.json
├── composer.lock
├── LICENSE
├── PROJECT.md
└── README.md             This file
```

The ZIP does **not** contain `vendor/`, `node_modules/`, `.env`, logs, or session/cache files. They are generated during installation.

---

## Installation on a fresh server

The examples below use Ubuntu/Debian and the domain `billing.example.com`. Replace it with your own domain or server IP.

### 1. Install server packages

```bash
sudo apt update
sudo apt install -y nginx mysql-server composer unzip curl \
  php8.3-fpm php8.3-cli php8.3-mysql php8.3-mbstring php8.3-xml \
  php8.3-curl php8.3-zip php8.3-gd php8.3-intl php8.3-bcmath
```

> On distributions where PHP 8.3 is not in the default repository, add the
> `ondrej/php` PPA first:
>
> ```bash
> sudo add-apt-repository ppa:ondrej/php
> sudo apt update
> ```

Start and enable the services:

```bash
sudo systemctl enable --now nginx mysql php8.3-fpm
```

### 2. Create the database

Log in to MySQL as an administrator:

```bash
sudo mysql
```

Run:

```sql
CREATE DATABASE minispro
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

CREATE USER 'minispro'@'localhost'
  IDENTIFIED BY 'CHANGE_THIS_PASSWORD';

CREATE USER 'minispro'@'127.0.0.1'
  IDENTIFIED BY 'CHANGE_THIS_PASSWORD';

GRANT ALL PRIVILEGES ON minispro.* TO 'minispro'@'localhost';
GRANT ALL PRIVILEGES ON minispro.* TO 'minispro'@'127.0.0.1';

FLUSH PRIVILEGES;
EXIT;
```

Use a strong password — never use the MySQL `root` account for the application.

### 3. Upload and extract the project

Upload the ZIP to the server, then:

```bash
cd /var/www
sudo unzip minispro.zip
cd /var/www/minispro
```

Set ownership (adjust `www-data` if your web server uses another user):

```bash
sudo chown -R www-data:www-data /var/www/minispro
```

### 4. Install PHP dependencies

```bash
cd /var/www/minispro
sudo -u www-data composer install --no-dev --optimize-autoloader
```

If `composer` is not installed:

```bash
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
```

### 5. Configure `.env`

```bash
cd /var/www/minispro
sudo -u www-data cp .env.example .env
sudo -u www-data php artisan key:generate
```

Edit `.env`:

```bash
sudo nano .env
```

Minimum production settings:

```dotenv
APP_NAME="minispro"
APP_ENV=production
APP_DEBUG=false
APP_URL=https://billing.example.com
APP_TIMEZONE=Asia/Dhaka

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=minispro
DB_USERNAME=minispro
DB_PASSWORD=CHANGE_THIS_PASSWORD

SESSION_DRIVER=database
SESSION_DOMAIN=
SESSION_COOKIE=minispro_session

CACHE_STORE=file
CACHE_PREFIX=minispro_
QUEUE_CONNECTION=database

FILESYSTEM_DISK=public
MAIL_MAILER=log
MFS_SMS_TOKEN=change-me
```

> `APP_URL` must match the URL users open in the browser.
> Set `APP_DEBUG=false` in production.
> If you use HTTPS, set `APP_URL=https://...`.

### 6. Import the demo database

The bundled demo SQL contains the complete schema plus:

- Super Admin and Reseller accounts
- Roles and permissions
- Site settings
- Three example packages
- 54 database tables

Import it:

```bash
cd /var/www/minispro
mysql -u minispro -p minispro < database/demo.sql
```

Enter the database password you created in step 2.

> The demo dump intentionally contains **no** live routers, PPP secrets,
> customers, payment credentials or logs. Add your own after login.

If you prefer an empty database without demo packages, run migrations instead:

```bash
sudo -u www-data php artisan migrate --force
sudo -u www-data php artisan db:seed --class=SuperAdminSeeder --force
```

### 7. Storage link and permissions

```bash
cd /var/www/minispro
sudo -u www-data php artisan storage:link
sudo chown -R www-data:www-data storage bootstrap/cache
sudo chmod -R 775 storage bootstrap/cache
```

### 8. Quick test with PHP's built-in server

Before configuring Nginx, verify that the app works:

```bash
cd /var/www/minispro
sudo -u www-data php artisan serve --host=0.0.0.0 --port=8000
```

Open `http://SERVER_IP:8000` — you should see the landing page and the
**Go to Login** button. Stop the server with `Ctrl+C` when finished.

### 9. Production web server (Nginx)

Create `/etc/nginx/sites-available/minispro`:

```nginx
server {
    listen 80;
    server_name billing.example.com;
    root /var/www/minispro/public;

    index index.php;
    charset utf-8;

    client_max_body_size 20M;

    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-Content-Type-Options "nosniff";

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    error_page 404 /index.php;

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.3-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        fastcgi_param DOCUMENT_ROOT $realpath_root;
    }

    location ~ /\.(?!well-known).* {
        deny all;
    }
}
```

Enable it and reload Nginx:

```bash
sudo ln -s /etc/nginx/sites-available/minispro /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
```

For HTTPS:

```bash
sudo apt install -y certbot python3-certbot-nginx
sudo certbot --nginx -d billing.example.com
```

Then set `APP_URL=https://billing.example.com` in `.env` and run:

```bash
sudo -u www-data php artisan config:clear
```

### 10. Queue worker (Supervisor)

SMS, notifications and background jobs need a queue worker.

```bash
sudo apt install -y supervisor
```

Create `/etc/supervisor/conf.d/minispro.conf`:

```ini
[program:minispro-queue]
process_name=%(program_name)s_%(process_num)02d
command=php /var/www/minispro/artisan queue:work --sleep=3 --tries=3 --max-time=3600
autostart=true
autorestart=true
stopasgroup=true
killasgroup=true
user=www-data
numprocs=1
redirect_stderr=true
stdout_logfile=/var/www/minispro/storage/logs/queue.log
stopwaitsecs=3600
```

Reload Supervisor:

```bash
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start minispro-queue:*
```

### 11. Scheduler (cron)

The scheduler generates monthly bills, expires users and runs maintenance jobs.

```bash
sudo crontab -u www-data -e
```

Add:

```cron
* * * * * cd /var/www/minispro && php artisan schedule:run >> /dev/null 2>&1
```

### Final optimisation

```bash
cd /var/www/minispro
sudo -u www-data php artisan optimize:clear
sudo -u www-data php artisan config:cache
sudo -u www-data php artisan route:cache
sudo -u www-data php artisan view:cache
```

---

## Default login credentials

Open:

```
https://billing.example.com/login
```

| Role | Email | Password |
|---|---|---|
| Super Admin | `admin@minispro.local` | `minispro` |
| Reseller | `reseller@minispro.local` | `password` |

> **Change both passwords immediately after your first login.**

Customer portal:

```
https://billing.example.com/portal
```

---

## First things to do after login

1. Go to **Settings → Site Settings** and set:
   - Site name and title
   - Logo and favicon
   - Currency, timezone and locale
   - Customer ID prefix
2. Change the Super Admin email and password.
3. Delete or change the demo Reseller account.
4. Create your real packages (**Packages**).
5. Add your MikroTik router (**MikroTik Setup**).
6. Import PPPoE users from the router.
7. Configure payment gateways and SMS if needed.

---

## MikroTik setup and user import

### Create a MikroTik API user

On the router (RouterOS terminal):

```routeros
/user group add name=api-read write policy=read,api,ssh,test,winbox
/user add name=billing password=CHOOSE_A_STRONG_PASSWORD group=api-read

/ip service enable api
/ip service set api port=8728
/ip service enable ssh
```

For API-SSL, enable `api-ssl` and use port `8729`.

### Add the router in the panel

1. Open **MikroTik Setup** from the sidebar.
2. Enter router name, IP address, API port (usually `8728`), SSH port (`22`), username and password.
3. Turn the connection toggle **on**.
4. Click **Data Sync** to import PPPoE secrets.

### What the import does

For every PPP secret on the router, the application:

- Creates or updates the synced PPP record
- Creates the customer record if it does not exist
- Creates billing and official records
- Matches the PPP **profile** to a package:
  - router-specific package first
  - global package second
- Copies the package price into the customer's monthly rent
- Mirrors the router state: `active` → active, `disabled` → disable

Re-running sync repairs older imports that were created without a package,
rent or official record.

> Package/profile names must match. For example, a PPP profile named `10M`
> should have a package named `10M` for automatic rent assignment.

### Billing after import

Newly imported active users appear as **active** customers and are included in
the normal monthly billing run. Imported users that are disabled on the router
appear as **disable**. You can edit any customer to set a package, rent,
discount, advance or due date.

Use **Customer Summary**, **Payment Collection** and **Reports** to manage
billing day to day.

---

## Billing workflow

1. **Create packages** — name, price, speed and MikroTik rate limit.
2. **Add or import customers** — each customer gets a unique ID, billing record
   and official record.
3. **Generate bills** — the scheduler runs automatically, or use the manual
   bill generation action.
4. **Collect payments** — record cash, bKash, Nagad, bank or gateway payments.
5. **Monitor dues** — use customer filters and reports.
6. **Auto-disable** — expired customers can be disabled on the router
   automatically by the scheduled tasks.

---

## Payment gateways and SMS

### Payment gateways

Go to **Settings → Payment Gateways**. Each gateway supports sandbox and live
credentials. Credentials are encrypted with your installation's `APP_KEY`.

> If you ever regenerate `APP_KEY`, saved gateway credentials must be re-entered.

### SMS

Go to **SMS Setup**. Configure your SMS gateway and templates. The MFS SMS
forwarder webhook uses `MFS_SMS_TOKEN` from `.env` — change the default value.

---

## Backup and restore

### Database backup

```bash
mysqldump -u minispro -p --single-transaction minispro \
  > backup-$(date +%F-%H%M).sql
```

### Database restore

```bash
mysql -u minispro -p minispro < backup-2026-01-01-1200.sql
```

### Files backup

Back up:

```
/var/www/minispro/.env
/var/www/minispro/storage/app/public
```

Keep `APP_KEY` safe. It is required to decrypt stored router and gateway
credentials.

---

## Updating the application

```bash
cd /var/www/minispro
sudo -u www-data php artisan down
sudo -u www-data composer install --no-dev --optimize-autoloader
sudo -u www-data php artisan migrate --force
sudo -u www-data php artisan optimize:clear
sudo -u www-data php artisan config:cache
sudo -u www-data php artisan route:cache
sudo -u www-data php artisan view:cache
sudo -u www-data php artisan up
```

---

## Troubleshooting

| Problem | Solution |
|---|---|
| `500 Server Error` | Check `storage/logs/laravel.log`; ensure `storage` and `bootstrap/cache` are writable by `www-data`. |
| `could not find driver` | Install `php8.3-mysql` and restart PHP-FPM. |
| `Access denied for user` | Check `DB_USERNAME` / `DB_PASSWORD` in `.env` and the MySQL user grants. |
| Blank page / assets missing | Run `php artisan storage:link`; ensure `public/build` exists. |
| Login redirects back to login | Check `APP_URL`, `SESSION_DOMAIN` (must be empty or match the domain) and clear config cache. |
| Changes not visible | Run `php artisan optimize:clear`. |
| Queue jobs not running | Check Supervisor status and `storage/logs/queue.log`. |
| Scheduler not running | Verify the cron entry and run `php artisan schedule:run` manually. |
| MikroTik connection failed | Check API/SSH service, firewall, port and router credentials. |
| Imported users show no package/rent | Package name must match the PPP profile name; re-run sync after creating the package. |
| Cannot delete a router | The delete action now removes its synced PPP secrets and router-scoped data transactionally. Packages are kept as global packages. |

---

## Security checklist

- [ ] `APP_ENV=production` and `APP_DEBUG=false`
- [ ] Use HTTPS
- [ ] Change the default admin and reseller passwords
- [ ] Use a dedicated MySQL user, not `root`
- [ ] Never commit `.env` or database dumps containing real customer data
- [ ] Keep `APP_KEY` backed up and private
- [ ] Change `MFS_SMS_TOKEN`
- [ ] Restrict MikroTik API/SSH access to the application server IP
- [ ] Keep regular off-server backups
- [ ] Keep PHP, MySQL and the application updated

---

## License

This project is distributed under the **AGPL-3.0** license. See [`LICENSE`](LICENSE).

**Modified by johirxofficial.**
