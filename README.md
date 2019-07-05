# Openvpn self contained config files 

## Usage 

1. Create your keys and drop them in /var/local/openvpn-ca/keys/
- ca expected as ca.crt 
- cert expected as $username.crt 
- key expected as $username.key 
- ta expected as ta.key 

2. Execute script with username as first parameter
```console 
# ./make_config.sh narenas
``` 

3. *.ovpn file will be in $OUTPUT_DIR