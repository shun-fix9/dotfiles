# 開発環境用 dotfiles

## dockerfiles

### ビルド方法

```bash
./build.sh
./build.sh -m # メジャーバージョンアップ
./build.sh -p # パッチバージョンアップ
./build.sh -b # メジャーバージョンアップに向けた minor 999 バージョン
```

### run

```bash
docker run -d -P --volumes-from sakai-shared sakai/devel:<version>
```

### 詳細

* sudo はパスワードなしでできるようになってる
* docker コマンドが使用可能
