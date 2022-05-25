FROM msdehghan/gezel:2.5.1
COPY ./arm-linux-gcc-3.2.deb .
RUN dpkg -i ./arm-linux-gcc-3.2.deb
RUN apt-get update
RUN apt-get install nano
RUN rm ./arm-linux-gcc-3.2.deb
RUN echo 'export PATH=$PATH:/usr/local/arm/bin'>> ~/.bashrc