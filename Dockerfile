# syntax=docker/dockerfile:1

FROM golang:1.22

COPY go.mod ./
RUN go mod download

COPY *.go ./

RUN go build -o /proxy

EXPOSE 3333

CMD [ "/proxy" ]