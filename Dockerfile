FROM ubuntu
		
#Set the mysql root password when ap-get asks for it
RUN echo "mysql-server mysql-server/root_password password root" | sudo debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password root" | sudo debconf-set-selections

# Download the latest stable repository available		
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xfb40d3e6508ea4c8
RUN echo deb http://deb.kamailio.org/kamailio42 trusty main >> /etc/apt/sources.list
RUN echo deb-src http://deb.kamailio.org/kamailio42 trusty main >> /etc/apt/sources.list
RUN apt-get update -y
RUN apt-get install -y kamailio kamailio-mysql-modules kamailio-presence-modules kamailio-utils-modules kamailio-xml-modules kamailio-tls-modules mysql-client mysql-server

#Copy config files
COPY kamctlrc /etc/kamailio/kamctlrc
COPY kamailio.cfg /etc/kamailio/kamailio.cfg

#Copy in the startup script
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
				
# Expose the default SIP server port		
EXPOSE 5060
EXPOSE 5060/udp

CMD ["/bin/bash", "-c", "/usr/local/bin/start.sh"]		
# Set the default command to run when starting the container		
#CMD ["/usr/sbin/kamailio", "-DD","-P", "/var/run/kamailio.pid", "-f", "/etc/kamailio/kamailio.cfg"]

