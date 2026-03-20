# Auto Research Refine Task
## Research Proposal v3 自动优化流程

---

### 输入文件
- **当前 RP**: `rp_v3_revised.md`
- **SOP 对齐版**: `../../../drafts/v1.0_XJTLU_20260313_1525/sop_EN_v3_aligned.md`
- **一致性清单**: `../../../research_proposals/CONSISTENCY_CHECKLIST.md`

---

### 优化目标

1. **语言精炼**
   - 检查冗长表述，精简句子
   - 确保学术写作风格一致
   - 消除重复内容

2. **逻辑强化**
   - 6个RQ之间的逻辑连贯性
   - 假设与研究方法的对应关系
   - 时间线的合理性

3. **技术准确性**
   - 术语使用准确性
   - 技术参数合理性
   - 方法论可行性

4. **与SOP一致性最终检查**
   - 研究方向一致
   - 时间线匹配
   - 术语统一

---

### 输出要求

生成 `rp_v3_refined.md`，包含：
- 优化后的完整RP
- 修改日志（修改点、原因、位置）
- 与SOP的一致性声明

---

### 具体检查项

**Section 1: Title & Summary**
- [ ] 标题准确反映研究内容
- [ ] Summary 涵盖所有6个RQ
- [ ] 字数控制在100词以内

**Section 2: Background**
- [ ] 文献综述逻辑清晰
- [ ] Research Gap 明确
- [ ] 与6个RQ的关联性

**Section 3: Research Questions**
- [ ] 每个RQ表述清晰
- [ ] Hypothesis 可验证
- [ ] 6个RQ之间无重叠

**Section 4: Methodology**
- [ ] 4阶段流程清晰
- [ ] 4次流片安排合理
- [ ] AI脚本工具范围明确

**Section 5: Timeline**
- [ ] 与SOP的4年制一致
- [ ] 流片时间分布合理
- [ ] 验证方法具体

**Section 6: Significance**
- [ ] 贡献点明确
- [ ] 与RQ对应

---

### 执行命令

请在独立 session 中执行：

```bash
sessions_spawn \
  runtime="subagent" \
  agentId="phd-personal-statement" \
  mode="run" \
  task="请优化以下Research Proposal，按照上述检查项进行精炼和逻辑强化。"
```
