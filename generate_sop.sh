#!/bin/bash
# 快速生成SOP - 集成版

set -e

WORKSPACE="/root/.openclaw/workspace/phd_application_workspace"
SYNC_SCRIPT="$WORKSPACE/sync_from_verified.sh"

# 1. 确保数据同步
echo "🔄 步骤1: 同步最新数据..."
if [ -f "$SYNC_SCRIPT" ]; then
  bash "$SYNC_SCRIPT"
else
  echo "❌ 同步脚本不存在: $SYNC_SCRIPT"
  exit 1
fi

# 2. 检查数据是否就绪
PERSONAL="$WORKSPACE/personal_info/my_profile.json"
PROFESSOR=$(ls "$WORKSPACE/professors"/*.json 2>/dev/null | head -1)

if [ ! -f "$PERSONAL" ]; then
  echo "❌ 个人数据缺失"
  echo "   请先提交并验证你的个人信息到主workspace"
  exit 1
fi

if [ -z "$PROFESSOR" ] || [ ! -f "$PROFESSOR" ]; then
  echo "❌ 导师档案缺失"
  echo "   请先归档目标导师信息"
  exit 1
fi

echo "✅ 数据检查通过"
echo "   个人数据: $(basename $PERSONAL)"
echo "   导师档案: $(basename $PROFESSOR)"
echo ""

# 3. 准备调用phd-personal-statement Skill
VERSION="v1.0_$(date +%Y%m%d_%H%M)"
DRAFT_DIR="$WORKSPACE/drafts/$VERSION"
mkdir -p "$DRAFT_DIR"

echo "🎯 步骤2: 调用 phd-personal-statement Skill"
echo "   工作目录: $DRAFT_DIR"
echo ""

# 生成任务提示词
# 由于skills需要在单独session中运行，我们生成task文件供后续使用
TASK_FILE="$DRAFT_DIR/__task_prompt.txt"

cat > "$TASK_FILE" << 'TASK_EOF'
你是博士申请个人陈述写作专家。根据以下信息生成一篇800-1000词的SOP。

【申请人信息】（请读取附件中的个人数据JSON）
【目标导师信息】（请读取附件中的导师档案JSON）

结构要求：
1. 开头（150词）：研究兴趣起源
2. 为什么选择这个领域（200词）
3. 为什么选择这个导师/学校（200词）← 重点突出导师研究方向匹配
4. 学术背景和研究经历（250词）← 使用STAR原则，量化成果
5. 未来目标（200词）：短期博士计划 + 长期职业规划
6. 结尾（50词）：简洁有力

要求：
- 第一人称
- 专业、真诚、有说服力
- 突出与导师研究的契合点
- 避免模板化，体现个人特色
- 所有信息必须基于提供的JSON数据

输出格式：
- Word文档（.docx）
- 附带修改记录
TASK_EOF

echo "📝 任务提示词已生成: $TASK_FILE"
echo ""
echo "🚀 步骤3: 启动phd-personal-statement agent"
echo ""
echo "请在另一个session中运行以下命令："
echo ""
echo "sessions_spawn \\"
echo "  runtime=\"subagent\" \\"
echo "  agentId=\"phd-ps\" \\"
echo "  task=\"博士申请SOP生成 - 版本 $VERSION\" \\"
echo "  attachments='[{\"name\":\"personal_profile.json\",\"content\":\"$(cat $PERSONAL | base64)\"},{\"name\":\"professor.json\",\"content\":\"$(cat $PROFESSOR | base64)\"}]' \\"
echo "  cwd=\"$DRAFT_DIR\""
echo ""
echo "或手动操作："
echo "1. 打开 phd-personal-statement skill"
echo "2. 上传: $PERSONAL 和 $PROFESSOR"
echo "3. 粘贴 $TASK_FILE 中的提示词"
echo "4. 指定输出路径: $DRAFT_DIR/sop_${VERSION}.docx"
echo ""
echo "📊 工作区状态:"
echo "  版本目录: $DRAFT_DIR"
echo "  个人数据: $PERSONAL ($(wc -l < $PERSONAL) 行)"
echo "  导师档案: $PROFESSOR ($(wc -l < $PROFESSOR) 行)"