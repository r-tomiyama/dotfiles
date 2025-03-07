# peko の環境構築

## できること

### homebrewでライブラリ・VSCodeプラグインをインストール

```sh
make uninstall_library_with_homebrew
make install_library_with_homebrew
```

※ インストール済みのものを dump する場合は `brew bundle dump` 

### BetterTouchToolの設定変更

- Better Touch Tool を開き、設定をexportする

## 初期構築

1. homebrew をインストール
1. `brew install git`
1. git コマンドで SSH接続できるようにする
1. このリポジトリをclone
1. [homebrewでライブラリ・VSCodeプラグインをインストール](./#homebrewでライブラリ・VSCodeプラグインをインストール)
1. [初期セットアップ](./#初期セットアップ)をする
    - .zshrc-local を zshrc-support を参考にしながら用意する
    - settings-private.json を作る
    - コマンド実行

        ```sh
        make create_symlink_to_home
        make setup_karabiner # 必要に応じて
        make setup_vscode
        ```

1. BTTの設定をインポートする
