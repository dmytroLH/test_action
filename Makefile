image_name = service-image

build-docker:
	IMAGE_NAME=$(image_name) bin/build-docker