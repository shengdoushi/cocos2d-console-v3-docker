FROM debian:jessie-slim

RUN fetchDeps='python lib32z1 wget unzip' && \
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

ADD libgcc_s.so.1 /lib32/libgcc_s.so.1
RUN /cocos2d-x-3.16/tools/cocos2d-console/bin/cocos --agreement n

ENTRYPOINT ["/cocos2d-x-3.16/tools/cocos2d-console/bin/cocos"]
