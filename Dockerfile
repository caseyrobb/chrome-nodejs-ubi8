FROM registry.access.redhat.com/ubi9/nodejs-20

USER 0

COPY *.repo /etc/yum.repos.d/

# Install Chrome
RUN curl https://dl.google.com/linux/linux_signing_key.pub -O && \
    curl https://www.centos.org/keys/RPM-GPG-KEY-CentOS-Official -O && \
		rpm --import RPM-GPG-KEY-CentOS-Official && \
		rpm --import linux_signing_key.pub && \
    #curl https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm -O && \
    dnf install -y xdg-utils liberation-fonts google-chrome && \
    dnf clean all && \
    rm -fv RPM-GPG-KEY-CentOS-Official && \
    rm -fv linux_signing_key.pub

USER 1001
