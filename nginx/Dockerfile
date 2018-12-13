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