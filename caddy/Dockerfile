ARG APP_VERSION
FROM caddy:${APP_VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddy-dns/alidns

FROM caddy:${APP_VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
