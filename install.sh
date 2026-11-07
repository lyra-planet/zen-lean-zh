#!/usr/bin/env bash
# 把 Lean 中文版装进 Zen：复制 mod 文件 → 在 zen-themes.json 里登记 → 停用原版 Lean
# 用法：bash install.sh [Zen 配置文件夹]
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
ID="3e384c94-669f-4f78-8640-74e323ba29d2"
LEAN_ID="1e86cf37-a127-4f24-b919-d265b5ce29a0"

# 1. 找配置文件夹：参数指定，或自动找装过 mod 的（有 zen-themes.json）
profiles=()
if [ $# -gt 0 ]; then
  profiles=("$1")
else
  for f in "$HOME/Library/Application Support/zen/Profiles"/*/zen-themes.json \
           "$HOME/.zen"/*/zen-themes.json \
           "$HOME/.var/app/app.zen_browser.zen/.zen"/*/zen-themes.json; do
    [ -f "$f" ] && profiles+=("$(dirname "$f")")
  done
fi

if [ ${#profiles[@]} -eq 0 ]; then
  echo "没找到 Zen 配置文件夹。在 Zen 里打开 about:support 看「配置文件夹」，再运行：bash install.sh \"<路径>\""
  exit 1
fi
command -v python3 >/dev/null || { echo "需要 python3（macOS 可运行 xcode-select --install）"; exit 1; }

# 2. 逐个配置文件夹安装
for p in "${profiles[@]}"; do
  mkdir -p "$p/chrome/zen-themes/$ID"
  cp "$HERE"/{chrome.css,preferences.json,readme.md} "$p/chrome/zen-themes/$ID/"

  python3 -I - "$p/zen-themes.json" "$HERE/theme.json" "$LEAN_ID" <<'EOF'
import json, os, sys

db_path, meta_path, lean_id = sys.argv[1:]
db = json.load(open(db_path, encoding="utf-8")) if os.path.exists(db_path) else {}
meta = json.load(open(meta_path, encoding="utf-8"))

db[meta["id"]] = {**db.get(meta["id"], {}), **meta}  # 重装时保留原来的启用状态
if lean_id in db and db[lean_id].get("enabled", True):
    db[lean_id]["enabled"] = False
    print("  已停用原版 Lean（设置 → Zen Mods 里可以重新打开）")

json.dump(db, open(db_path, "w", encoding="utf-8"), ensure_ascii=False, indent=2)
EOF

  echo "已装到：$p"
done
echo "重启 Zen 后生效；设置项在：设置 → Zen Mods → Lean 中文版 → 齿轮"
