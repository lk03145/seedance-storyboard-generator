# Seedance Storyboard Generator

一个 Codex 技能，用于将故事、短剧剧本、人物设定、场景设定、参考图、参考视频和音频节奏，整理成可直接服务 Seedance 2.0 的 AI 短剧分镜生产包。

## 能力范围

- 剧本分析、短剧结构整理、起承转合大纲
- 人物图、场景图、站位参考分镜图、剧情首帧图提示词
- Seedance 2.0 增强视频提示词发包
- 15 秒节奏预算预检
- 场景空间锚点与人物站位关系表
- 180 度空间轴线、防越轴、连续性控制
- 台词映射、口型同步、旁白/画外音/内心独白处理
- 视频延长、分段拼接、首尾帧控制、局部修改模板

## 目录结构

```text
seedance-storyboard-generator/
├── SKILL.md
├── agents/
│   └── openai.yaml
└── references/
    ├── seedance-manual.md
    ├── 优化分镜.md
    ├── 好剧本.md
    ├── 故事转视频脚本-转换工具.md
    └── 生图提示词层级法.md
```

## 安装方式

将整个目录复制到 Codex 技能目录：

```powershell
Copy-Item -Recurse -Force . "$env:USERPROFILE\.codex\skills\seedance-storyboard-generator"
```

安装后，在 Codex 中使用：

```text
使用 seedance-storyboard-generator，把这个故事整理成 Seedance 2.0 分镜生产包。
```

## 发布到 GitHub

本仓库附带 `publish-to-github.ps1`，登录 GitHub CLI 后可直接创建并推送仓库：

```powershell
winget install --id GitHub.cli
gh auth login
.\publish-to-github.ps1 -RepoName seedance-storyboard-generator -Visibility public
```

## 版本口径

当前技能按 `Seedance 2.0 分镜脚本整合优化版 1.5` 优化，重点强化了站位参考分镜图、节奏预算、空间锚点、人物站位、台词映射和增强发包格式。
