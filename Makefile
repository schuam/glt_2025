# -----------------------------------------------------------------------------
# constants
# -----------------------------------------------------------------------------

ASSETS_DIR = assets
DATA_DIR = src/data
DOCUMENT_SRC_DIR = src/md
OUTPUT_DIR = out
PRESENTATION_SRC_DIR = src/md
STYLE_DIR = src/styles
TEMPLATE_DIR = src/templates

DOCUMENT_NAME = document
PRESENTATION_NAME = presentation

CHANGELOG_SRC_FILE_NAME = changelog.yml
DOCUMENT_OUT_FILE_NAME = ${DOCUMENT_NAME}.pdf
DOCUMENT_SRC_FILE_NAME = ${DOCUMENT_NAME}.md
NEW_PAGE_SRC_FILE_NAME = pagebreak.md
PRESENTATION_SRC_FILE_NAME = ${PRESENTATION_NAME}.md
PRESENTATION_OUT_FILE_NAME = ${PRESENTATION_NAME}.pdf
PRESENTATION_STYLE_FILE_NAME = ${PRESENTATION_NAME}.yml
TEMPLATE_FILE_NAME = template_step_9.pandoc

CHANGELOG_SRC_FILE = ${DATA_DIR}/${CHANGELOG_SRC_FILE_NAME}
DOCUMENT_OUT_FILE = ${OUTPUT_DIR}/${DOCUMENT_OUT_FILE_NAME}
DOCUMENT_SRC_FILE = ${DOCUMENT_SRC_DIR}/${DOCUMENT_SRC_FILE_NAME}
NEW_PAGE_SRC_FILE = ${DOCUMENT_SRC_DIR}/${NEW_PAGE_SRC_FILE_NAME}
PRESENTATION_SRC_FILE = ${PRESENTATION_SRC_DIR}/${PRESENTATION_SRC_FILE_NAME}
PRESENTATION_OUT_FILE = ${OUTPUT_DIR}/${PRESENTATION_OUT_FILE_NAME}
PRESENTATION_STYLE_FILE = ${STYLE_DIR}/${PRESENTATION_STYLE_FILE_NAME}
TEMPLATE_FILE = ${TEMPLATE_DIR}/${TEMPLATE_FILE_NAME}

PANDOC = podman run --rm -v .:/data schuam/dac:v1.1.1


# -----------------------------------------------------------------------------
# targets
# -----------------------------------------------------------------------------

.PHONY: \
	help \
	pandoc_latex_template \
	step_1 \
	step_2 \
	step_3 \
	step_4 \
	step_5 \
	step_6 \
	step_7 \
	step_8 \
	step_9

## help: Show this help.
help: Makefile
	@echo ""
	@echo "The following targets exist:"
	@sed -n -e '/^## \S/ s/^## //p' -e 's/^## \s\+/: /p' $< | \
		awk -F ": " '{printf "\033[33m%-20s\033[0m%s\n", $$1, $$2};'
	@echo ""

## pandoc_latex_template: Generate the pandoc latex template
pandoc_latex_template: | ${OUTPUT_DIR}
	${PANDOC} -D latex > ${OUTPUT_DIR}/pandoc_latex_template.pandoc

## step_1: Most basic pandoc command.
step_1: | ${OUTPUT_DIR}
	${PANDOC} \
		-o ${DOCUMENT_OUT_FILE} \
		${DOCUMENT_SRC_FILE}

## step_2: Add images
step_2: | ${OUTPUT_DIR}
	${PANDOC} \
		--resource-path .:${ASSETS_DIR}/ \
		-o ${DOCUMENT_OUT_FILE} \
		${DOCUMENT_SRC_FILE}

## step_3: Number sections
step_3: | ${OUTPUT_DIR}
	${PANDOC} \
		--resource-path .:${ASSETS_DIR}/ \
		--number-sections \
		-o ${DOCUMENT_OUT_FILE} \
		${DOCUMENT_SRC_FILE}

## step_4: Add first style file
step_4: | ${OUTPUT_DIR}
	${PANDOC} \
		--resource-path .:${ASSETS_DIR}/ \
		-o ${DOCUMENT_OUT_FILE} \
		${STYLE_DIR}/style_step_4.yml \
		${DOCUMENT_SRC_FILE}

## step_5: Add bibliography
step_5: | ${OUTPUT_DIR}
	${PANDOC} \
		--resource-path .:${ASSETS_DIR}/ \
		--citeproc \
		-o ${DOCUMENT_OUT_FILE} \
		${STYLE_DIR}/style_step_4.yml \
		${STYLE_DIR}/style_step_5.yml \
		${DOCUMENT_SRC_FILE}

## step_6: Add pandoc-crossref filter
step_6: | ${OUTPUT_DIR}
	${PANDOC} \
		--resource-path .:${ASSETS_DIR}/ \
		--filter pandoc-crossref \
		--citeproc \
		-o ${DOCUMENT_OUT_FILE} \
		${STYLE_DIR}/style_step_4.yml \
		${STYLE_DIR}/style_step_5.yml \
		${DOCUMENT_SRC_FILE}

## step_7: Add header and footer
step_7: | ${OUTPUT_DIR}
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
step_8: | ${OUTPUT_DIR}
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

## step_9: Use own template with changelog
step_9: | ${OUTPUT_DIR}
	${PANDOC} \
		--resource-path .:${ASSETS_DIR}/ \
		--filter pandoc-crossref \
		--citeproc \
		--metadata-file ${CHANGELOG_SRC_FILE} \
		--template ${TEMPLATE_FILE} \
		-o ${DOCUMENT_OUT_FILE} \
		${STYLE_DIR}/style_step_4.yml \
		${STYLE_DIR}/style_step_5.yml \
		${STYLE_DIR}/style_step_7.yml \
		${NEW_PAGE_SRC_FILE} \
		${DOCUMENT_SRC_FILE}

## slides: Generate the slides for the presentation
slides: ${PRESENTATION_OUT_FILE}

${PRESENTATION_OUT_FILE}: ${PRESENTATION_STYLE_FILE} ${PRESENTATION_SRC_FILE} | ${OUTPUT_DIR}
	$(PANDOC) \
		-t beamer \
		-o ${PRESENTATION_OUT_FILE} \
		--metadata-file ${PRESENTATION_STYLE_FILE} \
		${PRESENTATION_SRC_FILE}

${OUTPUT_DIR}:
	mkdir ${OUTPUT_DIR}

