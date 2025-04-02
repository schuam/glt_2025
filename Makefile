# -----------------------------------------------------------------------------
# constants
# -----------------------------------------------------------------------------

DOCUMENT_SRC_DIR = src/md
OUTPUT_DIR = out
STYLE_DIR = src/styles
ASSETS_DIR = assets

DOCUMENT_NAME = document

DOCUMENT_SRC_FILE_NAME = ${DOCUMENT_NAME}.md
NEW_PAGE_SRC_FILE_NAME = pagebreak.md
DOCUMENT_OUT_FILE_NAME = ${DOCUMENT_NAME}.pdf

DOCUMENT_SRC_FILE = ${DOCUMENT_SRC_DIR}/${DOCUMENT_SRC_FILE_NAME}
NEW_PAGE_SRC_FILE = ${DOCUMENT_SRC_DIR}/${NEW_PAGE_SRC_FILE_NAME}
DOCUMENT_OUT_FILE = ${OUTPUT_DIR}/${DOCUMENT_OUT_FILE_NAME}

PANDOC = podman run --rm -v .:/data schuam/dac:v1.1.0


# -----------------------------------------------------------------------------
# targets
# -----------------------------------------------------------------------------

.PHONY: help step_1 step_2 step_3 step_4 step_5 step_6 step_7 step_8

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

## step_3: Number sections
step_3:
	${PANDOC} \
		--resource-path .:${ASSETS_DIR}/ \
		--number-sections \
		-o ${DOCUMENT_OUT_FILE} \
		${DOCUMENT_SRC_FILE}

## step_4: Add first style file
step_4:
	${PANDOC} \
		--resource-path .:${ASSETS_DIR}/ \
		-o ${DOCUMENT_OUT_FILE} \
		${STYLE_DIR}/style_step_4.yml \
		${DOCUMENT_SRC_FILE}

## step_5: Add bibliography
step_5:
	${PANDOC} \
		--resource-path .:${ASSETS_DIR}/ \
		--citeproc \
		-o ${DOCUMENT_OUT_FILE} \
		${STYLE_DIR}/style_step_4.yml \
		${STYLE_DIR}/style_step_5.yml \
		${DOCUMENT_SRC_FILE}

## step_6: Add pandoc-crossref filter
step_6:
	${PANDOC} \
		--resource-path .:${ASSETS_DIR}/ \
		--filter pandoc-crossref \
		--citeproc \
		-o ${DOCUMENT_OUT_FILE} \
		${STYLE_DIR}/style_step_4.yml \
		${STYLE_DIR}/style_step_5.yml \
		${DOCUMENT_SRC_FILE}

## step_7: Add header and footer
step_7:
	${PANDOC} \
		--resource-path .:${ASSETS_DIR}/ \
		--filter pandoc-crossref \
		--citeproc \
		-o ${DOCUMENT_OUT_FILE} \
		${STYLE_DIR}/style_step_4.yml \
		${STYLE_DIR}/style_step_5.yml \
		${STYLE_DIR}/style_step_7.yml \
		${DOCUMENT_SRC_FILE}

## step_8: Add page break before first section
step_8:
	${PANDOC} \
		--resource-path .:${ASSETS_DIR}/ \
		--filter pandoc-crossref \
		--citeproc \
		-o ${DOCUMENT_OUT_FILE} \
		${STYLE_DIR}/style_step_4.yml \
		${STYLE_DIR}/style_step_5.yml \
		${STYLE_DIR}/style_step_7.yml \
		${NEW_PAGE_SRC_FILE} \
		${DOCUMENT_SRC_FILE}

