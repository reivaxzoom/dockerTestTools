!/bin/bash
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
# 
# Copyright (c) 2017 Oracle and/or its affiliates. All rights reserved.
if [[ -z $ADMIN_PASSWORD ]]; then
	ADMIN_PASSWORD=$(date| md5sum | fold -w 8 | head -n 1)
	echo "##########GENERATED ADMIN PASSWORD: $ADMIN_PASSWORD  ##########"
fi
echo "setting resources proteus"
asadmin create-jdbc-connection-pool --datasourceclassname com.microsoft.sqlserver.jdbc.SQLServerDataSource --restype jav$
asadmin create-jdbc-resource --connectionpoolid proteus jdbc/proteus
asadmin restart-domain domain1 && \
asadmin ping-connection-pool proteus && \
asadmin create-jms-resource --restype javax.jms.ConnectionFactory --description "Cola de mesajeria para proteus"  jms/pr$
asadmin create-jms-resource --restype javax.jms.Topic --property Name=proteusCargaMasivaTramiteQueue --description "Cola$
create-jms-resource --restype javax.jms.Topic --property Name=proteusCargaMasivaTramiteQueue --description "Cola geeraci$
create-jms-resource --restype javax.jms.Topic --property Name=proteusCargaMasivaTramiteQueue --description "Cola generac$
create-javamail-resource --mailhost 172.20.24.44 --mailuser sigen --description mailResourceProteus --fromaddress sigen@quito.gob.ec  &\\ 

exec "$@"
