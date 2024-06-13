FROM golang:1.22 AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download && go mod verify
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /app/main ./...

FROM gcr.io/distroless/static-debian11
WORKDIR /app
COPY --from=builder /app/main .
ENTRYPOINT ["/app/main"]
EXPOSE 8080
