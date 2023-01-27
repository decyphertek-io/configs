# nginx
cp /home/mastodon/live/dist/nginx.conf /etc/nginx/sites-available/mastodon
ln -s /etc/nginx/sites-available/mastodon /etc/nginx/sites-enabled/mastodon
# to replace example.com with your own domain name, 
vim /etc/nginx/sites-available/mastodon
# Reload nginx for the changes to take effect:
systemctl reload nginx
# certbot --nginx -d example.com
cp /home/mastodon/live/dist/mastodon-*.service /etc/systemd/system/
$EDITOR /etc/systemd/system/mastodon-*.service
systemctl daemon-reload
systemctl enable --now mastodon-web mastodon-sidekiq mastodon-streaming

