
all: rpi-b-image rpi-b-plus-image rpi-2-b-image rpi-3-b-image

rpi-b-image: builder
	docker run buildroot_builder_rpi rpi-b | docker import - waltplatform/walt-node:rpi-b-minimal

rpi-b-plus-image: rpi-b-image builder
	docker tag waltplatform/walt-node:rpi-b-minimal waltplatform/walt-node:rpi-b-plus-minimal

rpi-2-b-image: builder
	docker run buildroot_builder_rpi rpi-2-b | docker import - waltplatform/walt-node:rpi-2-b-minimal

rpi-3-b-image: builder
	docker run buildroot_builder_rpi rpi-3-b | docker import - waltplatform/walt-node:rpi-3-b-minimal

publish: rpi-b-image rpi-b-plus-image rpi-2-b-image rpi-3-b-image
	docker push waltplatform/walt-node:rpi-b-minimal
	docker push waltplatform/walt-node:rpi-b-plus-minimal
	docker push waltplatform/walt-node:rpi-2-b-minimal
	docker push waltplatform/walt-node:rpi-3-b-minimal

builder:
	docker build -t buildroot_builder_rpi .
