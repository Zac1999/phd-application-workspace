# Research Proposal - LaTeX Version

> 带完整引用的 IEEE 格式 Research Proposal

---

## 📁 文件结构

```
latex_rp/
├── main.tex              # 主文档（完整RP内容）
├── references.bib        # BibTeX 引用文件（15+篇文献）
├── compile.sh            # 编译脚本
├── README.md             # 本文档
└── main.pdf              # 生成的PDF（编译后）
```

---

## 🚀 快速开始

### 编译生成 PDF

```bash
# 进入目录
cd latex_rp

# 编译（默认）
./compile.sh

# 或完整编译（清理后重新编译）
./compile.sh all
```

### 清理辅助文件

```bash
# 只清理辅助文件（保留PDF）
./compile.sh clean

# 清理所有文件（包括PDF）
./compile.sh cleanall
```

---

## 📄 文档结构

### 1. 标题页 (Title Page)
- 项目标题
- 申请人信息
- 目标院校（XJTLU）
- 导师信息

### 2. 目录 (Table of Contents)
- 自动生成，带超链接

### 3. 正文内容

| 章节 | 内容 | 页数估计 |
|------|------|----------|
| 1. Project Title | 标题（14词） | 1 |
| 2. Project Summary | 摘要（98词） | 1 |
| 3. Background | 研究背景与动机、文献综述 | 3-4 |
| 4. Objectives & RQs | 6个研究问题与假设 | 2-3 |
| 5. Methods | 研究设计、方法论、设备资源 | 3-4 |
| 6. Significance | 理论/实践贡献、产业影响 | 1-2 |
| 7. Risk Mitigation | 风险缓解策略表 | 1 |
| 8. Timeline | 4年研究计划与交付物 | 2 |
| References | IEEE格式引用（15+篇） | 2-3 |

**总计：约 15-20 页**

---

## 📚 引用文献

引用文件 `references.bib` 包含 15+ 篇文献，涵盖：

### GaN 器件技术
- [1] Gao et al. (2024) - GaN功率器件最新进展
- [2] Liu et al. (2024) - 单片集成挑战与机遇
- [3] Ambacher et al. (1999) - 2DEG物理基础

### DCFL 技术
- [6] Hwang et al. (2016) - DCFL电路设计
- [7] Nanjing (2013) - 146ps/stage环形振荡器
- [8] Intel (2026) - 300mm GaN Chiplet

### 保护与传感
- [9] Zhang et al. (2023) - SenseFET电流检测
- [10] Zhang et al. (2022) - TBLS电平移位器
- [11] Joh & del Alamo (2014) - 电流崩塌机制

### 其他
- [14] Enz et al. (1995) - EKV模型基础
- [15] Innoscience (2024) - 产业应用
- [16] XJTLU (2024) - 校内工艺

---

## 🛠️ 编译环境要求

### 必需
- **TeX Live** (推荐 2023 或更新版本)
- **biber** (用于处理 BibTeX 引用)

### 安装（Ubuntu/Debian）
```bash
sudo apt-get update
sudo apt-get install texlive-full biber
```

### 安装（macOS）
```bash
brew install --cask mactex
# biber 已包含在 MacTeX 中
```

---

## ✨ LaTeX 特性

### 使用的宏包
- `geometry` - 页面边距设置（2.5cm）
- `biblatex` + `biber` - IEEE格式引用
- `booktabs` + `longtable` - 专业表格
- `hyperref` - 超链接和PDF元数据
- `siunitx` - 单位规范（$\mu$m, °C等）
- `amsmath` - 数学公式

### 格式特点
- ✅ IEEE 引用格式（[1], [2]...）
- ✅ 1.5倍行距
- ✅ 专业页眉页脚
- ✅ 自动目录（带超链接）
- ✅ 表格跨页支持
- ✅ 数学公式正确渲染

---

## 📝 修改指南

### 修改个人信息
编辑 `main.tex` 中的标题页部分：
```latex
{\large\textbf{Applicant:} Yuhang Liu\par}
{\large\textbf{Target Program:} PhD in ... \par}
{\large\textbf{Supervisor:} Prof. Wen Liu\par}
```

### 添加引用
1. 在 `references.bib` 中添加 BibTeX 条目
2. 在 `main.tex` 中使用 `\cite{key}` 引用
3. 重新编译

### 调整格式
- 页边距：`\usepackage[margin=2.5cm]{geometry}`
- 行距：`\setstretch{1.5}`
- 字体大小：`\documentclass[12pt]{article}`

---

## 🔍 常见问题

### Q: 编译报错 "biber not found"
**A:** 安装 biber
```bash
sudo apt-get install biber  # Ubuntu
brew install biber          # macOS
```

### Q: 引用显示为 "[?]"
**A:** 需要运行 biber 处理引用
```bash
./compile.sh all  # 完整编译流程
```

### Q: 中文显示乱码
**A:** 本模板为英文RP，如需中文请使用 `ctex` 宏包

---

## 📤 提交建议

### PDF 生成后检查清单
- [ ] 页数符合要求（通常 15-20 页）
- [ ] 引用格式正确（IEEE [1], [2]...）
- [ ] 图表清晰可读
- [ ] 超链接可点击
- [ ] 无编译警告（或警告可接受）

### 提交文件
```
├── RP_YuhangLiu.pdf      # 重命名后的PDF
└── source/               # 可选：源代码压缩包
    ├── main.tex
    ├── references.bib
    └── compile.sh
```

---

## 📞 联系信息

**Author:** Yuhang Liu  
**Target:** XJTLU PhD in Electrical and Electronic Engineering  
**Supervisor:** Prof. Wen Liu  

---

*Generated: March 20, 2026*  
*Version: 1.0.0*  
*LaTeX Template: IEEE Conference Style*
