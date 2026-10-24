#!/usr/bin/env bash
# Install/refresh the systemd user services for this project.
set -e
cd "$(dirname "$0")/.."
PROJECT_DIR="$(pwd)"
mkdir -p ~/.config/systemd/user
for unit in isp-billing.service isp-billing-queue.service isp-billing-scheduler.service; do
    sed "s|WorkingDirectory=.*|WorkingDirectory=$PROJECT_DIR|" "deploy/systemd/$unit" > "$HOME/.config/systemd/user/$unit"
done
systemctl --user daemon-reload
systemctl --user enable --now isp-billing.service isp-billing-queue.service isp-billing-scheduler.service
loginctl enable-linger "$USER" || true
systemctl --user --no-pager status isp-billing.service isp-billing-queue.service isp-billing-scheduler.service | grep -E "●|Active:" || true
