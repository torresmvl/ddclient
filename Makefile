buildx:
		docker buildx build \
		--platform linux/arm/v7,linux/arm64,linux/amd64 \
		--push \
		--progress tty -t reg.growlab.digital/ddclient .
