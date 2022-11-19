ARG DISTRO="ubuntu:18.04"
FROM ${DISTRO}
ENTRYPOINT ["echo"]
CMD ["Hola CMD"]
RUN useradd -ms /bin/bash cloud_user
RUN mkdir /app
RUN cd /app && touch data.txt
COPY ./src /app/src
ADD file.tar.gz /com/src

USER cloud_user
RUN cd /home/cloud_user && touch data_user.txt 
