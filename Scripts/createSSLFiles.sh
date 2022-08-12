rm -rf ca-* cert-* kafka.*

keytool -keystore kafka.zookeeper.keystore.jks -alias zookeeper -keyalg RSA -validity 3650 -genkey -deststoretype pkcs12 -storepass {{password}} -keypass {{password}} -dname "CN={{fqdn hostname}},OU={{Organization Unit}},O={{Organization}},L={{Your Locality}}, ST={{Your state}},C={{Your two character country code}}" -ext SAN=DNS:localhost,DNS:{{Add all possible domain names}},DNS:{{Add all possible domain names}},DNS:{{Add all possible domain names}}

keytool -keystore kafka.zookeeper-client.keystore.jks -alias zookeeper-client -keyalg RSA -validity 3650 -genkey -deststoretype pkcs12 -storepass {{password}} -keypass {{password}} -dname "CN={{fqdn hostname}},OU={{Organization Unit}},O={{Organization}},L={{Your Locality}}, ST={{Your state}},C={{Your two character country code}}" -ext SAN=DNS:localhost,DNS:{{Add all possible domain names}},DNS:{{Add all possible domain names}},DNS:{{Add all possible domain names}}

keytool -keystore kafka.brokerzero.keystore.jks -alias brokerzero -keyalg RSA -validity 3650 -genkey -deststoretype pkcs12 -storepass {{password}} -keypass {{password}} -dname "CN={{fqdn hostname}},OU={{Organization Unit}},O={{Organization}},L={{Your Locality}}, ST={{Your state}},C={{Your two character country code}}" -ext SAN=DNS:localhost,DNS:{{Add all possible domain names}},DNS:{{Add all possible domain names}},DNS:{{Add all possible domain names}}

keytool -keystore kafka.brokerone.keystore.jks -alias brokerone -keyalg RSA -validity 3650 -genkey -deststoretype pkcs12 -storepass {{password}} -keypass {{password}} -dname "CN={{fqdn hostname}},OU={{Organization Unit}},O={{Organization}},L={{Your Locality}}, ST={{Your state}},C={{Your two character country code}}" -ext SAN=DNS:localhost,DNS:{{Add all possible domain names}},DNS:{{Add all possible domain names}},DNS:{{Add all possible domain names}}

keytool -keystore kafka.brokertwo.keystore.jks -alias brokertwo -keyalg RSA -validity 3650 -genkey -deststoretype pkcs12 -storepass {{password}} -keypass {{password}} -dname "CN={{fqdn hostname}},OU={{Organization Unit}},O={{Organization}},L={{Your Locality}}, ST={{Your state}},C={{Your two character country code}}" -ext SAN=DNS:localhost,DNS:{{Add all possible domain names}},DNS:{{Add all possible domain names}},DNS:{{Add all possible domain names}}

openssl req -new -x509 --keyout ca-key -out ca-cert -days 3650

keytool -keystore kafka.zookeeper.truststore.jks -alias CARoot -importcert -file ca-cert -storepass {{password}}
keytool -keystore kafka.zookeeper.keystore.jks -alias zookeeper -certreq -file cert-file-zookeeper -storepass {{password}}
openssl x509 -req -CA ca-cert -CAkey ca-key -in cert-file-zookeeper -out cert-signed-zookeeper -days 3650 -CAcreateserial -passin pass:{{password}}
keytool -keystore kafka.zookeeper.keystore.jks -alias CARoot -importcert -file ca-cert -storepass {{password}}
keytool -keystore kafka.zookeeper.keystore.jks -alias zookeeper -importcert -file cert-signed-zookeeper -storepass {{password}}

keytool -keystore kafka.zookeeper-client.truststore.jks -alias CARoot -importcert -file ca-cert -storepass {{password}}
keytool -keystore kafka.zookeeper-client.keystore.jks -alias zookeeper-client -certreq -file cert-file-zookeeper-client -storepass {{password}}
openssl x509 -req -CA ca-cert -CAkey ca-key -in cert-file-zookeeper-client -out cert-signed-zookeeper-client -days 3650 -CAcreateserial -passin pass:{{password}}
keytool -keystore kafka.zookeeper-client.keystore.jks -alias CARoot -importcert -file ca-cert -storepass {{password}}
keytool -keystore kafka.zookeeper-client.keystore.jks -alias zookeeper-client -importcert -file cert-signed-zookeeper-client -storepass {{password}}

keytool -keystore kafka.brokerzero.truststore.jks -alias CARoot -importcert -file ca-cert -storepass {{password}}
keytool -keystore kafka.brokerzero.keystore.jks -alias brokerzero -certreq -file cert-file-brokerzero -storepass {{password}}
openssl x509 -req -CA ca-cert -CAkey ca-key -in cert-file-brokerzero -out cert-signed-brokerzero -days 3650 -CAcreateserial -passin pass:{{password}}
keytool -keystore kafka.brokerzero.keystore.jks -alias CARoot -importcert -file ca-cert -storepass {{password}}
keytool -keystore kafka.brokerzero.keystore.jks -alias brokerzero -importcert -file cert-signed-brokerzero -storepass {{password}}

keytool -keystore kafka.brokerone.truststore.jks -alias CARoot -importcert -file ca-cert -storepass {{password}}
keytool -keystore kafka.brokerone.keystore.jks -alias brokerone -certreq -file cert-file-brokerone -storepass {{password}}
openssl x509 -req -CA ca-cert -CAkey ca-key -in cert-file-brokerone -out cert-signed-brokerone -days 3650 -CAcreateserial -passin pass:{{password}}
keytool -keystore kafka.brokerone.keystore.jks -alias CARoot -importcert -file ca-cert -storepass {{password}}
keytool -keystore kafka.brokerone.keystore.jks -alias brokerone -importcert -file cert-signed-brokerone -storepass {{password}}


keytool -keystore kafka.brokertwo.truststore.jks -alias CARoot -importcert -file ca-cert -storepass {{password}}
keytool -keystore kafka.brokertwo.keystore.jks -alias brokertwo -certreq -file cert-file-brokertwo -storepass {{password}}
openssl x509 -req -CA ca-cert -CAkey ca-key -in cert-file-brokertwo -out cert-signed-brokertwo -days 3650 -CAcreateserial -passin pass:{{password}}
keytool -keystore kafka.brokertwo.keystore.jks -alias CARoot -importcert -file ca-cert -storepass {{password}}
keytool -keystore kafka.brokertwo.keystore.jks -alias brokertwo -importcert -file cert-signed-brokertwo -storepass {{password}}


rm -rf ca-cert.srl cert-file-* cert-signed-*




