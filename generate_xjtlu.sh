#!/bin/bash
# XJTLU SOP生成器 - 简化版

set -e

WORKSPACE="/root/.openclaw/workspace/phd_application_workspace"
SYNC_SCRIPT="$WORKSPACE/sync_from_verified.sh"
TEMPLATE_V2="/root/.openclaw/workspace/user_data/template_v2_xjtlu.json"

# 参数
VERSION=$1
TARGET_SCHOOL=${2:-"XJTLU"}

# 1. 同步数据
echo "🔄 正在同步数据..."
bash "$SYNC_SCRIPT" > /dev/null 2>&1 || { echo "❌ 同步失败"; exit 1; }

# 2. 检查
PERSONAL="$WORKSPACE/personal_info/my_profile.json"
PROFESSOR=$(ls "$WORKSPACE/professors"/*.json 2>/dev/null | head -1)

if [ ! -f "$PERSONAL" ]; then
  echo "❌ 缺少个人数据"
  echo "   请先验证你的个人信息"
  exit 1
fi

if [ -z "$PROFESSOR" ] || [ ! -f "$PROFESSOR" ]; then
  echo "❌ 缺少导师档案"
  echo "   请先归档导师信息"
  exit 1
fi

# 3. 准备
DRAFT_DIR="$WORKSPACE/drafts/${VERSION}_${TARGET_SCHOOL}_$(date +%Y%m%d_%H%M)"
mkdir -p "$DRAFT_DIR"
TASK_FILE="$DRAFT_DIR/__task_prompt.txt"

# 4. 生成任务提示
cat > "$TASK_FILE" << 'EOF'
你是博士申请个人陈述写作专家。请为XJTLU PhD申请撰写一篇英语个人陈述。

## XJTLU官方要求（严格遵循）：
1. Motivation to study the programme
2. Academic achievements in postgraduate/undergraduate studies
3. Future study plans
4. Reasons for choosing XJTLU

## 提供的资料：
- 个人数据：personal.json（包含教育背景、研究经历、技能）
- 导师档案：professor.json（包含研究方向、项目、要求）
- 要求模板：template_v2_xjtlu.json（字段说明）

## 结构（800-1000词）：
1. 引言（120词）：研究兴趣起源
2. 学术成就（200词）：本科/研究生亮点，量化结果
3. 研究经历（200词）：项目详情，STAR原则
4. 为什么选XJTLU（150词）：导师匹配 + 学校优势
5. 未来计划（150词）：博士4-5年分阶段
6. 职业目标（80词）：博士后 + 长期

## 质量标准：
- 第一人称、学术英语
- 所有信息必须基于提供的资料
- 突出与导师研究的契合点
- 具体、真诚、有说服力

输出：sop_EN.md（Markdown格式）
EOF

echo "✅ 准备完成"
echo "  工作区: $DRAFT_DIR"
echo "  个人数据: $(basename $PERSONAL)"
echo "  导师档案: $(basename $PROFESSOR)"
echo ""
echo "📋 任务提示词: $TASK_FILE"
echo ""
echo "🚀 请调用phd-personal-statement Skill："
echo ""
echo "方法：在新session运行"
echo "sessions_spawn runtime=\"subagent\" agentId=\"phd-ps\" task=\"XJTLU SOP生成\" cwd=\"$DRAFT_DIR\""
echo ""
echo "或者："
echo "1. 打开 phd-personal-statement skill"
echo "2. 上传3个文件："
echo "   - $PERSONAL"
echo "   - $PROFESSOR"
echo "   - $TEMPLATE_V2"
echo "3. 复制 $TASK_FILE 的内容作为任务提示"
echo "4. 输出到: $DRAFT_DIR/sop_EN.md"