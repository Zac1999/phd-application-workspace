# PhD Research Proposal - Group Meeting
## GaN Power IC with DCFL-Based Driver Systems

---

# Slide 1: Title

**High-Performance GaN Power Integrated Circuits**

*Design and Optimization of DCFL-Based Driver Systems with Enhanced Reliability*

**Presenter:** Yuhang Liu
**Date:** March 2026
**Supervisor:** Prof. Wen Liu

---

# Slide 2: Research Overview

## Project Summary

**Core Objective:**
Develop a comprehensive GaN power IC platform integrating:
- Protection circuits (OC/OV/OT)
- High noise-immunity level shifters
- Precision current sensing

**Key Innovation:**
AI-assisted scripting tools for automated EKV model extraction across process nodes

**Target Applications:**
- Electric vehicle powertrains
- Renewable energy inverters
- Industrial motor drives

---

# Slide 3: Research Questions

## Six Focus Areas (RQs)

| RQ | Topic | Key Challenge |
|----|-------|---------------|
| **RQ1** | Circuit Protection Architecture | Sub-microsecond fault detection |
| **RQ2** | High Noise Immunity Level Shifting | >1000V/ns dV/dt immunity |
| **RQ3** | Precision Current Sensing | Full load range accuracy |
| **RQ4** | Thermal-Electrical Co-Design | Layout optimization |
| **RQ5** | Dynamic Reliability Enhancement | Vth/Rds(on) compensation |
| **RQ6** | AI-Assisted EKV Extraction | Cross-process automation |

---

# Slide 4: RQ1 - Protection Architecture

## Over-Current/Over-Voltage/Over-Temperature Protection

**Problem:**
Discrete protection circuits increase system complexity and response time

**Approach:**
- SenseFET-based current sensing
- Stacked high-voltage detection structures
- Temperature-compensated reference circuits

**Target:**
- Response time: **<1μs**
- Area overhead: **<15%** of total chip area

---

# Slide 5: RQ2 - Level Shifter Design

## High dV/dt Immunity for 650V Half-Bridge

**Challenge:**
Modern GaN switches at >100V/ns, existing drivers struggle above 500V/ns

**Solution:**
Modified Three-Branch Level Shifter (TBLS) with:
- Capacitive isolation
- Active common-mode cancellation
- Differential filtering

**Target Performance:**
- dV/dt immunity: **>1000V/ns**
- Propagation delay: **<50ns**

---

# Slide 6: RQ3-RQ5 - Circuit Techniques

## Supporting Circuit Innovations

**RQ3: Precision Current Sensing**
- Kelvin-connected SenseFET layouts
- Parasitic inductance compensation
- Process/temperature drift calibration

**RQ4: Thermal-Electrical Co-Design**
- Thermal-aware placement algorithms
- Integrated temperature sensors
- Adaptive gate drive control

**RQ5: Dynamic Reliability Enhancement**
- Real-time Vth monitoring
- Dynamic gate voltage adjustment
- Lifetime performance maintenance

---

# Slide 7: RQ6 - AI-Assisted Automation

## Automated EKV Model Extraction

**Problem:**
Manual EKV parameter extraction is time-consuming and limits cross-process portability

**Solution:**
AI-assisted scripting tools for:
- Automated parameter fitting
- Batch processing across nodes
- Cross-process comparison

**Scope:**
- **NOT** for AI training or device modeling
- **ONLY** for script automation and workflow optimization

**Target Nodes:** 0.25μm | 0.5μm | 2μm GaN processes

---

# Slide 8: Research Methodology

## Four-Stage Design Flow

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  Stage 1    │ → │  Stage 2    │ → │  Stage 3    │ → │  Stage 4    │
│ Specification│    │  Schematic  │    │   Layout    │    │ Validation  │
│  & Architecture│  │   Design    │    │  & Verification│   │  (Post-Silicon)│
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
    Months 1-6         Months 6-12       Months 10-14        Per Tape-out
```

**Tools:** Cadence Virtuoso, Keysight ADS, COMSOL Multiphysics

---

# Slide 9: 4-Year Timeline with 4 Tape-outs

## Research Schedule

| Year | Phase | Tape-out | Focus |
|------|-------|----------|-------|
| **Year 1** | Foundation | - | PDK analysis, architecture design, simulation |
| **Year 2** | First Validation | **#1** | Individual circuit blocks validation |
| **Year 3** | Integration | **#2** | Full system integration |
| **Year 3** | Multi-Process | **#3** | Cross-process validation (0.25/0.5/2μm) |
| **Year 4** | Final Demo | **#4** | Final system demonstration |

**Total Duration:** 48 months (4 years full-time)

---

# Slide 10: Tape-out Details

## Four-Tape-out Strategy

**Tape-out #1 (Month 16)**
- Individual building blocks
- RQ1-RQ5 circuit validation
- Basic functionality verification

**Tape-out #2 (Month 28)**
- Integrated system
- Full protection + driver + sensing
- System-level performance

**Tape-out #3 (Month 36)**
- Multi-process validation
- 0.25μm / 0.5μm / 2μm variants
- Cross-portability demonstration

**Tape-out #4 (Month 40)**
- Final optimized design
- Complete system demonstration
- Final characterization

---

# Slide 11: Validation Methodology

## Post-Silicon Validation Plan

**For Each Tape-out:**

| Stage | Activities | Duration |
|-------|-----------|----------|
| **Wafer Probe** | DC characterization, functionality check | 2-4 weeks |
| **Performance** | AC/switching tests, delay measurement | 3-4 weeks |
| **Stress Test** | dV/dt immunity, temperature sweep | 2-3 weeks |
| **Correlation** | Sim-vs-measurement analysis | 2-3 weeks |

**Equipment:**
- Semiconductor parameter analyzers
- High-voltage pulse generators
- Thermal imaging systems
- Probe stations

---

# Slide 12: Expected Contributions

## Research Outputs

**Theoretical:**
1. GaN DCFL design framework with validated building blocks
2. Thermal-electrical coupling characterization methodology
3. Automated EKV extraction workflow

**Practical:**
1. Integrated protection solutions for GaN systems
2. High noise immunity level shifting techniques
3. Cross-process design portability tools

**Industrial:**
1. EV powertrain application reference designs
2. Renewable energy system efficiency improvements
3. Technology transfer through XJTLU partnerships

---

# Slide 13: Risk Mitigation

## Potential Risks and Countermeasures

| Risk | Impact | Mitigation Strategy |
|------|--------|---------------------|
| Process variation | Performance deviation | Design for worst-case corners; statistical methods |
| Thermal issues | Reliability degradation | Conservative ratings; integrated monitoring |
| Extraction tool accuracy | Model mismatch | Validation against manual extraction; iterative refinement |
| Fabrication delays | Schedule slip | Early foundry engagement; parallel design tracks |
| Measurement correlation | Validation failure | Comprehensive test structures; systematic debugging |

---

# Slide 14: Resources & Facilities

## Available Resources

**Fabrication Access:**
- XJTLU in-house 2μm GaN facility
- External foundry partnerships (0.25μm, 0.5μm)

**Simulation Tools:**
- Cadence Virtuoso (circuit design)
- Keysight ADS (RF/system simulation)
- COMSOL Multiphysics (thermal/EM analysis)

**Characterization:**
- Semiconductor parameter analyzers
- High-voltage pulse generators
- Thermal imaging equipment
- Probe stations

---

# Slide 15: Summary & Next Steps

## Key Points

**Research Focus:**
- GaN power IC with integrated protection, sensing, and drive
- AI-assisted scripting for design automation (NOT training)
- 4 tape-outs over 4 years for thorough validation

**Innovation:**
- >1000V/ns dV/dt immunity level shifter
- <1μs protection response time
- Cross-process design portability

**Next Steps:**
1. Complete literature review
2. Foundry PDK acquisition and analysis
3. Initial circuit architecture design
4. Tape-out #1 preparation

---

# Slide 16: Thank You

## Questions & Discussion

**Contact:** yuhang.liu@xjtlu.edu.cn

**Project Repository:** [To be created]

**Target Venues:**
- IEEE Transactions on Power Electronics (TPEL)
- IEEE Transactions on Circuits and Systems I (TCAS-I)
- IEEE International Symposium on Power Semiconductor Devices (ISPSD)

---

*Generated from RP v3 - March 19, 2026*