FROM golang:1-alpine AS build

WORKDIR /usr/src/app

COPY go.mod go.sum .
RUN go mod download && go mod verify

COPY internal internal/
COPY cmd cmd/
RUN go build -v -o /usr/local/bin/app -ldflags="-s -w" cmd/godocker/main.go

FROM alpine:latest

WORKDIR /usr/local/bin

COPY --from=build /usr/local/bin/app .

CMD ["app"]
