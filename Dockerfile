FROM ubuntu

# Set timezone.
ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install FWCloud by means of FWCloud-Installer.
RUN apt update
RUN apt install -y curl
RUN curl -k -s https://raw.githubusercontent.com/soltecsis/fwcloud-installer/main/fwcloud-installer.sh -o ./fwcloud-installer.sh
RUN bash ./fwcloud-installer.sh --docker
RUN rm -f ./fwcloud-installer.sh

EXPOSE 3030
CMD [ "systemctl", "start", "mysql", "fwcloud-api", "fwcloud-websrv", "fwcloud-updater" ]