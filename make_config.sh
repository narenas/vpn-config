#!/bin/bash

# First argument: Client identifier

KEY_DIR=/var/local/openvpn-ca/keys
OUTPUT_DIR=/var/local/client-configs/files
BASE_CONFIG=/var/local/client-configs/base.conf

if [ ! -d ${OUTPUT_DIR} ] ;then 
    mkdir -p ${OUTPUT_DIR}
fi

cat ${BASE_CONFIG} \
    <(echo -e '<ca>') \
    ${KEY_DIR}/ca.crt \
    <(echo -e '</ca>\n<cert>') \
    ${KEY_DIR}/${1}.crt \
    <(echo -e '</cert>\n<key>') \
    ${KEY_DIR}/${1}.key \
    <(echo -e '</key>\n<tls-auth>') \
    ${KEY_DIR}/ta.key \
    <(echo -e '</tls-auth>') \
    > ${OUTPUT_DIR}/${1}.ovpn

echo "Configuración vpn casa" | mutt  -a "${OUTPUT_DIR}/${1}.ovpn" -s "openvpn certificate for ${1}" -- nicolas.arenas@gmail.com