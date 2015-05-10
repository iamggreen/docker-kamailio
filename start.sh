#export SIP_DOMAIN=$(head -1 /etc/hosts | cut -f1)
export SIP_DOMAIN=sip.iamggreen.com

/etc/init.d/mysql start
echo root | kamdbctl create
echo kamailiorw | kamctl add user1@$SIP_DOMAIN abc123
echo kamailiorw | kamctl add user2@$SIP_DOMAIN abc123
echo kamailiorw | kamctl add user3@$SIP_DOMAIN abc123
echo kamailiorw | kamctl add user4@$SIP_DOMAIN abc123
echo kamailiorw | kamctl add user5@$SIP_DOMAIN abc123
echo kamailiorw | kamctl add user6@$SIP_DOMAIN abc123
echo kamailiorw | kamctl add user7@$SIP_DOMAIN abc123
echo kamailiorw | kamctl add user8@$SIP_DOMAIN abc123
echo kamailiorw | kamctl add user9@$SIP_DOMAIN abc123
echo kamailiorw | kamctl add user10@$SIP_DOMAIN abc123

/usr/sbin/kamailio -DD -P /var/run/kamailio.pid -f /etc/kamailio/kamailio.cfg
#/bin/bash
