FROM ubuntu
ENV USER Mariela
RUN mkdir /app
RUN cd /app && touch data.txt
COPY ./src /app/src
ADD file.tar.gz /com/src 
