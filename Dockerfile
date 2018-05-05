FROM macpaw/internship
EXPOSE 80/tcp

RUN apt-get update && apt-get install -y  zip 
# logrotate

###  The next line is not needed, zip / unzip is already installed in the image
#RUN  apt-get install -y  zip
COPY files/*  /app/
RUN chmod +x /app/myip.sh && /app/myip.sh
RUN sed -i 's/localhost/ internship.macpaw.io/g' /etc/nginx/conf.d/nginx.conf

RUN  unzip -P 1242 -j /tmp/additional.zip  -d /app

