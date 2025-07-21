IMAGE_NAME = ghcr.io/pgx-ml-lab/stage2025_theme2
LOCAL_IMAGE = stage2025_theme2
TAG = latest

# Default target: build multiplatform and push to ghcr
all: ghcr-build-push

# Local development targets
local-build:
	docker build -f container/Dockerfile -t $(LOCAL_IMAGE) .

local-run:
	docker run -p 8888:8888 -ti --rm $(LOCAL_IMAGE)

# Legacy alias
docker: local-build
run: local-run

# GHCR targets
ghcr-build:
	docker build -f container/Dockerfile -t $(IMAGE_NAME):$(TAG) .

ghcr-build-multiplatform:
	docker buildx build --platform linux/amd64,linux/arm64 -f container/Dockerfile -t $(IMAGE_NAME):$(TAG) .

ghcr-push:
	docker push $(IMAGE_NAME):$(TAG)

ghcr-build-push:
	docker buildx build --platform linux/amd64,linux/arm64 -f container/Dockerfile -t $(IMAGE_NAME):$(TAG) --push .

ghcr-run:
	docker run -p 8888:8888 -ti --rm $(IMAGE_NAME):$(TAG)

