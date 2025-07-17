ARG APP_VERSION
# APP_VERSION=2.9.1
FROM caddy:${APP_VERSION}-builder AS builder

RUN xcaddy build --with github.com/caddy-dns/huaweicloud@v0.1.1

FROM caddy:${APP_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
