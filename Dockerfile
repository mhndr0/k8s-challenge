############################
# STEP 1 build executable binary
############################
FROM golang:1.15-alpine as builder
RUN apk update

RUN mkdir /app
WORKDIR /app

COPY src/main.go .

RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /app/bin/main main.go


############################
# STEP 2 build a small image
############################
FROM alpine:3.14
RUN apk update

RUN mkdir /app
WORKDIR /app

# Copy the executable
COPY --from=builder /app/bin/main .

# Run the binary
CMD ["./main"]