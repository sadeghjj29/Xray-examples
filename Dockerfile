FROM alpine:3.20

RUN apk add --no-cache ca-certificates curl unzip

WORKDIR /opt/xray

# دانلود و استخراج
RUN curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
  && unzip -o xray.zip \
  && rm -f xray.zip \
  && chmod +x ./xray

COPY config.json /etc/xray/config.json

CMD ["/opt/xray/xray", "run", "-config", "/etc/xray/config.json"]
