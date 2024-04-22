# Nginx
FROM	debian:bullseye

# System setting
#RUN	apt update && apt upgrade -y && apt install wget -y
RUN	apt update

# debugging
RUN	apt install vim -y

# Nginx install
RUN	apt install nginx -y

COPY	./tools/nginx.conf /etc/nginx/conf.d/

RUN	rm /etc/nginx/sites-available/default && rm /etc/nginx/sites-enabled/default
	
CMD	["nginx", "-g", "daemon off;"]
