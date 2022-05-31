CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .git .gitignore
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

create_symlink:
	@echo '==> Create symlink to home directory'
	@echo ''
	@$(foreach val, $(DOTFILES), echo $(val); ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
