EXCLUSIONS := .git

create_symlink_to_home:
	@echo '==> Create symlink to home directory'
	@echo ''
	@$(foreach val, $(filter-out $(EXCLUSIONS), $(wildcard .??*)), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

setup_karabiner:
	@echo '==> Setup karabiner'
	@echo ''
	@ln -sfnv $(abspath karabiner/karabiner.json $(HOME)/.config/karabiner/karabiner.json)

setup_warp:
	@echo '==> Setup warp'
	@echo ''
	@rm -f ./warp/keybindings.yaml
	@ln -sfnv $(abspath warp/keybindings.yaml) $(HOME)/.warp/keybindings.yaml

install_library_with_homebrew:
	@echo '==> Install or upgrade library'
	@echo ''
	@cd homebrew; brew bundle

uninstall_library_with_homebrew:
	@echo '==> uninstall library'
	@echo ''
	@cd homebrew; brew bundle cleanup
	@read -p "これらをアンインストールしますか？ (yes/no)" response; \
	(if [ "$$response" = "yes" ]; then \
		echo "アンインストールします"; \
		cd homebrew; brew bundle cleanup --force; \
	else \
		echo "終了します"; \
	fi)
