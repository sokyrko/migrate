FROM golang:1.9.2-alpine AS goBuild
RUN go get -u -d github.com/mattes/migrate/cli github.com/go-sql-driver/mysql && \
    go build -tags 'mysql' -o /usr/local/bin/migrate github.com/mattes/migrate/cli && \
    go get github.com/maxcnunes/waitforit

FROM alpine:3.7
COPY --from=goBuild /usr/local/bin/migrate /usr/local/bin/migrate
COPY --from=goBuild /go/bin/waitforit /usr/local/bin/waitforit
WORKDIR /migrations
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
