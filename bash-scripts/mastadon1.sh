# Pre-requisites
# A machine running Ubuntu 20.04 or Debian 11 that you have root access to
# A domain name (or a subdomain) for the Mastodon server, e.g. example.com
# An e-mail delivery service or other SMTP server
# You will be running the commands as root. If you aren’t already root, switch to root:
# System repositories
apt install -y curl wget gnupg apt-transport-https lsb-release ca-certificates
curl -sL https://deb.nodesource.com/setup_16.x | bash -
wget -O /usr/share/keyrings/postgresql.asc https://www.postgresql.org/media/keys/ACCC4CF8.asc
echo "deb [signed-by=/usr/share/keyrings/postgresql.asc] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/postgresql.list
apt update
apt install -y \
  imagemagick ffmpeg libpq-dev libxml2-dev libxslt1-dev file git-core \
  g++ libprotobuf-dev protobuf-compiler pkg-config nodejs gcc autoconf \
  bison build-essential libssl-dev libyaml-dev libreadline6-dev \
  zlib1g-dev libncurses5-dev libffi-dev libgdbm-dev \
  nginx redis-server redis-tools postgresql postgresql-contrib \
  certbot python3-certbot-nginx libidn11-dev libicu-dev libjemalloc-dev
corepack enable
yarn set version stable
adduser --disabled-login mastodon
sudo -u postgres psql
CREATE USER mastodon CREATEDB;
\q


