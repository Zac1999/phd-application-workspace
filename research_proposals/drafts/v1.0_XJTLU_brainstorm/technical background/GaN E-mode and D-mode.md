**E/D-mode GaN 特指 AlGaN/GaN HEMT 的两种工作模式**

- **E-mode = Enhancement-mode 增强型 = 常关型（Normally-OFF）**
- **D-mode = Depletion-mode 耗尽型 = 常开型（Normally-ON）**

核心区别只有一条：

**零栅压 VGS=0 时，2DEG 沟道通不通；阈值电压 Vth 是正还是负。**

---

# 1. D-mode GaN HEMT（耗尽型、常开）

## 定义

**天然常规 GaN HEMT 就是 D-mode**

阈值电压：**Vth < 0**（典型：-2V ~ -5V）

## 工作原理

AlGaN/GaN 异质结由**极化效应**自发产生 **2DEG（二维电子气）**，

**VGS=0 时，沟道已经存在、已经导通**。

## 电学特性

- VGS = 0：**器件导通**，有明显漏极电流 IDS
- 要关断：必须加 **负栅压 VGS < Vth**，把 2DEG 完全耗尽
- 要导通：只要 VGS > Vth 就行（0V、正压都导通）
- 适合做：**负载管、恒流源、电阻负载**

---

# 2. E-mode GaN HEMT（增强型、常关）

## 定义

**人工改性后的 “安全型” GaN 器件**

阈值电压：**Vth > 0**（典型：+0.5 ~ +3V）

## 实现原理

通过工艺把 VGS=0 时的 2DEG 强行耗尽：

- p-GaN 栅
- 栅槽刻蚀（recessed gate）
- F 等离子注入

## 电学特性

- VGS = 0：**器件关断**，IDS ≈ 0
- 要导通：必须加 **正栅压 VGS > Vth**，重新形成沟道
- 要关断：只要 VGS < Vth 就关断
- 适合做：**驱动管、开关管、数字逻辑输入管**

---

# 3. 最核心对比（直接用于 DCFL）

|特性|D-mode 耗尽型 GaN HEMT|E-mode 增强型 GaN HEMT|
|---|---|---|
|阈值电压 Vth|**负** Vth < 0|**正** Vth > 0|
|VGS=0 状态|**导通（常开）**|**关断（常关）**|
|导通条件|VGS > Vth（0V 即可导通）|VGS > Vth（必须加正压）|
|关断条件|VGS < Vth（必须加负压）|VGS < Vth（0V 即可关断）|
|在 DCFL 中的角色|**负载管（Load transistor）**|**驱动管（Driver transistor）**|