BUILD = build --no-cache
BUILD_PATH = .
BUILD_USER = fgst
BUILD_TAG = v1.0.1

all: build

build:
	docker $(BUILD) -t ${BUILD_USER}/pks-rtpengine:${BUILD_TAG} -f Dockerfile $(BUILD_PATH)

.PHONY: build
