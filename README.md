# 🎓 PhD 申请专用 Workspace

独立管理博士申请全过程，与主workspace分离。

## 📁 目录结构

```
phd_application_workspace/
│
├── 📁 personal_info/        # 同步后的已验证个人信息（只读）
│   └── my_profile.json
│
├── 📁 professors/           # 目标导师档案（只读）
│   ├── wen_liu_xjtlu.json
│   └── [其他导师].json
│
├── 📁 drafts/              # SOP草稿（版本化）
│   ├── v1.0_XJTLU_20260311/  # 示例
│   │   ├── __task_prompt.txt
│   │   └── sop_EN.md (output)
│   ├── v1.1_XJTLU_20260312/
│   └── v2.0_final/
│
├── 📁 requirements/        # 各学校具体要求
│   ├── xjtlu_phd_description.json  # ✅ XJTLU官方要求
│   └── [其他学校].json
│
├── 📁 deadlines/           # 截止日期追踪
│   └── 2025_fall_deadlines.json
│
├── 📁 submitted/           # 提交记录
│   └── submission_log.json
│
├── 📄 metadata.json        # 本workspace元数据
├── 📄 CHANGELOG.md         # 更新日志
│
├── 🔄 sync_from_verified.sh     # ✅ 数据同步脚本
├── 🚀 generate_sop.sh           # 通用生成器（多校）
└── 🇨🇳 generate_xjtlu.sh        # ✅ XJTLU定制生成器
```

---

## 🚀 快速开始（3步）

### 1️⃣ 同步数据
```bash
cd /root/.openclaw/workspace/phd_application_workspace
./sync_from_verified.sh
```
→ 自动从主存储复制最新个人数据和导师档案

### 2️⃣ 检查数据
```bash
ls -la personal_info/ professors/
```
如果 `personal_info/` 为空 → 你**尚未提交个人信息**，需要先验证

### 3️⃣ 生成SOP草稿
#### 申请XJTLU（推荐）
```bash
./generate_xjtlu.sh v1.0
```
✅ 输出6段式结构，强制覆盖官方4个必答题

#### 申请其他学校（通用）
```bash
./generate_sop.sh v1.0
```
✅ 输出7段式标准结构

#### 后续步骤
脚本会创建版本目录，并输出 `sessions_spawn` 命令。  
在新session中运行该命令，调用 `phd-personal-statement` Skill 自动生成SOP。

---

## 📋 XJTLU专用结构（6段式）

根据学校官方要求严格设计：

| 段 | 字数 | 内容要点 | 学校要求覆盖 |
|---|---|---|---|
| 1 | 120 | 引言：研究兴趣起源 | Motivation |
| 2 | 200 | 学术成就（量化） | Academic achievements |
| 3 | 200 | 研究经历（STAR） | （隐含） |
| 4 | 150 | **Why XJTLU**：导师匹配 + 学校资源 | Reasons for choosing XJTLU |
| 5 | 150 | **Future plan**：博士4-5年分阶段 | Future study plans |
| 6 | 80 | 结语：职业目标 | （隐含） |

**注意**：段4和段5必须**明确回答**学校要求的两个问题。

---

## 🗂️ 与主系统分离

```
主 Workspace (/root/.openclaw/workspace/)
│
├── user_data/                   # 核心可信源（单一）
│   ├── raw/                     # 你上传的原始文件
│   ├── verified/                # 验证通过后的数据
│   │   ├── my_profile.json     ← 个人数据来源
│   │   └── wen_liu_professor.json ← 导师档案来源
│   └── validation_reports/
│
├── phd_application_workspace/   # ✨ 独立项目区（本workspace）
│   ├── personal_info/   ← 只读副本（同步）
│   ├── professors/      ← 只读副本（同步）
│   ├── drafts/          ✅ 你的工作区
│   ├── requirements/    ✅ 学校要求
│   ├── deadlines/       ✅ 时间管理
│   └── submitted/       ✅ 提交追踪
│
├── skills/                # Skill库（共享）
└── memory/                # 日常记忆（共享）
```

**原则**：
- `user_data/verified/` 是**单一可信源**，不直接修改
- `phd_application_workspace/` 是**派生和创作层**
- 版本控制：每次修改创建新 `drafts/vX.X_...` 文件夹

---

## 🛠️ 可用脚本

| 脚本 | 功能 | 何时使用 |
|------|------|----------|
| `sync_from_verified.sh` | 从主存储同步数据 | 首次使用或数据更新后 |
| `generate_sop.sh` | 通用SOP生成 | 申请多所学校 |
| `generate_xjtlu.sh` | XJTLU定制生成 | **申请西交利物浦必须用这个** |
| （可自建）`submit_tracker.sh` | 记录提交状态 | 提交后追踪 |

---

## 📝 参考文档

- **完整架构**：`README.md`（本文件）
- **快速开始**：`QUICKSTART.md`
- **更新历史**：`CHANGELOG.md`
- **数据模板**：`/root/.openclaw/workspace/user_data/template_v2_xjtlu.json`
- **验证指南**：`/root/.openclaw/workspace/user_data/README.md`

---

## ⚠️ 前置条件

✅ **个人信息必须已验证**并存入 `user_data/verified/`  
（如果没有，先运行：`submit_user_data.sh my_info.json`）

✅ **目标导师信息已归档**  
（如果没有，先用 `web_fetch` 提取并存入 `verified/`）

---

**创建**：2026-03-11  
**适配**：XJTLU SOP requirements  
**状态**：✅ 生产就绪