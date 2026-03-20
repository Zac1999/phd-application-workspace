# 🎓 PhD 申请独立 Workspace - 快速开始

## 📦 已创建的结构

```
/root/.openclaw/workspace/phd_application_workspace/
│
├── 📄 metadata.json              # Workspace元数据（已创建）
├── 📁 personal_info/             # 你的个人信息（待同步）
├── 📁 professors/                # 导师档案（待同步）
├── 📁 drafts/                    # 草稿版本（自动创建）
├── 📁 requirements/              # 申请要求（待填写）
├── 📁 deadlines/                 # 截止日期（待填写）
├── 📁 submitted/                 # 提交记录（待填写）
│
├── 📘 README.md                  # 完整说明文档（已创建）
├── 🔄 sync_from_verified.sh      # 数据同步脚本（已创建 + 可执行）
└── 🚀 generate_sop.sh            # SOP生成脚本（已创建 + 可执行）
```

## ⚡ 三步启动

### 1️⃣ 数据同步
```bash
cd /root/.openclaw/workspace/phd_application_workspace
./sync_from_verified.sh
```
✅ 会将主存储的最新个人数据复制到 `personal_info/`  
✅ 会将所有导师档案复制到 `professors/`

### 2️⃣ 生成SOP草稿
```bash
./generate_sop.sh
```
✅ 创建版本目录 `drafts/v1.0_YYYYMMDD_HHMM/`  
✅ 生成任务提示词文件 `__task_prompt.txt`  
✅ 输出调用命令（复制到新session执行）

### 3️⃣ 调用 phd-personal-statement Skill
在**新的session**中运行：
```bash
sessions_spawn \
  runtime="subagent" \
  agentId="phd-ps" \
  task="博士申请SOP生成" \
  attachments='[{"name":"personal.json","content":"<base64编码的个人数据>"},{"name":"professor.json","content":"<base64编码的导师数据>"}]' \
  cwd="/root/.openclaw/workspace/phd_application_workspace/drafts/v1.0_XXXX/"
```

或手动操作：打开 phd-personal-statement skill → 上传附件 → 粘贴提示词 → 指定输出路径。

---

## 🗂️ 与主系统的隔离

| 主 Workspace | 本 PhD Workspace |
|-------------|-----------------|
| `user_data/raw/` | ← 只读同步 |
| `user_data/verified/` | → 同步源 |
| `phd_application_workspace/` | **独立创作区** |
| `memory/` | 不直接访问 |
| `MEMORY.md` | 不直接修改 |

**原则**：
- 核心数据（已验证信息）**单一可信源**：主workspace的 `user_data/verified/`
- 项目workspace只做**派生和创作**（drafts, requirements, deadlines）
- 版本控制：每个草稿版本独立文件夹

---

## 📋 目录详细说明

| 目录 | 用途 | 手动编辑? |
|------|------|----------|
| `personal_info/` | 个人数据（建议从verified同步后**不修改**） | ❌ 只读 |
| `professors/` | 导师档案（同理只读） | ❌ 只读 |
| `drafts/` | SOP草稿（版本化） | ✅ 主要工作区 |
| `requirements/` | 各学校具体要求（字数、问题） | ✅ 需填写 |
| `deadlines/` | 倒计时、任务清单 | ✅ 需维护 |
| `submitted/` | 提交记录、确认邮件 | ✅ 提交后更新 |

---

## 🔗 下一步

1. **运行同步**：确保个人数据已就绪
   ```bash
   ./sync_from_verified.sh
   ```

2. **检查数据**：
   ```bash
   ls -la personal_info/ professors/
   ```

3. **填写申请要求**（手动创建 `requirements/xjtlu.json`）：
   ```json
   {
     "university": "XJTLU",
     "program": "PhD in EEE",
     "deadline": "2025-03-15",
     "word_limit": 1000,
     "specific_questions": ["Why this program?", "Research experience?"],
     "format": "PDF"
   }
   ```

4. **生成草稿**：`./generate_sop.sh`

5. **运行 Skill**：在新session调用 phd-personal-statement agent

---

**状态**：✅ Workspace结构已就绪  
**下一步**：运行 `sync_from_verified.sh` 同步数据