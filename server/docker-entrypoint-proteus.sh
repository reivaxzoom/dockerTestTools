!/bin/bash
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
# 
# Copyright (c) 2017 Oracle and/or its affiliates. All rights reserved.
#if [[ -z $ADMIN_PASSWORD ]]; then
	ADMIN_PASSWORD=$(date| md5sum | fold -w 8 | head -n 1)
	echo "##########GENERATED ADMIN PASSWORD: $ADMIN_PASSWORD  ##########"
#fi
#echo "setting resources proteus"
exec "$@"
