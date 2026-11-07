# Lean 中文版

Zen 浏览器 mod：space 名称条、底部按钮、固定标签下面的分隔线和「清除」按钮，平时隐藏，用到时才显示；侧栏右下角的 + 直接新建标签页。

改编自 KiKaraage 的 [Lean](https://github.com/KiKaraage/ZenMods) 3.1，设置项改成中文。

## 和原版的区别

- 新增：隐藏固定标签和普通标签之间的分隔线和「清除」按钮
- 新增：右下角的 + 直接新建标签页，不再弹菜单；可隐藏标签列表顶部那行「新建标签页」
- 修复：原版「隐藏缩放按钮」「翻译按钮」「扩展页面按钮」三项用的 `-moz-bool-pref` 新版 Zen 已不支持，改成 `-moz-pref`
- 设置名沿用 `mod.lean.*`，原版里勾过的选项直接带过来

## 设置项

默认打开前五项，其余按需勾选。

| 设置 | 作用 |
|---|---|
| `top-workspace` | 隐藏顶部 space 名称条，改名时出现 |
| `bottom-buttons` | 底部按钮区（含 space 图标）只在鼠标移到侧栏时显示 |
| `hide-pinned-separator` | 隐藏固定标签下面的分隔线和「清除」按钮 |
| `plus-new-tab` | 右下角的 + 直接新建标签页（要先做下面「让 + 新建标签页」那一步） |
| `hide-newtab-row` | 隐藏标签列表顶部那行「新建标签页」 |
| `bookmarks` | 书签栏只在鼠标移到顶部导航栏时显示（多工具栏 / 折叠工具栏模式） |
| `hide-zoom` | 隐藏地址栏里的缩放按钮 |
| `show-translation` | 单工具栏模式：鼠标移到地址栏时显示翻译按钮 |
| `show-pageactions` | 单工具栏模式：鼠标移到地址栏时显示扩展的页面按钮 |
| `ninja-top-buttons` | 单工具栏模式：顶部按钮区隐身，鼠标移到地址栏上方仍能点到 |
| `pinned-ext` | 单工具栏模式：底部按钮区挪到地址栏下方，当「固定扩展栏」用（实验功能） |
| `pinned-ext.workspaces` | 开了「固定扩展栏」后仍显示 space 按钮 |

## 安装（macOS / Linux）

1. 下载：`git clone https://github.com/lyra-planet/zen-lean-zh`，或在仓库页面点 Code → Download ZIP
2. 在文件夹里运行 `bash install.sh`
   - 自动找装过 mod 的 Zen 配置文件夹；找不到时手动指定：`bash install.sh "<配置文件夹>"`
   - 配置文件夹在 Zen 里打开 `about:support`，看「配置文件夹」那一行
   - 会停用原版 Lean（只停用，不删除），避免两份同时生效
3. 重启 Zen，到「设置 → Zen Mods → Lean 中文版 → 齿轮」里调整

更新：下载新版后再运行一次 `bash install.sh`，重启 Zen。设置保留。

## 让 + 新建标签页（只做一次）

Zen 的 + 按下就弹菜单，这是写在 Zen 代码里的，mod 改不了。做法是换成 Firefox 自带的「新建标签页」按钮：

1. 侧栏底部右键 →「定制工具栏…」（或者菜单 → 更多工具 → 定制工具栏）
2. 在弹出的面板里找到「新建标签页」，拖到侧栏底部那一排
3. 点「完成」

之后右下角的 + 就是新建标签页，原来弹菜单的 + 会被藏起来。菜单里的新建空间、新建文件夹、新建空白分屏需要用时，在设置里取消勾选 `plus-new-tab`，原来的 + 就回来了。

## 安装（Windows，手动）

1. 把 `chrome.css`、`preferences.json`、`readme.md` 复制到
   `<配置文件夹>\chrome\zen-themes\3e384c94-669f-4f78-8640-74e323ba29d2\`
2. 用记事本打开 `<配置文件夹>\zen-themes.json`，在最外层 `{ }` 里加一项：
   键是 `"3e384c94-669f-4f78-8640-74e323ba29d2"`，值是 `theme.json` 的全部内容
3. 重启 Zen，到 Zen Mods 里停用原版 Lean

## 卸载

设置 → Zen Mods → Lean 中文版 → 移除

## 许可证

MIT，见 [LICENSE](LICENSE)。原版版权归 KiKaraage。
