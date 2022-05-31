CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .git
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

create_symlink:
	@echo '==> Create symlink to home directory'
	@echo ''
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
