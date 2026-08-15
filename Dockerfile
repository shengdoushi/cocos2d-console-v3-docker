FROM debian:buster-slim

# Debian 10 (buster) 已归档，deb.debian.org / 国内常规镜像不再提供 Release 文件
RUN printf '%s\n' \
    'deb http://archive.debian.org/debian buster main contrib non-free' \
    'deb http://archive.debian.org/debian-security buster/updates main contrib non-free' \
    'deb http://archive.debian.org/debian buster-updates main contrib non-free' \
    > /etc/apt/sources.list \
    && echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until

RUN fetchDeps='python wget unzip' && \
	apt-get update && apt-get install -y  --no-install-recommends $fetchDeps && \
	rm -rf /var/lib/apt/lists/* && \
	cd /tmp &&  \
	wget http://download.cocos.com/Cocos2D-X/cocos2d-x-3.16.zip  && \
	unzip cocos2d-x-3.16.zip -d /tmp/ && \
	rm -rf /tmp/cocos2d-x-3.16.zip && \
	mkdir -p /cocos2d-x-3.16/tools/ /cocos2d-x-3.16/cocos/ && \
	mv /tmp/cocos2d-x-3.16/tools/cocos2d-console /cocos2d-x-3.16/tools/ && \
	mv /tmp/cocos2d-x-3.16/cocos/cocos2d.cpp /cocos2d-x-3.16/cocos/ && \
	rm -rf /tmp/cocos2d-x-3.16 && \
	apt-get purge -y --auto-remove unzip wget 

#ADD libgcc_s.so.1 /lib32/libgcc_s.so.1
RUN /cocos2d-x-3.16/tools/cocos2d-console/bin/cocos --agreement n

ENV PATH="/cocos2d-x-3.16/tools/cocos2d-console/bin:${PATH}"

# ENTRYPOINT ["/cocos2d-x-3.16/tools/cocos2d-console/bin/cocos"]
