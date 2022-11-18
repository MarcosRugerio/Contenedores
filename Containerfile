FROM ubuntu
ENV USER Mary
RUN mkdir /app
RUN cd /app && touch data.txt
COPY ./src /app/src
ADD file.tar.gz /com/src
