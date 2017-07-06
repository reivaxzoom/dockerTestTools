FROM ubuntu:16.04

RUN apt-get -y update 
RUN apt-get -y install openssh-server 
RUN apt-get -y install git

# Setting openssh
RUN mkdir /var/run/sshd
#RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config

RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]









# Adding git user
# RUN adduser --system git
# RUN echo "git:docker!" | chpasswd
# RUN mkdir -p /home/git/.ssh

# ADD id_rsa_fxpazmino.pub /home/git/.ssh/id_rsa_fxpazmino
# RUN chmod 700 /home/git/.ssh/id_rsa_fxpazmino
# #RUN echo "Host github.com\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config


# # Clearing and setting authorized ssh keys
# RUN echo '' > /home/git/.ssh/authorized_keys
# RUN cat /home/git/.ssh/id_rsa_fxpazmino >> /home/git/.ssh/authorized_keys
# #RUN echo 'Second SSH public key' >> /home/git/.ssh/authorized_keys
# # ...

# # Updating shell to bash
# RUN sed -i s#/home/git:/bin/false#/home/git:/bin/bash# /etc/passwd

# EXPOSE 22
# CMD ["/usr/sbin/sshd", "-D"]