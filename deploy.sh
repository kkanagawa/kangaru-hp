#!/bin/bash
SRC=$(ls -t ~/Downloads/kangaru-index-v*.html 2>/dev/null | head -1)
if [ -z "$SRC" ]; then
  echo "エラー: ~/Downloads/ にkangaru-index-v*.htmlが見つかりません"
  exit 1
fi
echo "使用ファイル: $SRC"
cp "$SRC" ~/kangaru-hp/index.html
cd ~/kangaru-hp
git add index.html
git commit -m "deploy: update index.html from $(basename $SRC)"
git push origin main
echo "✅ デプロイ完了"
