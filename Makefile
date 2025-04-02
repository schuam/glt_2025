# -----------------------------------------------------------------------------
# constants
# -----------------------------------------------------------------------------

DOCUMENT_SRC_DIR = src/md
OUTPUT_DIR = out
STYLE_DIR = src/styles
ASSETS_DIR = assets

DOCUMENT_NAME = document

DOCUMENT_SRC_FILE_NAME = ${DOCUMENT_NAME}.md
DOCUMENT_OUT_FILE_NAME = ${DOCUMENT_NAME}.pdf

DOCUMENT_SRC_FILE = ${DOCUMENT_SRC_DIR}/${DOCUMENT_SRC_FILE_NAME}
DOCUMENT_OUT_FILE = ${OUTPUT_DIR}/${DOCUMENT_OUT_FILE_NAME}

PANDOC = podman run --rm -v .:/data schuam/dac:v1.1.0


# -----------------------------------------------------------------------------
# targets
# -----------------------------------------------------------------------------

.PHONY: help step_1 step_2

## help: Show this help.
help: Makefile
	@echo ""
	@echo "The following targets exist:"
	@sed -n -e '/^## \S/ s/^## //p' -e 's/^## \s\+/: /p' $< | \
		awk -F ": " '{printf "\033[33m%-20s\033[0m%s\n", $$1, $$2};'
	@echo ""

## step_1: Most basic pandoc command.
step_1:
	${PANDOC} \
		-o ${DOCUMENT_OUT_FILE} \
		${DOCUMENT_SRC_FILE}

## step_2: Add images
step_2:
	${PANDOC} \
		--resource-path .:${ASSETS_DIR}/ \
		-o ${DOCUMENT_OUT_FILE} \
		${DOCUMENT_SRC_FILE}

