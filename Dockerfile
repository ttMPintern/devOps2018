FROM macpaw/internship
EXPOSE 80/tcp

RUN apt-get update && apt-get install -y  logrotate
###  Install zip is not needed, zip / unzip is already installed in the image
COPY files/*  /app/
RUN sed -i 's/localhost/ internship.macpaw.io/g' /etc/nginx/conf.d/nginx.conf
###### password  was calculated and alternatively was found in history of your image
RUN  unzip -P 1242 -j /tmp/additional.zip  -d /app

### part of  additional task
COPY files/logrotate.conf /etc/logrotate.d/logrotate.conf
RUN chmod 644 /etc/logrotate.d/logrotate.conf  
RUN logrotate -v -f /etc/logrotate.d/

RUN chmod +x /app/myip.sh && /app/myip.sh
# public IP - on internship.macpaw.io/ip by files ip.html(auto generate by myip.sh) and main.py
