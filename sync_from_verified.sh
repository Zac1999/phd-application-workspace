#!/bin/bash
# 从主存储同步已验证数据到申请workspace

set -e

SOURCE_BASE="/root/.openclaw/workspace/user_data/verified"
TARGET_BASE="/root/.openclaw/workspace/phd_application_workspace"

echo "🔄 开始同步已验证数据..."

# 1. 同步个人信息（选择最新的）
if [ -d "$SOURCE_BASE" ] && [ -n "$(ls -A $SOURCE_BASE 2>/dev/null)" ]; then
  # 找到除了 professors 之外的最新个人数据文件
  LATEST_PERSONAL=$(ls -t "$SOURCE_BASE"/*.json 2>/dev/null | grep -v "wen_liu" | head -1)

  if [ -n "$LATEST_PERSONAL" ]; then
    echo "📋 同步个人信息: $(basename $LATEST_PERSONAL)"
    cp "$LATEST_PERSONAL" "$TARGET_BASE/personal_info/my_profile.json"
    echo "   ✅ 已更新 personal_info/my_profile.json"
  else
    echo "⚠️  未找到个人数据文件（除了导师档案）"
  fi
else
  echo "❌ 源目录不存在或为空: $SOURCE_BASE"
  exit 1
fi

# 2. 同步所有导师档案
if [ -d "$SOURCE_BASE" ]; then
  echo "👨‍🏫 同步导师档案..."
  for prof_file in "$SOURCE_BASE"/*professor*.json; do
    [ -e "$prof_file" ] || continue
    echo "   📄 $(basename $prof_file)"
    cp "$prof_file" "$TARGET_BASE/professors/"
  done
fi

# 3. 统计报告
echo ""
echo "📊 同步完成统计:"
echo "  个人数据: $(ls -1 $TARGET_BASE/personal_info/*.json 2>/dev/null | wc -l) 个文件"
echo "  导师档案: $(ls -1 $TARGET_BASE/professors/*.json 2>/dev/null | wc -l) 个文件"
echo ""
echo "✅ 数据已就绪，可以开始生成SOP草稿"