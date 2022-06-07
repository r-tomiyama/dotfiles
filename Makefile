EXCLUSIONS := .git

create_symlink_to_home:
	@echo '==> Create symlink to home directory'
	@echo ''
	@$(foreach val, $(filter-out $(EXCLUSIONS), $(wildcard .??*)), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

setup_vscode:
	@echo '==> Create symlink to vscode directory'
	@echo ''
	@rm -f ./vscode/settings.json
	@jq -s add ./vscode/support/settings.json ./vscode/support/settings-private.json > ./vscode/settings.json
	@$(foreach val, $(wildcard vscode/*.json), ln -sfnv  $(abspath $(val)) $(HOME)/Library/Application\ Support/Code/User/$(subst vscode/,,$(val));)

setup_vscode_plugin:
	@rm -f ./vscode/support/extensions-private
	@code --list-extensions > ./vscode/support/extensions-private
	@cat ./vscode/extensions | xargs -L 1 -I{} code --install-extension {}
# TODO: 環境固有のもののリストアップもしたい
# TOOO: インストールしていないものだけインストールしたい
