BUILD = build --no-cache
BUILD_PATH = .

all: build

build:
	docker $(BUILD) -t mwolff44/pks-rtpengine -f Dockerfile $(BUILD_PATH)

.PHONY: build
