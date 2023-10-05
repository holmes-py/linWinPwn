FROM ubuntu:22.04

LABEL maintainer="Hardeep Singh <https://github.com/holmes-py>"
LABEL version="0.1"
LABEL description="This is docker installation for original linWinPwn by lefayjey."

# Some configs to fix apt issues
ENV TZ=US/Eastern
ENV PATH=/root/.local/bin:$PATH
COPY . /data
COPY krb5.conf /etc/
WORKDIR /data

RUN chmod +x docker-install.sh 
RUN bash docker-install.sh
RUN chmod +x linWinPwn.sh

ENTRYPOINT [ "/data/linWinPwn.sh" ]