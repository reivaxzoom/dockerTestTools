FROM ubuntu:14.04

RUN apt-get -y update
RUN apt-get -y install openssh-server
RUN apt-get -y install git

# Setting openssh
RUN mkdir /var/run/sshd
RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config

# Adding git user
RUN adduser --system git
RUN echo "git:docker!" | chpasswd
RUN mkdir -p /home/git/.ssh

# Clearing and setting authorized ssh keys
RUN echo '' > /home/git/.ssh/authorized_keys
RUN echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDg7u9FwioT4WTjFrnyTJD2eOp57MykMBDjY8LYJ0AQRSqgzVaHDiJgVIKIq6hF9sJ7JnVMuupNM3+P2nqVF/k6pddGasa+nzs5yrOxtnr/OiIfAWSU1rnS94HDHvK8MnMG9eVtye6JRu0ijLr1cZre8dH2NF7cLm91Sm84i1w3P+LhbjqN05U+J4Sc/ieMxLn1HVBqsugnNcrjCmxOVmhm1IP54gWPFel0wqHkslh8jt58HsqIw3qKjEgDjL9ue7B18thjg/nAeODFkagxjgRXM2gKgAFUOE6Nc/4N6vLgr2DN/qirnTXUdgqgSYQOR4/w8tRmPK/y63kWenGRIWN3t73ZmTq5d3KymzyLge2SbVOP4LiJVI/ZrvDBvsdPVZ24SO8+4XyVa73afHngl5Or4qoHiEN7MgV7XPrSEIi6pQAnv53HITDzl2MPUoDh5YPlBKq6Suf1nVEF6Drw8GLpbyFD0HAgrS2IxFhvV7THMIDc58eOsnQT7gAHLatg9f3n+jJ5UyrdPrsfN4eZoqhjpYlIExY7n/ghtFpcC++ju2fcQFE6szNJqiVEI1CGNXbGOwg7WvCBpOFMMlYDBdhXu0e+xT4chmkOq3OhL7s0RI/UET/Fnk8S943A/WfiTD94s0Xfred+c3cIPhkaXJCVXdlUBWrJur2p+5dbYOX3+w== francisco.pazmino@quito.gob.ec
' >> /home/git/.ssh/authorized_keys
#RUN echo 'Second SSH public key' >> /home/git/.ssh/authorized_keys
# ...

# Updating shell to bash
RUN sed -i s#/home/git:/bin/false#/home/git:/bin/bash# /etc/passwd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]