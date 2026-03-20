#!/bin/bash
# 生成SOP草稿（使用 phd-personal-statement Skill）

set -e

WORKSPACE="/root/.openclaw/workspace/phd_application_workspace"
PERSONAL_INFO="$WORKSPACE/personal_info/my_profile.json"
PROFESSORS_DIR="$WORKSPACE/professors"
DRAFTS_DIR="$WORKSPACE/drafts"

# 参数处理
VERSION=$1
if [ -z "$VERSION" ]; then
  echo "用法: $0 <版本号> [导师文件名]"
  echo "示例: $0 v1.0 wen_liu_xjtlu.json"
  echo "       $0 v1.0  # 使用第一个导师文件"
  exit 1
fi

# 检查个人数据
if [ ! -f "$PERSONAL_INFO" ]; then
  echo "❌ 缺失个人数据文件: $PERSONAL_INFO"
  echo "   请先运行: ./sync_from_verified.sh"
  exit 1
fi

# 选择导师文件
if [ -n "$2" ]; then
  PROFESSOR_FILE="$PROFESSORS_DIR/$2"
else
  # 使用第一个找到的导师文件
  PROFESSOR_FILE=$(ls "$PROFESSORS_DIR"/*.json 2>/dev/null | head -1)
fi

if [ ! -f "$PROFESSOR_FILE" ]; then
  echo "❌ 未找到导师档案文件"
  echo "   请确保已同步导师数据: ./sync_from_verified.sh"
  exit 1
fi

echo "🎓 生成SOP草稿"
echo "  版本: $VERSION"
echo "  个人数据: $(basename $PERSONAL_INFO)"
echo "  导师档案: $(basename $PROFESSOR_FILE)"
echo ""

# 创建版本目录
DRAFT_DIR="$DRAFTS_DIR/$VERSION"
mkdir -p "$DRAFT_DIR"

# 输出文件
OUTPUT="$DRAFT_DIR/sop_${VERSION}_$(date +%Y%m%d_%H%M).md"

echo "⏳ 正在调用 phd-personal-statement Skill..."
echo "   这可能需要几分钟..."
echo ""

# 调用技能生成SOP
# 注意：这里使用当前会话的能力直接生成，不启动新session
# 因为我们在主session中，可以直接分析数据并生成

# 读取数据
PERSONAL_DATA=$(cat "$PERSONAL_INFO")
PROFESSOR_DATA=$(cat "$PROFESSOR_FILE")

# 生成提示词
PROMPT=$(cat << EOF
你是一个博士申请个人陈述写作专家。请根据以下信息生成一篇高质量的个人陈述。

## 申请人信息
$(echo "$PERSONAL_DATA" | python3 -m json.tool 2>/dev/null || echo "$PERSONAL_DATA")

## 目标导师信息
$(echo "$PROFESSOR_DATA" | python3 -m json.tool 2>/dev/null || echo "$PROFESSOR_DATA")

## 要求
1. 字数: 800-1000词
2. 结构: 
   - 开头: 研究兴趣的起源（150词）
   - 为什么选择这个领域（200词）
   - 为什么选择这个导师/学校（200词）
   - 学术背景和研究经历（250词）
   - 未来目标和为什么适合（200词）
   - 结尾（50词）
3. 使用第一人称
4. 突出与导师研究的匹配点
5. 量化成果（如有）
6. 专业、真诚、有说服力

请生成完整的个人陈述，保存为Markdown格式。
EOF
)

# 这里应该调用技能，但为了简化，我们先直接调用
# 实际应该使用 sessions_spawn 或技能系统
echo "⚠️  注意：当前需要手动调用 phd-personal-statement Skill"
echo "   请在另一个session中运行:"
echo ""
echo " sessions_spawn \\"
echo "   runtime=\"subagent\" \\"
echo "   task=\"$PROMPT\" \\"
echo "   label=\"sop_generation_$VERSION\""
echo ""
echo "或直接将上述提示词粘贴给 phd-personal-statement Skill"
echo ""
echo "草稿目录已创建: $DRAFT_DIR"
echo "请将生成的SOP保存到: $OUTPUT"