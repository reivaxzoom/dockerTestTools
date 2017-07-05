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
RUN echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCoI+vzzOmy88Ns4MCDlkmvHE6HDl5iJKHdctZAxVHzNkZeJwTE0/zIiP4Z9ZF1eK2Fcsa1thz5FJrH5VBixz6ZFNdlFo59rbqkldEa986tjHV50MRl3b6cFLT0X7DY3I9sXZnJzARXlwXFzXR/PEaE8nf2vtIMXO46Q1O46AhW4eqKweddzT4E77nhyl/lxFEnfAesWN+Ak4Vi0mNBkZop2RC//mpc8SDv27r4jzBoJpnxlSppWL1l0xEyoTHwFjZuy1er5t0txDPVg22la2etimE1KPOpH70OtWktPNetyGKRpFjlv4rMJuRLmTA8CM5RMzGDT1x/X2lCt9Cco6zunh/AsI2tGCrAXxe1l1tjeC7O47YhlFgePk/CyLjbimmct/UZDIQPltC2Jk43C9tp+52BVgwQdVohNaM7r07qIhv0GGxUTbjxxZPGgPiKE4/oGrXU4yo09rht/cB6nattTzEVCw1oLDOF/B32Dmulh3BAhb46HWOY/cwLp65S3U8pzyVUPcmC29wxt9jQM50Qw416bux5s4OT3KqegMUBzx7dccpgFjl1P052V5VSv7NhyTQWEvqxiS9phixWItQ0PNIcwpuY9I3eINTgKnZzJpek72SwkqJ7srcoo5nG2bzL6d9V8QzcpXpV/10q+QwyEBMhIeErMFxVThmk+oNdlw== fxpazmino@quito.gob.ec' >> /home/git/.ssh/authorized_keys
#RUN echo 'Second SSH public key' >> /home/git/.ssh/authorized_keys
# ...

# Updating shell to bash
RUN sed -i s#/home/git:/bin/false#/home/git:/bin/bash# /etc/passwd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]