EXCLUSIONS := .git

create_symlink_to_home:
	@echo '==> Create symlink to home directory'
	@echo ''
	@$(foreach val, $(filter-out $(EXCLUSIONS), $(wildcard .??*)), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

setup_karabiner:
	@echo '==> Setup karabiner'
	@echo ''
	@ln -sfnv $(abspath karabiner/karabiner.json $(HOME)/.config/karabiner/karabiner.json)

setup_vscode:
	@echo '==> Setup vscode'
	@echo ''
	@rm -f ./vscode/settings.json
	@jq -s add ./vscode/support/settings.json ./vscode/support/settings-private.json > ./vscode/settings.json
	@$(foreach val, $(wildcard vscode/*.json), ln -sfnv  $(abspath $(val)) $(HOME)/Library/Application\ Support/Code/User/$(subst vscode/,,$(val));)

install_vscode_plugin:
	@echo '==> Install vscode plugin'
	@echo ''
	@rm -f ./vscode/support/extensions-private
	@code --list-extensions > ./vscode/support/extensions-private
	@cat ./vscode/support/extensions | xargs -L 1 -I{} code --install-extension {}
# TODO: 環境固有のもののリストアップもしたい
# TOOO: インストールしていないものだけインストールしたい

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
