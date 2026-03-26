.PHONY: setup update status clean

setup:
	@echo "Setting up submodules..."
	git submodule update --init --recursive --remote

update:
	@echo "Updating submodules to latest main branch..."
	git submodule update --remote --merge

status:
	@echo "Submodule status:"
	@git submodule status

clean:
	@echo "Cleaning submodule..."
	@git submodule deinit -f .config/opencode
	@git submodule update --init --remote