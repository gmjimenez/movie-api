FROM ubuntu:20.04
ARG NAME="base-files-11ubuntu4"
#Describe the directory name to be built
ARG UID=65587
#With a large value so as not to conflict
RUN sed -i"" -e 's%http://[^ ]\+%mirror://mirrors.ubuntu.com/mirrors.txt%g' /etc/apt/sources.list \
&& apt-get update \
&& apt-get -y upgrade \
&& apt-get install -y --no-install-recommends build-essential devscripts zstd gawk libc6 libcrypt1 debhelper dh-systemd apt-utils sudo \
&& rm -rf /tmp/* /var/tmp/* \
&& apt-get clean
#Install dependencies

RUN echo "root:root" | chpasswd && \
    adduser --disabled-password --uid ${UID} --gecos "" docker && \
    echo "docker:docker" | chpasswd && \
    echo "%docker    ALL=(ALL)   NOPASSWD:    ALL" >> /etc/sudoers.d/docker && \
    chmod 0440 /etc/sudoers.d/docker
#Creating a user that sudo can use without entering a password

RUN mkdir -p /debuild/build /deb 
ADD ./${NAME} /debuild/build/${NAME}
ADD ./debuild.sh /debuild/debuild.sh
RUN chmod +x /debuild/debuild.sh \
&& chown -R docker:docker /debuild
USER ${UID}
WORKDIR /debuild
CMD ["./debuild.sh"]