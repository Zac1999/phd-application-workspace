# PhD Research Proposal
## DCFL-Based GaN Power IC with High dV/dt Immunity

---

# Slide 1: Title

**DCFL-Based GaN Power IC with High dV/dt Immunity**

*An Improved Three-Stage TBLS Architecture for 650V GaN Half-Bridge Applications*

**Presenter:** [Your Name]
**Date:** March 2026
**Target Venues:** IEEE TCAS-I, IEEE TPEL

---

# Slide 2: Research Motivation

## The Problem

**High-performance GaN power devices face critical limitations:**

- ❌ Parasitic inductances in discrete implementations
- ❌ Off-chip protection circuits increase system complexity
- ❌ Poor reliability under high dV/dt switching conditions

**Must-Solve Bottleneck:**
> Modern GaN devices switch at >100V/ns, but existing drivers struggle above 200-500V/ns

**Success Criteria:**
- ✅ Propagation delay: **<50ns**
- ✅ Common-mode immunity: **>1000V/ns**
- ✅ Protection response: **<1μs**

---

# Slide 3: Literature Gap Analysis

## Existing Approaches vs. Our Work

| Approach | dV/dt Immunity | Delay | Integration | Limitation |
|----------|---------------|-------|-------------|------------|
| Conventional TBLS | ~200V/ns | ~20ns | On-chip | Passive CM rejection only |
| Bootstrap (TI) | ~100V/ns | ~50ns | On-chip | Cannot operate at 100% duty cycle |
| Capacitive Isolation | ~500V/ns | ~100ns | Off-chip | External component adds delay |
| State-of-the-Art | ~400V/ns | ~40ns | On-chip | Complex digital calibration |
| **Our Work** | **>1000V/ns** | **<50ns** | **On-chip** | **First to combine capacitive + active CM cancellation** |

**Critical Gap:** No existing solution combines on-chip integration + active CM cancellation + >1000V/ns immunity

---

# Slide 4: Core Innovation

## Three-Stage TBLS Architecture

**One-Sentence Thesis:**
> This research proposes an improved three-stage TBLS architecture combining capacitive isolation and active common-mode cancellation to achieve >1000V/ns immunity and <50ns propagation delay.

**First Demonstration of On-Chip Integration:**
1. **Capacitive Isolation** — High-voltage blocking
2. **Active CM Cancellation** — Noise suppression
3. **DCFL Output Driving** — Fast switching

---

# Slide 5: Technical Architecture

## Three-Stage Block Diagram

```
┌─────────────────────────────────────────────┐
│      Three-Stage TBLS Architecture          │
└─────────────────────────────────────────────┘
              │
    ┌─────────┼─────────┐
    ▼         ▼         ▼
┌───────┐ ┌─────────┐ ┌─────────┐
│Stage 1│ │ Stage 2 │ │ Stage 3 │
│Capac. │ │ Active  │ │  DCFL   │
│Isolate│ │   CM    │ │ Output  │
│       │ │Cancel   │ │ Buffer  │
└───────┘ └─────────┘ └─────────┘
   │           │           │
Ciso=1pF   Gm=10mS     >1A Drive
Vhold>700V 20dB CMRR   <10ns Rise
```

---

# Slide 6: Stage 1 - Capacitive Isolation

## Function: Block High dV/dt Common-Mode Interference

**Implementation:**
- On-chip MIM capacitor: **Ciso = 1pF**
- Voltage rating: **>700V** (for 650V GaN)

**Physical Principle:**
```
I_cm = Ciso × dV/dt
```
- For Ciso=1pF and dV/dt=1000V/ns: **I_cm = 1mA** (below threshold)

**Expected Performance:**
- ✅ Blocks **>90%** of common-mode current
- ✅ First line of defense against high dV/dt

---

# Slide 7: Stage 2 - Active CM Cancellation

## Function: Actively Cancel Residual Common-Mode Voltage

**Architecture:** Feedback-based active cancellation

**Working Principle:**
1. **CM Detection** — Differential pair senses CM voltage
2. **Amplification** — Transconductance amp (Gm=10mS)
3. **Feedback** — Current injection creates canceling voltage
4. **Loop Gain** — Acm_loop = 10 (**20dB suppression**)

**Stability Analysis:**
- Dominant pole: fp1 ≈ 10MHz
- Unity gain frequency: fu ≈ 100MHz
- **Phase margin: >60°**
- Bandwidth: >100MHz for fast CM tracking

---

# Slide 8: Stage 3 - DCFL Output Buffer

## Function: Fast Driving Capability

**Direct-Coupled FET Logic (DCFL) Features:**
- **>1A Drive capability**
- **<10ns Rise time**
- Optimized for GaN gate capacitance (~1nF)

**Advantages:**
- ✅ No level shifting required
- ✅ Low propagation delay
- ✅ High current drive for fast switching
- ✅ Compatible with 0.5μm GaN-on-Si process

---

# Slide 9: Shared Detection Architecture

## Integrated Protection System

**Monitors System Status & Triggers Protection:**

| Function | Detection Method | Response Time |
|----------|-----------------|---------------|
| Overcurrent (OC) | Current sensing | <500ns |
| Undervoltage (UV) | Voltage monitoring | <500ns |
| Overtemperature (OT) | Thermal sensor | <1μs |

**Key Benefits:**
- ✅ **30% area reduction** vs. independent architecture
- ✅ **<1μs total response time**
- ✅ Shared resources reduce complexity

---

# Slide 10: Experimental Validation Plan

## Claim Map & Evidence

| Claim | Why It Matters | Minimum Evidence |
|-------|----------------|------------------|
| **C1: >1000V/ns immunity** | Core innovation (5× SoTA) | dV/dt stress test at all corners |
| **C2: <50ns propagation delay** | Fast switching essential | Measured delay across temperature |
| **C3: <1μs protection response** | System reliability | Fault injection test results |

**Test Setup:**
- Equipment: Keysight DSOX6004A (6GHz), Tektronix optically isolated probe
- Device: 0.5μm GaN driver IC (QFN-24 package)
- Conditions: -40°C to 150°C, 5 process corners

---

# Slide 11: Milestones & Timeline

## 39-Month PhD Timeline

| Phase | Duration | Key Deliverables |
|-------|----------|------------------|
| **M0: Pre-silicon** | 3 months | Simulation validation (Blocks 1-4) |
| **M1: First Silicon** | 1 month | Basic functionality test |
| **M2: Performance** | 2 months | dV/dt & delay characterization |
| **M3: Protection** | 1 month | Fault response validation |
| **M4: System** | 2 months | Power, area, corner analysis |
| **M5: Final** | 1 month | Full dataset for paper |

**Tape-out:** Month 18-24
**Paper Submission:** Month 30-36

---

# Slide 12: Expected Results

## Performance Targets vs. State-of-the-Art

| Metric | Conventional | SoTA | **Our Target** | Improvement |
|--------|-------------|------|----------------|-------------|
| dV/dt Immunity | 200V/ns | 400V/ns | **>1000V/ns** | **2.5×** |
| Propagation Delay | 20ns | 40ns | **<50ns** | Comparable |
| Protection Response | 5μs | 2μs | **<1μs** | **2×** |
| Integration | Partial | On-chip | **Full on-chip** | Complete |

**Process:** 0.5μm GaN-on-Si (X-FAB or TSMC)

---

# Slide 13: Key References

## Literature Foundation

1. **Y. Zhang et al.** — High-voltage level shifter with improved CM rejection, *IEEE TCAS-I*, 2021
2. **Texas Instruments** — LMG3410R050 GaN FET with integrated driver, 2022
3. **Broadcom** — ACPL-333J gate drive optocoupler, 2020
4. **S. Park et al.** — 650V GaN-on-Si integrated gate driver, *IEEE JSSC*, 2022
5. **H. Wang & L. Zhang** — Capacitive isolation techniques review, *IEEE TPEL*, 2023
6. **J. Liu et al.** — GaN half-bridge driver with >500V/ns CMTI, *IEEE APEC*, 2024

---

# Slide 14: Summary

## Why This Research Matters

**Problem:** GaN power devices need better driver ICs for high dV/dt immunity

**Solution:** Three-stage TBLS architecture
- Stage 1: Capacitive isolation (>90% CM blocking)
- Stage 2: Active CM cancellation (20dB suppression)
- Stage 3: DCFL fast driving (<50ns delay)

**Impact:**
- ✅ **>1000V/ns immunity** (2.5× improvement over SoTA)
- ✅ **<1μs protection response**
- ✅ **Fully integrated** on-chip solution

**Next Step:** Pre-silicon validation and tape-out preparation

---

# Slide 15: Thank You

## Questions & Discussion

**Contact:** [Your Email]
**Repository:** [GitHub/Project Link]

**Target Venues:**
- IEEE Transactions on Circuits and Systems I (TCAS-I)
- IEEE Transactions on Power Electronics (TPEL)

---

# Appendix: Process Constraints

## Design