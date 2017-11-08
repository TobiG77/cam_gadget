.PHONY: bin clean

all: bin

bin:
	rm -rf src/build && \
		mkdir -p src/build
	docker run --rm -v $(shell pwd)/src:/src tobig77/opencv-on-nerves:armv6 \
		sh -c "cd /src/build && cmake ../ && make"
	rm -rf bin && \
		mkdir -p bin && \
		install -m 755 src/build/hit-or-miss bin/hit-or-miss

clean:
	rm -rvf priv
