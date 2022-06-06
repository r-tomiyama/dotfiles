EXCLUSIONS := .git setting.json setting-private.json extensions

create_symlink:
	@echo '==> Create symlink to home directory'
	@echo ''
	@$(foreach val, $(filter-out $(EXCLUSIONS), $(wildcard .??*)), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

setup_vscode:
	@echo '==> Create symlink to vscode directory'
	@echo ''
	@rm -f ./vscode/setting.json
	@jq -s add ./vscode/setting-local.json ./vscode/setting-private.json > ./vscode/setting.json
	@$(foreach val, $(filter-out $(EXCLUSIONS), $(wildcard vscode/*)), ln -sfnv  $(abspath $(val)) $(HOME)/Library/Application\ Support/Code/User/$(subst vscode/,,$(val));)
	@cat ./vscode/extensions | xargs -L 1 -I{} code --install-extension {}
# TODO: 環境固有のもののリストアップもしたい
