FROM macpaw/internship
EXPOSE 80/tcp
###  Install zip is not needed, zip / unzip is already installed in the image
RUN cp  /var/log/nginx/old.log /app/old.log
RUN apt-get update && apt-get install -y  logrotate
COPY files/*  /app/
RUN sed -i 's/localhost/ internship.macpaw.io/g' /etc/nginx/conf.d/nginx.conf

### part of  additional task - logrotate
COPY files/logrotate.conf /etc/logrotate.d/logrotate.conf
RUN chmod 644 /etc/logrotate.d/logrotate.conf
RUN logrotate -v -f /etc/logrotate.d/

# public IP - on internship.macpaw.io/ip by files ip.html(auto generate by myip.sh) and main.py
RUN chmod +x /app/myip.sh && /app/myip.sh

### password  was calculated and alternatively was found in history of your image: unzip -P 1242 -j /tmp/additional.zip  -d /app
RUN chmod +x /app/crack.sh && /app/crack.sh


