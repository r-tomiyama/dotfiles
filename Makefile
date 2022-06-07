EXCLUSIONS := .git

create_symlink_to_home:
	@echo '==> Create symlink to home directory'
	@echo ''
	@$(foreach val, $(filter-out $(EXCLUSIONS), $(wildcard .??*)), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

setup_vscode:
	@echo '==> Create symlink to vscode directory'
	@echo ''
	@rm -f ./vscode/settings.json
	@jq -s add ./vscode/setting-support/settings.json ./vscode/setting-support/settings-private.json > ./vscode/settings.json
	@$(foreach val, $(wildcard vscode/*.json), ln -sfnv  $(abspath $(val)) $(HOME)/Library/Application\ Support/Code/User/$(subst vscode/,,$(val));)
	@cat ./vscode/extensions | xargs -L 1 -I{} code --install-extension {}
# TODO: 環境固有のもののリストアップもしたい
# TOOO: インストールしていないものだけインストールしたい