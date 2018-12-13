FROM nginx

RUN rm /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/sites-available/example.com.conf
RUN rm /etc/nginx/nginxconfig.io/letsencrypt.conf
RUN rm /etc/nginx/nginxconfig.io/general.conf
RUN rm /etc/nginx/nginxconfig.io/proxy.conf

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY example.com.conf /etc/nginx/sites-available/example.com.conf
COPY letsencrypt.conf /etc/nginx/nginxconfig.io/letsencrypt.conf
COPY general.conf /etc/nginx/nginxconfig.io/general.conf
COPY proxy.conf /etc/nginx/nginxconfig.io/proxy.conf

# Virtual host: create symbolic link
RUN ln -s /etc/nginx/sites-available/example.com.conf /etc/nginx/sites-enabled/example.com.conf

# HTTPS - certbot (before first run): create ACME-challenge common directory
RUN sudo -u www-data sh -c "mkdir -p /var/www/_letsencrypt"

# HTTPS - certbot (before first run): disable SSL directives
RUN -i -r 's/(listen .*443)/\1;#/g; s/(ssl_(certificate|certificate_key|trusted_certificate) )/#;#\1/g' /etc/nginx/sites-available/example.com.conf

# HTTPS - certbot: obtain certificates
RUN certbot certonly --webroot -d example.com --email info@example.com -w /var/www/_letsencrypt -n --agree-tos --force-renewal

# HTTPS - certbot (after first run): enable SSL directives
RUN sed -i -r 's/#?;#//g' /etc/nginx/sites-available/example.com.conf