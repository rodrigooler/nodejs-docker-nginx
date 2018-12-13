FROM nginx

RUN mkdir /etc/nginx/sites-available
RUN mkdir /etc/nginx/nginxconfig.io
RUN mkdir /etc/nginx/sites-enabled

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY example.com.conf /etc/nginx/sites-available/example.com.conf
COPY letsencrypt.conf /etc/nginx/nginxconfig.io/letsencrypt.conf
COPY general.conf /etc/nginx/nginxconfig.io/general.conf
COPY proxy.conf /etc/nginx/nginxconfig.io/proxy.conf

# Virtual host: create symbolic link
RUN ln -s /etc/nginx/sites-available/example.com.conf /etc/nginx/sites-enabled/example.com.conf

# HTTPS - certbot (before first run): create ACME-challenge common directory
RUN www-data sh -c "mkdir -p /var/www/_letsencrypt"

# HTTPS - certbot (before first run): disable SSL directives
RUN -i -r 's/(listen .*443)/\1;#/g; s/(ssl_(certificate|certificate_key|trusted_certificate) )/#;#\1/g' /etc/nginx/sites-available/example.com.conf

# HTTPS - certbot: obtain certificates
RUN certbot certonly --webroot -d example.com --email info@example.com -w /var/www/_letsencrypt -n --agree-tos --force-renewal

# HTTPS - certbot (after first run): enable SSL directives
RUN sed -i -r 's/#?;#//g' /etc/nginx/sites-available/example.com.conf