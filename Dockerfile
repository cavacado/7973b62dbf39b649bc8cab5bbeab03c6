FROM golang:1.16

WORKDIR /usr/src/app

COPY go.mod go.sum ./
RUN go mod download && go mod verify

COPY . .
RUN go build

ENV PORT=8080
ENV REQUEST_ORIGIN="http://localhost:5001"
CMD ["./server"]