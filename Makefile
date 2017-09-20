BUILDER_OPTIONS = --force-clean --ccache --require-changes
TARGET_REPO = repo
FLATPAK_BUILDER = $(shell which flatpak-builder)
MANIFEST = com.deepin.Calendar.json

all: build bundle

build: $(MANIFEST)
	$(FLATPAK_BUILDER) \
		$(BUILDER_OPTIONS) \
		--repo=$(TARGET_REPO) \
		calendar \
		$(MANIFEST)
bundle:
	flatpak build-bundle ./repo bundle com.deepin.Calendar master

clean:
	rm -rf sublime repo .flatpak-builder
