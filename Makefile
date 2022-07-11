IMAGE_NAME=mlflow-gcp
VERSION=latest
GCP_PROJECT=regbrain-poc
echo "https://eu.gcr.io" | docker-credential-gcr get
build:
	docker build -t "${IMAGE_NAME}" .

docker-auth:
	gcloud auth configure-docker

tag:
	docker tag "${IMAGE_NAME}" "eu.gcr.io/${GCP_PROJECT}/${IMAGE_NAME}:${VERSION}"

push:
	docker push "eu.gcr.io/${GCP_PROJECT}/${IMAGE_NAME}:${VERSION}"
