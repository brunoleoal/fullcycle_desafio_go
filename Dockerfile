FROM golang:1.20 AS app

WORKDIR /usr/src/app

COPY full_cycle_rocks.go .
RUN go build full_cycle_rocks.go


FROM scratch
WORKDIR /usr/src/app
COPY --from=app /usr/src/app .
CMD ["./full_cycle_rocks"]