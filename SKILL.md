---
name: seedance-storyboard-generator
description: Generate Chinese Seedance 2.0 AI-video production packages from stories, articles, novels, outlines, character briefs, scene briefs, or existing storyboards. Use when the user asks Codex to create or refine short-drama scripts, AI video storyboards, Seedance 2.0 enhanced video prompt packages, text-to-image prompts, image-to-video prompts, character/scene/prop/blocking-reference lists, 15-second rhythm budgets, anti-cross-axis continuity plans, dialogue mapping, lip-sync guidance, or episode-continuity packages.
---

# Seedance Storyboard Generator

Use this skill to turn source material into a production-ready Seedance 2.0 package: story/script analysis, material routing, character/scene/prop/blocking-reference assets, storyboard tables, first-frame prompts, enhanced image-to-video prompts, rhythm budgets, continuity notes, anti-cross-axis controls, dialogue mapping, and final QA.

This skill follows the `Seedance 2.0 分镜脚本整合优化版 1.5`口径:

- 人物图白底无场景，默认画幅 `3:4`。
- 场景图无人空镜，默认画幅 `16:9`。
- 站位参考分镜图用于锁定空间关系，必须全景 `16:9`，同时包含当前段落人物和环境锚点。
- 分镜图服务剧情，可以有人物、场景、动作。
- Seedance 视频提示词按增强发包流程执行：素材绑定、节奏预算、场景锚点、人物站位、空间轴线、台词映射、分镜时序、风格约束都要清楚。
- 每个 15 秒段落必须先做节奏预算预检；超时要拆段，且每段重新绑定素材、站位、轴线和台词。
- 多人关系镜头必须写空间轴线设定，防止越轴。
- 有对白、旁白、画外音、内心独白时，必须建立台词映射表并逐镜绑定。

## Reference Loading

Load these files only when needed:

- `references/seedance-manual.md`: Seedance 2.0 prompt patterns, templates, camera movement, multimodal reference syntax, and platform constraints.
- `references/故事转视频脚本-转换工具.md`: Detailed story-to-video adaptation template.
- `references/好剧本.md`: Quality bar and example script style.
- `references/优化分镜.md`: Refinement checklist for improving storyboard prompts.
- `references/生图提示词层级法.md`: Image-prompt hierarchy for subject/environment/style/lighting/technical layers.

## Intake

First identify the requested output type. Do not mix these categories unless the user explicitly asks for a full package.

| Type | Default visual rule | People allowed | Primary purpose |
| --- | --- | --- | --- |
| 人物图 / 角色图 / 人物设定图 | 白底或浅灰白纯色背景，不出现场景，默认 `3:4` | 只能出现指定角色 | Lock face, hair, costume, body, temperament |
| 场景图 / 空镜图 / 环境图 | 无人空场景，只表现空间和氛围，默认 `16:9` | 不允许 | Lock layout, architecture, props, light, era |
| 站位参考分镜图 / 空间关系图 | 全景 `16:9`，同时展示人物与环境锚点 | 必须出现当前段落角色 | Lock blocking, left/right position, depth, gaze, camera side |
| 分镜图 / 首帧图 / 剧情镜头图 | 人物、场景、动作共同服务剧情 | 允许 | Express a static story moment for first frame |
| 图生视频 / 视频提示词 | 基于首帧或参考素材生成连续镜头 | 按剧情需要 | Build action chain, camera motion, emotion progression |

Ask concise clarifying questions only when key production parameters are missing and cannot be reasonably inferred:

- Target duration: 5s, 10s, 15s, 30s, 120s, or episode count.
- Aspect ratio: default to `9:16` vertical unless specified.
- Visual style: realistic cinematic, Chinese period drama, 1999 county realism, dark eastern myth, animation, 3D, ink wash, cyberpunk, etc.
- Camera perspective: third person, first person, POV, selfie, surveillance, over-the-shoulder, etc.
- Reference material: character image, scene image, motion video, audio rhythm, first frame, ending frame.
- Output scope: script, asset prompts, storyboard table, image prompts, video prompts, continuity plan, or all.
- Spatial relationship: whether two or more characters share a scene, exchange objects, talk, negotiate, walk together, enter/exit, or need a blocking-reference image.

Hard routing rules:

- Do not use a character image as a scene reference; it must stay white-background/no-scene.
- Do not use a scene image as a blocking reference; it must stay empty/no-people.
- When a segment has two or more characters with a clear spatial relationship, create or request a `站位参考分镜图` before writing Seedance video prompts.
- A `站位参考分镜图` is not a beauty still. It is a production control image: full shot, 16:9, complete environment anchors, clear left/right positions, foreground/midground/background, gaze direction, and camera side.

## Core Prompt Principles

Use engineering-style director instructions. Avoid relying on vague adjectives such as `cinematic`, `epic`, `beautiful`, or `high quality` without concrete executable detail.

Stable formula:

```text
精准主体 + 动作细节 + 场景环境 + 光影色调 + 镜头运镜 + 视觉风格 + 画质参数 + 约束条件
```

Enhanced Seedance control chain:

```text
素材绑定清楚 -> 场景锚点清楚 -> 人物站位清楚 -> 空间轴线清楚 -> 台词映射清楚 -> 分镜时序清楚 -> 节奏预算清楚 -> 风格约束清楚
```

Writing rules:

- Write who and where first, then what happens, then how it is filmed.
- Externalize emotion as eyes, posture, hands, breathing, walking rhythm, facial micro-movement.
- Keep one primary camera movement per shot.
- Split complex action into multiple shots instead of packing it into one long sentence.
- For multiple characters, bind each person to a reference image, screen side, costume, action, and gaze direction.
- Before video prompts, estimate whether dialogue, action, emotion, camera movement, and safety margin fit the target duration.
- Every scene with meaningful spatial continuity should name fixed anchors such as door, window, bed, desk, sofa, shoe cabinet, counter, corridor direction, or light source.

## Workflow

1. Analyze source material.
   - Extract protagonist, supporting characters, conflict, story arc, key scenes, emotional beats, hook, and production risks.
   - Preserve recognizable plot while compressing for short-form pacing.

2. Route material type before writing prompts.
   - Classify each requested output as 人物图, 场景图, 站位参考分镜图, 分镜图, or 图生视频.
   - Keep character references, empty scene references, blocking-reference images, first-frame storyboard images, and video prompts separated.

3. Create the script package when needed.
   - Use `起 / 承 / 转 / 合` structure.
   - Include core hook, synopsis, one-sentence selling point, character bios, episode outline, and script body.

4. Plan assets and references.
   - Number characters as `C01-C99`.
   - Number scenes/locations as `S01-S99`.
   - Number blocking-reference storyboard images as `B01-B99`.
   - Number props/objects as `P01-P99`.
   - Number videos/audio references as `V01`, `A01` or platform upload slots like `@视频1`, `@音频1`.
   - Start related asset prompts with a unified visual style prefix.
   - Give major characters distinct identity anchors: face shape, hair, costume silhouette, signature color, prop, expression baseline.

5. Run a 15-second rhythm-budget precheck for each video segment.
   - Estimate dialogue time, action time, emotion time, camera-move time, and 1-2 seconds of safety margin.
   - If the total exceeds the target duration, split the segment before writing Seedance prompts.
   - When splitting, each new segment must re-bind materials, standing positions, axis rules, and dialogue mapping.

6. Build scene space controls.
   - Create a scene-anchor table for doors, windows, beds, tables, sofas, shoe cabinets, counters, corridor direction, light source, and other fixed objects.
   - Create a character-position table covering screen left/right, foreground/midground/background, body direction, gaze direction, and relationship to anchors.
   - When two or more characters share spatial continuity, generate a full-shot 16:9 `站位参考分镜图` prompt before the video prompt.

7. Build storyboard and video prompts.
   - For 15s videos, default to 3-5 shots of roughly 3 seconds each.
   - Use shorter shots for action/fight/explosion/chase, and 3-5s shots for dialogue, reaction, or atmosphere.
   - For each video prompt, use the required order:
     `素材说明 -> 整体设定 -> 节奏预算 -> 场景空间锚点 -> 人物站位锁定 -> 空间轴线设定 -> 台词映射 -> 分镜时序 -> 风格与约束`.
   - Omit `空间轴线设定` only when there is no multi-character spatial relationship.
   - Omit `台词映射` only when there is no dialogue, VO, OS, narration, or inner monologue.
   - Omit `站位参考分镜图` only when the segment has no meaningful multi-character blocking or left/right continuity risk.

8. Verify before finalizing.
   - Check material routing, upload references, rhythm budget, duration coverage, scene anchors, standing positions, camera concreteness, continuity, anti-cross-axis rules, and dialogue integrity.
   - Flag likely sensitive-word or instruction-following risks and propose neutral alternatives.

## 15-Second Rhythm Budget Precheck

Use this before outputting storyboard tables or Seedance video prompts. The goal is natural pacing, not filling every second.

Formula:

```text
台词预计时间 + 动作完成时间 + 情绪表达时间 + 运镜时间 + 安全余量 <= 15 秒
```

Estimation rules:

| Item | Estimate | Handling rule |
| --- | --- | --- |
| 台词 | 普通语速约每秒 3-4 个中文字符；情绪台词更慢 | Long lines split by comma, pause, or emotional beat |
| 动作 | 轻微动作 1-2s；递物/转身/走位 2-4s；复杂动作 4s+ | Split excessive action before adding dialogue |
| 情绪表达 | 眼神停顿、迟疑、压抑、反应 usually 1-3s | Important emotion must not be squeezed out by dialogue |
| 运镜 | Fixed shot costs no extra time; slow push/pull often 2-4s | One primary camera move per shot |
| 安全余量 | Reserve 1-2s per 15s segment | Prevent rushed speech and compressed action |

If the estimate exceeds the segment duration:

- Split into two or more segments.
- Reduce motion before shortening dialogue.
- Use fixed shots or a slow push-in for dense dialogue.
- Place important emotional reaction after dialogue.
- Re-bind materials, standing positions, spatial axis, and dialogue mapping in every new segment.

Template:

```markdown
### 节奏预算预检

| 项目 | 预计时长 | 说明 |
| --- | ---: | --- |
| 台词 | X秒 | [按原文估算，不压缩语速] |
| 动作 | X秒 | [核心动作] |
| 情绪表达 | X秒 | [停顿/反应] |
| 运镜 | X秒 | [固定/推近/后拉/横摇] |
| 安全余量 | X秒 | [1-2秒] |
| 合计 | X秒 | [不超过目标时长；超时则拆段] |
```

## Scene Anchors and Character Blocking

Use this whenever a scene contains fixed environment layout, two or more characters, object handoff, negotiation, dining-table action, hospital-room action, office action, hallway action, entry/exit blocking, or continuity between shots.

Scene-anchor examples:

| Anchor type | Example wording |
| --- | --- |
| 门/出入口 | 入户门位于背景中央偏左，角色从画面右侧玄关区域出门 |
| 桌/床/沙发 | 病床位于画面中部偏右，床头靠右侧墙面 |
| 柜/鞋凳/办公桌 | 鞋柜和换鞋凳位于画面右侧，办公桌位于画面右后方 |
| 窗/光源 | 窗户位于背景左侧，日光从左后方进入 |
| 通道方向 | 走廊从前景延伸到背景，人物沿画面右侧向内走 |

Character-position template:

```markdown
### 人物站位关系表

| 人物 | 画面位置 | 前后层次 | 身体朝向/视线 | 空间锚点关系 |
| --- | --- | --- | --- | --- |
| 角色A | 画面左侧 | 中景 | 面向右侧，看向角色B | 靠近门/桌/床的左侧 |
| 角色B | 画面右侧 | 中景或后景 | 面向左侧，看向角色A | 位于鞋柜/办公桌/病床旁 |
| 角色C | 画面左后方 | 后景 | 低头整理道具，不抢台词 | 靠近柜台或床尾 |
```

Blocking-reference trigger:

- If a segment has two or more characters in the same space, first create `B01` as a `站位参考分镜图`.
- Use `B01` to lock left/right position, foreground/midground/background, scene anchors, gaze direction, and camera side.
- In the Seedance prompt, bind `@图片X` to `B01` and say it controls blocking and spatial axis, not beauty styling.

## Script Format

For a full script, use this structure:

```markdown
# [标题] - 剧本

一、核心梗
[短语]

二、故事梗概
故事背景：
开场冲突：
主角画像：
主线事件：
结局：

三、一句话卖点
[一句强钩子文案]

四、人物小传
**角色名**
视觉形象：
身份背景：
核心标签：
性格特点：
金句：

五、剧本大纲
前期（起）：
中期（承/转）：
后期（高潮）：
尾声（收尾）：

六、剧本正文
```

For each episode script body:

```markdown
第X集
X-X [日/夜] [内/外] [场景名称]
道具：
出场人物：

△ 【空镜/开场镜头】[镜头描述]
△ [具体镜头：景别 + 运镜 + 动作 + 光影 + 氛围]
角色名（os）：[内心独白/画外音]
角色名（vo）：[旁白]
角色名（情绪）：[对白]
【字幕：xxx】
△ 【闪回】[闪回镜头]
【闪回结束】
△ 【空镜】[结尾氛围镜头]
```

Rules:

- Start every shot line with `△ `.
- Use concrete shot scale and camera movement: 大特写, 特写, 近景, 中景, 全景, 远景, 过肩镜头, POV, 推镜头, 拉镜头, 摇镜头, 移镜头, 跟镜头, 升降镜头, 手持晃动, 希区柯克变焦, 一镜到底.
- Use `os` for off-screen sound or inner monologue and `vo` for narration/voiceover.
- Use sensory details: light, color, texture, weather, sound, emotional pressure.

## Asset Prompt Formats

### Character Image: White Background, No Scene

Use when the user asks for 人物图, 角色图, 人物设定图, 角色参考图. Default aspect ratio is `3:4` unless the user explicitly specifies another ratio.

Hard rule: only the specified character appears. Use `3:4` portrait framing by default. Do not include rooms, buildings, furniture, mountains, streets, courtyards, background characters, battle scenes, or narrative environments.

```markdown
### C01 - [角色名/正面全身或半身]

白底人物设定图，3:4 竖幅画幅，单人全身，角色为【身份】，年龄约【年龄】，性别【性别】，五官【五官】，发型【发型】，穿着【服装】，体型【体型】，站姿【姿态】，神情【表情】，整体气质为【气质】，画面干净，角色居中，人物比例正常，结构准确，高清细节。纯白背景，不出现场景，不出现室内外环境、建筑、家具、山水、街道、房间、庭院，不出现其他人物，无文字，无水印。
```

### Scene Image: Empty Establishing Shot

Use when the user asks for 场景图, 空镜图, 环境图, 建筑场景, 室内/室外场景. Default aspect ratio is `16:9` unless the user explicitly specifies another ratio.

Hard rule: no people. Use `16:9` widescreen framing by default. Also avoid backs, silhouettes, distant figures, reflections, shadows, hands, feet, hair, clothing edges, or any body part. Traces of human activity are allowed when useful.

```markdown
### S01 - [场景名]

【景别】，16:9 横幅画幅，【场景名称】空场景，整体空间为【空间结构】，画面内包含【家具/建筑/道具/环境细节】，氛围为【情绪氛围】，时间为【日/夜/黄昏/雨夜】，光影为【光线描述】，色调为【色调描述】，整体呈现【视觉风格】，画质高清，细节清晰，环境真实。画面中不要出现任何人物，不要出现主角、配角、群演，不要出现背影、剪影、远处模糊人影、人物倒影、人物影子、肢体局部，保持纯场景空镜效果，无文字，无水印。
```

### Blocking Reference Storyboard: Full-Shot 16:9

Use when the user asks for 站位参考分镜图, 空间关系图, 多人对话分镜参考, or when the segment has two or more characters with continuity risk.

Hard rule: this is a production-control image for Seedance, not a close-up beauty frame. It must be a full shot, 16:9, with current segment characters and environment anchors visible.

```markdown
### B01 - [场景名/段落名] 站位参考分镜图

全景，16:9 横幅画幅，【场景名称】站位参考分镜图，重点交代人物与环境的完整空间关系。画面中【角色A】位于【画面左/右/中】侧，【站姿/坐姿/动作】；【角色B】位于【画面左/右/中】侧，【站姿/坐姿/动作】；如有第三人，写清其位于前景/中景/后景的具体位置。场景中的【门/窗/桌子/床/沙发/鞋柜/办公桌/柜台等】分别位于【具体位置】，作为空间锚点。人物之间的视线关系清晰，【角色A】看向【角色B】，【角色B】看向【角色A/某处】。镜头机位位于【正前方/斜前方/房间入口/会客区外侧】，保持完整空间透视，明确人物站位、前后层次和人与环境关系。整体为【视觉风格】，画面干净，构图稳定，细节清晰，适合作为 Seedance 2.0 站位锁定分镜图，无文字，无水印。
```

### Storyboard / First-Frame Image

Use when the user asks for 分镜图, 首帧图, 剧情镜头画面.

Hard rule: write a clear static moment, not a continuous action chain.

```markdown
### F01 - [镜头名/首帧]

【景别】，【角色完整外观】处于【静态动作瞬间】，【人物站位】，【场景锚点】，【构图方式】，【场景环境】，【情绪氛围】，【视觉风格】，【光影色调】。画面是可延展的视频起点，角色、道具和空间位置清楚，适合作为图生视频首帧，无文字，无水印。
```

Bad: `男主冲上前拔剑砍向敌人，然后火焰爆炸。`

Good: `男主拔剑前的瞬间，身体微微前倾，右手握住剑柄，眼神冰冷，背景火焰静静燃烧。`

## Seedance Video Prompt: Enhanced Director Package

Use this structure for each Seedance 2.0 video prompt:

```markdown
## 第X集 / 第X段：[标题]

### 素材上传列表

| 上传位置 | 素材ID | 用途 |
| --- | --- | --- |
| @图片1 | C01 | 主角外观参考，锁定脸型、发型、服装和体型 |
| @图片2 | S01 | 场景参考，锁定空间布局、建筑风格和光影氛围 |
| @图片3 | B01 | 站位参考分镜图，锁定人物左右站位、前后层次、空间锚点、视线方向与镜头机位 |
| @视频1 | V01 | 运镜参考，只学习镜头运动轨迹，不复制人物、场景或剧情 |
| @音频1 | A01 | 背景音乐、对白或节奏参考 |

### Seedance Prompt

素材说明：@图片1 作为【角色A】外观参考，锁定【脸型/发型/服装/体型】。@图片2 作为【场景】参考，锁定【空间结构/建筑风格/光影氛围】。@图片3 作为本段站位参考分镜图，优先锁定人物左右站位、前后层次、空间锚点关系、视线方向与镜头机位。后续视频镜头在该站位参考分镜图基础上推进，保持空间关系稳定，不跨轴，不跳位，不随意改变人物左右位置。

整体设定：生成一段【时长】秒视频，比例【9:16/16:9/1:1】，场景为【场景】，角色为【角色】，整体风格为【风格】，核心情绪为【情绪】。全程保持角色外观、服装、发型、脸部特征一致，场景结构稳定，光影统一。

节奏预算：台词预计【X】秒，动作预计【X】秒，情绪表达【X】秒，运镜【X】秒，安全余量【X】秒，总计不超过【目标时长】秒。台词说完、动作完成和情绪表达必须自然分配时间，不压缩语速，不让角色快速念完台词，不让动作过快。若无法自然完成，必须拆成下一段继续。

场景空间锚点：【门/窗/桌/床/沙发/鞋柜/办公桌/柜台/走廊/光源等】分别位于【具体位置】。连续镜头中这些锚点位置保持稳定，不随镜头切换漂移。

人物站位锁定：【角色A】位于画面【左/右/中】侧，【前景/中景/后景】，身体朝向【方向】，视线看向【角色/锚点】；【角色B】位于画面【左/右/中】侧，【前景/中景/后景】，身体朝向【方向】，视线看向【角色/锚点】。人物与【门/窗/桌/床/鞋柜/办公桌】等空间锚点关系不变。

空间轴线设定：【仅多人关系镜头需要】本场建立一条稳定的 180 度空间轴线：【角色A】位于画面左侧/空间左侧，【角色B】位于画面右侧/空间右侧；【角色A】视线朝画面右侧，【角色B】视线朝画面左侧。镜头始终保持在两人连线的同一侧拍摄，不跨越人物连线，不反转左右关系。连续镜头中两人的屏幕方位、视线方向、站位关系保持一致。

台词映射：【仅含台词时需要】
| 镜头号 | 时间段 | 说话人 | 台词原文 | 声音类型 | 口型要求 | 表演/动作要求 |
| --- | --- | --- | --- | --- | --- | --- |
| 01 | 0-3秒 | [角色] | “...” | 同期对白/OS/VO/内心独白 | [嘴部清楚/无需口型] | [克制动作] |

分镜时序：
镜头1（0-3秒）：【景别】，镜头【运镜】，画面内容【动作/环境】。
镜头2（3-6秒）：【景别】，镜头【运镜】，画面内容【动作/情绪】。
镜头3（6-9秒）：【景别】，镜头【运镜】，画面内容【冲突/转折】。
镜头4（9-12秒）：【景别】，镜头【运镜】，画面内容【结果/反应】。
镜头5（12-15秒）：【景别】，镜头【运镜】，画面内容【定格/悬念】，尾帧稳定，便于续接。

风格与约束：全程画面稳定不变形，人物五官清晰，人体结构正常，动作自然流畅，服装和发型一致，场景结构和光影风格一致。若存在多人关系，全程保持 180 度空间轴线稳定，不跨轴，不反转左右关系。若存在台词，所有台词严格按照剧本原文逐字执行，不改写、不省略、不新增、不换说话人。无肢体扭曲，无穿模，无闪烁，无卡顿，无字幕，无水印，无文字。

### 尾帧描述

[主体、背景、光线、构图、氛围；用于下一集衔接]
```

## Duration and Shot Splitting

Use these defaults unless the user specifies otherwise:

| Shot type | Recommended duration | Rule |
| --- | --- | --- |
| Fight, explosion, chase, high-intensity action | 1-2s | Keep action simple and split aggressively |
| Normal story action | 2-3s | One core action per shot |
| Dialogue, emotional reaction | 3-5s | Prioritize face, mouth, eyes, pause |
| Empty scene / establishing shot | 3-5s | Slow push, slow pan, or fixed shot works well |
| Single 15s video | 3-5 shots | Use one coherent emotional arc |
| 30s+ sequence | Multiple 15s segments | Reuse same character/scene/style constraints |

Hard rules:

- One shot expresses one core emotion.
- One shot completes one core action.
- Complex actions must be split.
- Do not combine multiple spatial changes and multiple camera moves in one shot.

## Multi-Reference and @ Syntax

Always explain what each uploaded material controls:

- `@图片1 作为主角外观参考，锁定脸型、发型、服装和体型。`
- `@图片2 作为场景参考，锁定空间布局、建筑风格和光影氛围。`
- `@图片3 作为本段站位参考分镜图，锁定人物左右站位、前后层次、空间锚点关系、视线方向与镜头机位。`
- `@视频1 作为运镜参考，只学习镜头运动轨迹，不复制其中人物和场景。`
- `@音频1 作为背景音乐和节奏参考，画面节奏与鼓点同步。`

For multiple characters:

```text
@图片1 是女主外观参考，穿浅青色长裙，神情冷静。@图片2 是男主外观参考，穿深色武将服，神情克制。@图片3 是本段站位参考分镜图，女主位于画面左侧，男主位于画面右侧，两人位置关系、视线方向和空间锚点保持稳定，不新增其他主要人物。
```

Recommended reference load: 1-2 character images + 1 scene image + 1 blocking-reference image + optional 1 motion video + optional 1 audio reference. Keep total references around 4-5 when possible. Do not use a nine-grid as one complex reference; split it into separate usable images.

## Anti-Cross-Axis Rules

Use this whenever there are two or more characters in dialogue, confrontation, fight, handoff, chase, walking together, or any spatial relationship.

Add a `空间轴线设定` after `人物站位锁定` and before `台词映射` or `分镜时序`.

Standard patch:

```text
全程保持本场 180 度空间轴线稳定，镜头始终在人物连线同一侧拍摄；【角色A】保持在画面左侧，【角色B】保持在画面右侧；两人的视线方向与左右关系一致，不反转站位，不跨轴，不突然改变屏幕方向。若发生换位，必须通过明确的转身或走位动作完成，不能无故跳变。
```

Blocking lock patch:

```text
全程保持 @图片X 站位参考分镜图建立的人物位置关系：【角色A】始终位于画面【左/右】侧，【角色B】始终位于画面【左/右】侧；人物与【门/窗/桌/床/鞋柜/办公桌】等空间锚点关系不变；镜头始终在同一侧机位推进，不跨轴，不跳位，不反转左右关系。
```

Rules:

- If A is screen-left in the first shot, A remains screen-left in continuous shots.
- Screen-left characters usually look right; screen-right characters usually look left.
- Over-the-shoulder shots must name the shoulder and target, such as `从男主左肩后拍向女主，女主始终位于画面右侧`.
- Maintain motion direction across cuts unless using a turn, neutral establishing shot, empty shot, or prop close-up to reset space.
- Use stable anchors: table center, door background-right, window screen-left, stairs behind, counter foreground, etc.
- Avoid 360-degree orbit shots in dialogue; keep orbit within 45-90 degrees unless space is reset.
- For handoff, negotiation, table scenes, hospital rooms, offices, hallways, and entry/exit scenes, name both the physical anchor and the character's relationship to it.

Space reset methods:

- Full shot or wide shot that re-establishes all character positions.
- Prop close-up, such as cup, door handle, contract, phone screen.
- Visible character turn, seat change, walking around table, or crossing action.
- Empty-scene transition, such as street, hallway, doorway, or exterior.
- After reset, state the new left/right relationship, gaze direction, and camera side.

## Dialogue Mapping and Lip-Sync

Use this whenever the source contains dialogue, OS, VO, narration, or inner monologue.

Hard rules:

- Quote script dialogue verbatim. Do not rewrite, summarize, shorten, expand, merge, or localize unless asked.
- Bind every line to speaker, shot number, time range, sound type, mouth requirement, and performance action.
- One shot should carry at most one complete line. Split long dialogue by commas, pauses, or beats.
- Important dialogue should use medium-close or close shots with visible mouth, stable face, and restrained motion.
- Do not let two characters speak multiple lines in the same short shot.
- If using external audio, Seedance prompt controls facial performance and rhythm; final wording follows the audio track.

Sound types:

| Type | Meaning | Prompt rule |
| --- | --- | --- |
| 同期对白 | Character on screen speaks, lip sync required | Face or three-quarter face, mouth clear |
| OS / 画外音 | Speaker off screen | On-screen listener does not move mouth |
| VO / 旁白 | Narrative voice | No on-screen character opens mouth unless specified |
| 内心独白 | Character's inner voice | Character remains silent; mouth does not move |

Dialogue shot template:

```text
【景别】，【角色A】位于画面【左/右】侧，正面/三分侧脸可见，嘴部清晰。镜头【固定/缓慢推近】，角色A只说剧本原文台词：“【完整台词】”。说话过程中动作保持克制，只做【轻微表情/手部小动作】，口型与台词同步，语气为【情绪】。画面中其他角色保持安静聆听，不抢台词，不新增台词。全程不改写台词，不遗漏台词，不增加字幕，不出现无关文字。
```

Dialogue integrity patch:

```text
台词必须严格按照剧本原文执行：本镜头只允许【说话人】说出：“【台词原文】”。不得改写、不得省略、不得新增台词、不得改变说话人、不得调整台词顺序。若本镜头为画外音/旁白/内心独白，画面中的角色不得开口。角色嘴部动作与台词节奏同步，台词结束后再进入下一个动作或镜头。
```

## Video Extension, Stitching, First/Ending Frame, Local Edit

Use these task-specific templates when requested:

| Function | Use when | Key control |
| --- | --- | --- |
| 视频延长 | Dialogue, emotional accumulation, single-path movement, same-scene action | Use `<视频1>`, extend smoothly, keep character/scene/light consistent |
| 分段拼接 | Fight, chase, fast transition, multi-scene movement, complex action | Start from previous tail-frame action and keep the same spatial relationship |
| 首帧控制 | Series openings or high character consistency | Use `@图片1` or a first-frame image and keep opening composition/posture consistent |
| 尾帧控制 | Suspense ending, transition ending, next-episode continuation | End on a specified composition/emotional state |
| 局部修改 | Replace costume/prop, remove object, repair detail | Bind time range and spatial region; all other content unchanged |

Video extension:

```text
将 <视频1> 的内容向后平滑延长 10 秒，保持角色外观、服装、发型、场景结构、光影风格与前段完全一致。角色继续沿原方向缓慢前进，动作自然流畅，镜头运动延续前段节奏，无跳切，无闪烁，无变形。
```

Segment stitching:

```text
本段承接上一段结尾动作，使用同一角色、同一场景结构和同一光影风格。开场画面与上一段尾帧保持一致，动作从【上一段尾帧动作】自然继续，镜头节奏紧凑但不跳切。
```

First-frame control:

```text
使用 @图片1 作为首帧参考，开场构图、角色姿态、人物位置、服装发型、场景锚点和光影方向与 @图片1 保持一致。视频从该静态首帧自然启动，动作缓慢展开，无跳切，无闪烁，无突然变换机位。
```

Ending-frame control:

```text
最后停在【指定构图和情绪状态】，主体位置、背景、光线和道具清楚，尾帧稳定，便于下一段作为首帧继续生成。
```

Local edit:

```text
基于 @视频1 进行编辑，在【时间段】内，仅将画面中【区域/对象】修改为【新内容】。保持人物脸部、发型、动作、背景环境、镜头运动和光影完全不变。最终效果自然，无闪烁，无边缘破损。
```

## Standard Output Order

For a full production package, output in this order:

1. 统一素材编号表
2. 节奏预算预检表
3. 场景空间锚点表
4. 人物站位关系表
5. 空间轴线设定
6. 台词映射表
7. 站位参考分镜图提示词
8. 分镜脚本表
9. Seedance 2.0 增强视频提示词
10. 最终校验清单

## Final QA Checklist

Before final output, check:

- Material routing: character image is white-background/no-scene with default `3:4`; scene image is empty/no-people with default `16:9`; storyboard image is static story moment; video prompt uses time sequence.
- Blocking reference: any multi-character continuity segment has a full-shot `16:9` 站位参考分镜图 with people, environment anchors, left/right positions, foreground/midground/background, gaze direction, and camera side.
- References: every `@图片/@视频/@音频` has a clear control purpose.
- Rhythm budget: dialogue + action + emotion + camera movement + safety margin fits the target duration; if not, split the segment.
- Duration: each segment covers its full time range with sensible shot lengths.
- Action: each shot has one executable core action and one primary camera move.
- Scene anchors: doors, windows, beds, tables, desks, counters, corridors, light sources, and key props do not drift across shots.
- Continuity: character face, hair, costume, body, scene layout, light, palette, and props remain stable.
- Anti-cross-axis: multi-character scenes define left/right relationship, gaze direction, camera side, and reset rules when needed.
- Dialogue: every line is in the dialogue mapping table, quoted verbatim, assigned to the correct speaker and sound type.
- Lip sync: important lines use visible mouth; OS/VO/inner monologue do not make silent characters speak.
- Constraints: no extra people in character/scene references, no text/watermark/subtitles unless requested, no deformation/flicker/stutter/crossing axis.
- Sensitive or unstable wording: flag risks and suggest neutral substitutions.
