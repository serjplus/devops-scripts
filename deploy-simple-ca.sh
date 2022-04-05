#!/bin/sh
mkdir /root/ca
cd /root/ca
pwd
mkdir newcerts certs crl private requests
touch index.txt
echo '1234' > serial
ls -la

cat >> /root/ca/openssl.conf <<EOF
###############
#openssl.conf
#############

[ca]
default_ca    = kocharyan_net_ca

# default section for "ca" command options
[kocharyan_net_ca]
dir = /root/ca
default_days    = 730          # how long to certify for
new_certs_dir = /root/ca/certs
database      = /root/ca/index.txt
default_md    = sha256 # use SHA-256 for Signatures
policy        = kocharyan_net_ca_policy
serial        = /root/ca/serial
private_key   = /root/ca/private/cakey.pem
certificate = /root/ca/certs/rootcacert.pem
crldir		= /root/ca/crl
crlnumber	= /root/ca/crlnumber
crl		= /root/ca/crl/crl.pem
email_in_dn    = postmaster@kocharyan.net

[kocharyan_net_ca_policy]
countryName             = match
stateOrProvinceName     = match
localityName            = supplied
organizationName        = match
organizationalUnitName  = optional
commonName              = supplied
emailAddress            = optional

[req]
  
default_bits = 2048
prompt = no
default_md = sha256 # use SHA-256 for Signatures
x509_extensions		= v3_ca
distinguished_name = dn
req_extensions = v3_req

[dn]

C=US
ST=California
L=San Jose
O=SergeyK, Inc.
OU = IT
emailAddress=info@kocharyan.net
CN = www.kocharyan.net
[v3_req]

keyUsage = keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName      = @alternate_names


[alternate_names ]

DNS.1        = kocharyan.net
DNS.2        = test.kocharyan.net
DNS.3        = git.kocharyan.net
DNS.4        = smtp.kocharyan.net
DNS.5        = mail.kocharyan.net
DNS.6       = www.kocharyan.net
DNS.7	    = cloud.kocharyan.net
EOF


#openssl genrsa -aes256 -out /root/ca/private/cakey.pem 4096
#openssl req -new -x509 -key /root/ca/private/cakey.pem -out /root/ca/certs/rootcacert.pem -days 3650 -set_serial 0
#cd /root/ca/requests/
#openssl genrsa -aes256 -out firstcert.mydomain.net.pem 2048

#openssl req -new -key firstcert.mydomain.net.pem -out firstcert.mydomain.net.csr --config /root/ca/openssl.conf
#openssl ca -in firstcert.mydomain.net.csr -out firstcert.mydomain.net.crt --config /root/ca/openssl.conf
#mv firstcert.mydomain.net.pem /root/ca/private/
#mv firstcert.mydomain.net.crt /root/ca/certs/
#rm firstcert.mydomain.net.csr
#chmod -R 600 /root/ca
#cat /root/ca/index.txt
#cat /root/ca/serial
#openssl rsa -in /root/ca/private/firstcert.mydomain.net.pem -out /root/ca/private/nop.firstcert.mydomain.net.pem



