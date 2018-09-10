FROM r.philpep.org/debian:stretch-slim
RUN apt-get -y update && apt-get -t stretch-backports -y install check-mk-raw-1.5.0p3
RUN apt-get -y update && apt-get -y install cron openssh-client vim-nox
RUN omd create --no-autostart philpep || true
RUN omd config philpep set DEFAULT_GUI check_mk
RUN omd config philpep set TMPFS off
RUN omd config philpep set CRONTAB on
RUN omd config philpep set APACHE_TCP_ADDR 0.0.0.0
RUN omd config philpep set APACHE_TCP_PORT 5000
RUN ln -s /omd/sites/philpep/var/log/nagios.log /var/log/nagios.log
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 5000/tcp
CMD ["/start.sh"]
