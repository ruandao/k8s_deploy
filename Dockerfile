FROM golang:alpine AS build-env
WORKDIR /usr/local/go/src/github.com/ruandao/k8s_deploy
COPY . /usr/local/go/src/github.com/ruandao/k8s_deploy
RUN go install -ldflags="-w -s"

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=build-env /usr/local/go/src/github.com/ruandao/k8s_deploy /bin/k8s_deploy
CMD ["k8s_deploy"]

EXPOSE 8500