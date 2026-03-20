# PhD Application Workflow System

> 自动化工作流系统，用于管理 Research Proposal 的审核、修订和版本控制

---

## 🎯 工作流概览

### RP Revision & GitHub Push Workflow

**触发条件**：当对话涉及 Research Proposal 相关内容时自动提示

**执行流程**：

```
┌─────────────────┐
│ 1. 读取当前RP    │
│   (drafts/)     │
└────────┬────────┘
         ▼
┌─────────────────┐
│ 2. 学术审核      │
│   → reviewed/   │
│   (生成audit报告)│
└────────┬────────┘
         ▼
┌─────────────────┐
│ 3. 自动修订      │
│   → revised/    │
│   (fix Major)   │
└────────┬────────┘
         ▼
┌─────────────────┐
│ 4. GitHub推送   │
│   (auto commit) │
└─────────────────┘
```

---

## 📁 文件结构

```
phd_application_workspace/
├── .agents/
│   ├── workflows/
│   │   ├── rp_revision_workflow.json    # 工作流定义
│   │   └── README.md                     # 本文档
│   └── triggers/
│       └── rp_workflow_trigger.json      # 触发器配置
├── research_proposals/
│   └── drafts/                           # 原始草稿
├── reviewed/                             # 审核报告
├── revised/                              # 修订版本（推荐）
└── final/                                # 最终版本
```

---

## 🚀 使用方法

### 自动触发

当对话中出现以下关键词时，agent 会自动询问：
- `rp`, `research proposal`, `研究计划`
- `修订rp`, `审核rp`, `push rp`
- `更新rp`, `rp版本`, `rp修改`

**示例对话**：
```
你: "帮我更新一下rp"
agent: "🔔 检测到 Research Proposal 相关内容
      是否执行 [RP Revision & GitHub Push Workflow]？
      回复 yes 执行，或 no 跳过"
你: "yes"
agent: [执行工作流...]
```

### 手动执行

直接告诉 agent 执行工作流：
```
你: "执行RP修订工作流"
或
你: "run rp revision workflow"
```

---

## 📋 工作流步骤详解

### Step 1: 读取当前 RP
- 定位最新版本：`research_proposals/drafts/v1.0_XJTLU_brainstorm/rp_v*.md`
- 分析当前版本号和内容状态

### Step 2: 学术审核
- 生成审核报告到 `reviewed/`
- 检查级别：
  - 🔴 Critical (必须修复)
  - 🟠 Major (应该修复) → 自动修复
  - 🟡 Minor (可选修复) → 记录待确认
- SOP 一致性验证

### Step 3: 生成修订版本
- 输出到 `revised/`
- 自动修复 Major Issues：
  - RQ 方法论细节增强
  - 定量指标补充
  - 术语一致性修正
- 保留 Minor Issues 供用户确认

### Step 4: GitHub 推送
- 自动 commit 并 push
- 提交信息包含版本变更摘要
- 目标仓库：`Zac1999/phd-application-workspace`

---

## 📝 命名规范

| 类型 | 格式 | 示例 |
|------|------|------|
| Draft | `rp_v{version}_YYYYMMDD_HHMM.md` | `rp_v3_20260320_0210.md` |
| Audit | `rp_v{version}_audit_YYYYMMDD_HHMMSS.md` | `rp_v3_audit_20260320_021000.md` |
| Revised | `rp_v{version}_revised_YYYYMMDD_HHMMSS.md` | `rp_v3_revised_20260320_0223.md` |
| Final | `rp_v{version}_final_YYYYMMDD_HHMMSS.md` | `rp_v3_final_20260320_0300.md` |

---

## ⚙️ 配置修改

### 修改触发关键词

编辑 `.agents/triggers/rp_workflow_trigger.json`：
```json
{
  "match_conditions": {
    "keywords": [
      "你的新关键词"
    ]
  }
}
```

### 修改工作流步骤

编辑 `.agents/workflows/rp_revision_workflow.json`：
```json
{
  "steps": [
    {
      "step": 1,
      "name": "你的新步骤"
    }
  ]
}
```

---

## 📊 版本历史

| 版本 | 日期 | 变更 |
|------|------|------|
| v1.0.0 | 2026-03-20 | 初始工作流创建 |

---

## 💡 最佳实践

1. **定期执行审核**：建议每次重大修改后执行工作流
2. **查看审核报告**：关注 Minor Issues 的改进建议
3. **保持版本一致**：确保 drafts → reviewed → revised → final 的版本对应
4. **及时推送**：修订完成后立即推送到 GitHub 备份

---

*Created by: Yuhang Liu*  
*Last updated: 2026-03-20*
