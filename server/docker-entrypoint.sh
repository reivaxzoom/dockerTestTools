!/bin/bash
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
# 
# Copyright (c) 2017 Oracle and/or its affiliates. All rights reserved.


asadmin create-jdbc-connection-pool --datasourceclassname com.microsoft.sqlserver.jdbc.SQLServerDataSource --restype javax.sql.DataSource --property user=migracion:password='migra$2k12':DatabaseName=proteus:ServerName=172.22.16.73:port=1433 proteus 
asadmin create-jdbc-resource --connectionpoolid proteus jdbc/proteus 
asadmin ping-connection-pool proteus  
asadmin create-jms-resource --restype javax.jms.ConnectionFactory --description "Cola de mesajeria para proteus"  jms/proteusConnectionFactory                                              
asadmin create-jms-resource --restype javax.jms.Topic --property Name=proteusCargaMasivaTramiteQueue --description "Cola carga masiva tramite" jms/proteusCargaMasivaTramiteQueue           
asadmin create-jms-resource --restype javax.jms.Topic --property Name=proteusCargaMasivaTramiteQueue --description "Cola geeracion de carga masiva claves" jms/proteusGenMasivaClavesQueue  
asadmin create-jms-resource --restype javax.jms.Topic --property Name=proteusCargaMasivaTramiteQueue --description "Cola generacion nomina" jms/proteusGeneracionNominaQueue                
asadmin create-javamail-resource --mailhost 172.20.24.44 --mailuser sigen --description mailResourceProteus --fromaddress sigen@quito.gob.ec mail/proteus                                   



exec "$@"
