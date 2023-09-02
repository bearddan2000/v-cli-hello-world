FROM ubuntu

WORKDIR /app

COPY bin .

RUN apt update 

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    apt-transport-https sudo \
    software-properties-common git make g++

RUN git clone https://github.com/vlang/v

RUN make -C v

# link the executable so we can call it anywhere
RUN ln -s  /app/v/v /bin/v

RUN v up

CMD ["v", "run", "/app/v/examples/hello_world.v"]