FROM teeyeeyang/terra-core:latest

EXPOSE 8080
EXPOSE 26656
EXPOSE 26657

ADD https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.1/s6-overlay-amd64-installer /tmp/
RUN chmod +x /tmp/s6-overlay-amd64-installer && /tmp/s6-overlay-amd64-installer /
RUN apt-get update -y && apt-get -y install openssh-server
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ""
ADD ssh/ssh /root/ssh.sh
RUN chmod 755 /root/ssh.sh


ENTRYPOINT ["/root/ssh.sh"]

