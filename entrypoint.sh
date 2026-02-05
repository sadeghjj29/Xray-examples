#!/bin/sh
set -e

# Railway معمولاً PORT رو خودش ست می‌کنه؛
# اگر تو Variables گذاشتی هم همونو استفاده می‌کنه
: "${PORT:=3000}"
: "${UUID:?UUID is required}"
: "${PATH:=/ws}"

# جایگزینی مقادیر داخل کانفیگ
sed -i "s|__PORT__|$PORT|g" /etc/xray/config.json
sed -i "s|__UUID__|$UUID|g" /etc/xray/config.json
sed -i "s|__PATH__|$PATH|g" /etc/xray/config.json

exec xray run -config /etc/xray/config.json
