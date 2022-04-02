include boilerplate/generated-includes.mk

.PHONY: boilerplate-update
boilerplate-update:
	@boilerplate/update

# Extend Makefile after here

.PHONY: skopeo-push
skopeo-push:
	skopeo copy \
		--dest-creds "${QUAY_USER}:${QUAY_TOKEN}" \
		"docker-daemon:${OPERATOR_IMAGE_URI_LATEST}" \
		"docker://${OPERATOR_IMAGE_URI_LATEST}"
	skopeo copy \
		--dest-creds "${QUAY_USER}:${QUAY_TOKEN}" \
		"docker-daemon:${OPERATOR_IMAGE_URI}" \
		"docker://${OPERATOR_IMAGE_URI}"
