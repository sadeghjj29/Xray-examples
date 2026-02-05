FROM alpine:3.20

RUN apk add --no-cache ca-certificates curl unzip

# دانلود آخرین نسخه Xray (64bit Linux)
RUN curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
  && unzip /tmp/xray.zip -d /usr/local/bin \
  && rm -f /tmp/xray.zip \
  && chmod +x /usr/local/bin/xray

COPY config.json /etc/xray/config.json

CMD ["xray", "run", "-config", "/etc/xray/config.json"]
