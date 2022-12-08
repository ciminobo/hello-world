FROM gcc:latest as base
COPY . /src
WORKDIR /src/

RUN make

ENTRYPOINT [ "/src/hello" ]
