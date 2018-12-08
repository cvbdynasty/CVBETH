# Build Geth in a stock Go builder container
FROM golang:1.11-alpine as builder

RUN apk add --no-cache make gcc musl-dev linux-headers

ADD . /cvbEth
RUN cd /cvbEth && make geth

# Pull Geth into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /cvbEth/build/bin/geth /usr/local/bin/

EXPOSE 8545 8546 30303 30303/udp 30304/udp

COPY ./data/*.sh ./data/*.json /
RUN chmod +x /*.sh

ENTRYPOINT ["/entrypoint.sh", "--rpc", "--rpcaddr", "0.0.0.0",  "--maxpeers", "5","--networkid","8878","--nodiscover"]
