# modern-vimrc

プラグインを一切使わず、Vim 本体の機能だけで快適さを高めた Vim 8.2+ / Vim 9.x 向け設定です。

## 主な機能

- 行番号、相対行番号、カーソル行、不可視文字、24-bit color
- smartcase 対応のインクリメンタル検索と置換プレビュー
- 永続 undo、swap、backup を専用ディレクトリへ安全に保存
- Vim 標準補完を使いやすくする挿入モードマッピング
- netrw によるツリー形式のファイルブラウザ
- バッファ、ウィンドウ、quickfix、location list の高速操作
- ファイル再読込、末尾空白除去、前回カーソル位置の復元
- プラグイン不要の情報量が多いステータスライン
- Markdown、テキスト、Git commit で折り返しとスペルチェック

## インストール

既存の設定がある場合は、先にバックアップしてください。

### Linux / macOS / WSL

```sh
git clone https://github.com/rrryuorrr/modern-vimrc.git
ln -sfn "$PWD/modern-vimrc/.vimrc" "$HOME/.vimrc"
```

### Windows PowerShell

```powershell
git clone https://github.com/rrryuorrr/modern-vimrc.git
Copy-Item .\modern-vimrc\.vimrc $HOME\_vimrc
```

## 主要キー

Leader キーは `Space` です。

| キー | 動作 |
|---|---|
| `Space w` | 保存 |
| `Space q` | 終了 |
| `Space e` | ファイルブラウザを開く |
| `Space ev` | vimrc を編集 |
| `Space sv` | vimrc を再読込 |
| `Space cd` | 現在のファイル位置へ移動 |
| `Space n` | 行番号表示を切替 |
| `Space l` | 不可視文字表示を切替 |
| `Space z` | 折り返し表示を切替 |
| `[b` / `]b` | 前後のバッファへ移動 |
| `[q` / `]q` | 前後の quickfix 項目へ移動 |
| `Ctrl-h/j/k/l` | ウィンドウ間を移動 |
| `Esc Esc` | ターミナルモードを終了 |

## コマンド

- `:TrimTrailingWhitespace` - 末尾空白を削除
- `:ReloadVimrc` - vimrc を再読込
- `:Lexplore` - 標準ファイルブラウザを開く
- `:terminal` - Vim 内ターミナルを開く

## カスタマイズ

`.vimrc` の末尾に設定を追加してください。たとえばインデント幅を 2 にする場合:

```vim
set tabstop=2
set softtabstop=2
set shiftwidth=2
```

## License

MIT
