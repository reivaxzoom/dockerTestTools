FROM ubuntu:14.04

RUN apt-get -y update
RUN apt-get -y install openssh-server
RUN apt-get -y install git

# Setting openssh
RUN mkdir /var/run/sshd
RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config

# Adding git user
RUN adduser --system git
RUN mkdir -p /home/git/.ssh

# Clearing and setting authorized ssh keys
RUN echo '' > /home/git/.ssh/authorized_keys
RUN echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDUkgzOaF6TqAWLhcK8EJ4j0aigimnphflV0MA+qFTQTxg66Xjrbo/DBsum0x3SYIvPCoHg8nw6wBz3fONowqAl+83nuSdnhHZyqvKJfLUANThL8tSmMMacleJmjz/ShyqqQq4bGKwfNE4CQ/Q5xqgT/s0Nh4KeGJ4Fb9Ab2Agm7haU5khyuvPvxVB957JFTKQMfKS4JV1WcqqL2BxXk1I0t4tLwO3HcoG44KKebT0qKrmddnoiHl59+hdCuxsoyaCZXrOJQGQvcOoa9Zffeo38LJLSlgA0vfmKLBsdoBJlyFzSvDZvDay0SeYE7vS+56o8axPoKIhSIfdlHem1cv96CUBpq1OKfq+Va9J2bnjPy1wYL21CBY5UNX9NJhkttCbtHo16jrhQec13LEAIBxUhBpb1ZKttptiuyRU0J9dx7igiRpJ+HQRLoGhFiVqYT90VfR0NS7D8lWK8Fr2i9v/GQZvilvtOa7oTky2wtQcCVZAfduwsnTixag3VU6XrnHAJh3k1L0LqRNTAtwPLmeKdSDpQ0+AcSOwfTIS6KcPl7ZJW1Y9dlntN35Oc21jz2gynXzw6ahdi598oVY69PQ5FtjRfXaSSwMAJx8FjBxfS3W7P7mV64ciojO0C4CrXKwBffbCxIlZvefAR/v9dN6L612Yu0ucaQHrR4hcBIYaA8w== francisco.pazmino@quito.gob.ec' >> /home/git/.ssh/authorized_keys
#RUN echo 'Second SSH public key' >> /home/git/.ssh/authorized_keys
# ...

# Updating shell to bash
RUN sed -i s#/home/git:/bin/false#/home/git:/bin/bash# /etc/passwd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]