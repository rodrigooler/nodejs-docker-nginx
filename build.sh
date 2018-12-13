cd server
docker build -t load-balanced-app .
cd ..

cd nginx
docker build -t load-balance-nginx .
cd ..