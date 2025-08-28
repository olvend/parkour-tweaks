VERSION := 2.1.1
ZIP_NAME := Parkour Tweaks $(VERSION).zip
OUT_DIR := out
OUT_PATH := $(OUT_DIR)/$(ZIP_NAME)

.PHONY: all zip clean

all: clean zip

zip: | $(OUT_DIR)
	git ls-files -co --exclude-standard -z | grep -vz "^Makefile$$" | xargs -0 zip -r "$(OUT_PATH)"

clean:
	rm -f "$(OUT_PATH)"

$(OUT_DIR):
	mkdir -p "$(OUT_DIR)"