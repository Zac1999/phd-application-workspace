# Research Proposal - Revised Draft

# High-Performance GaN Power Integrated Circuits: Design and Optimization of DCFL-Based Driver Systems with Enhanced Reliability

## 1. Project Title

**High-Performance GaN Power Integrated Circuits: Design and Optimization of DCFL-Based Driver Systems with Enhanced Reliability**

---

## 2. Project Summary

This research develops high-performance gallium nitride (GaN) power integrated circuits using Direct-Coupled FET Logic (DCFL) architecture for next-generation power electronics. By integrating protection circuits, high noise-immunity level shifters, and precision current sensing on a single chip, this work addresses critical reliability challenges including high dV/dt immunity, thermal management, and dynamic threshold voltage drift. The research combines physics-based device modeling with AI-enhanced design methodologies to optimize GaN driver performance for industrial motor drives and power conversion applications. The outcomes will advance GaN integration technology while providing practical solutions for high-efficiency, high-reliability power electronic systems.

---

## 3. Background

### 3.1 Research Context and Motivation

The global transition toward electrification and renewable energy has created unprecedented demand for high-efficiency power electronic systems. Gallium Nitride (GaN) High Electron Mobility Transistors (HEMTs) have emerged as transformative devices for next-generation power conversion, offering superior switching speeds, lower on-resistance, and higher breakdown voltages compared to traditional silicon MOSFETs. These characteristics make GaN particularly attractive for electric vehicle powertrains, renewable energy inverters, data center power supplies, and industrial motor drives.

However, realizing the full potential of GaN power devices requires overcoming significant integration challenges. Current discrete implementations suffer from parasitic inductances that limit switching performance, while protection and sensing functions remain off-chip, increasing system complexity and cost. Monolithic integration of GaN power devices with their control and protection circuitry represents a critical frontier for advancing the technology.

### 3.2 Literature Review

#### 3.2.1 GaN Power Device Technology

GaN HEMTs leverage the AlGaN/GaN heterojunction to create a high-mobility two-dimensional electron gas (2DEG) channel, enabling exceptional electron mobility (>2000 cm²/V·s) and high current density. Two operational modes exist: Enhancement-mode (E-mode, normally-OFF) with positive threshold voltage (Vth > 0), and Depletion-mode (D-mode, normally-ON) with negative threshold voltage (Vth < 0). E-mode devices are preferred for power electronics due to their fail-safe operation, while D-mode devices serve as active loads in integrated circuits.

Recent advances have demonstrated E-mode GaN HEMTs with threshold voltages exceeding 1.5V, enabling robust logic-level compatibility. Peking University (2024) achieved 650V GaN-on-Silicon integrated circuits using virtual body isolation technology, demonstrating the feasibility of high-voltage monolithic integration. Liverpool University (2025) reported GaN DCFL circuits operating at 300°C with conversion efficiencies exceeding 90%, highlighting the technology's potential for harsh environments.

#### 3.2.2 Direct-Coupled FET Logic (DCFL) for GaN Integration

DCFL represents the dominant approach for GaN digital and mixed-signal integration, utilizing E-mode HEMTs as driver transistors and D-mode HEMTs as load devices. This configuration eliminates the need for p-channel devices, which remain challenging in GaN technology due to the material's wide bandgap and low hole mobility.

Key performance metrics for GaN DCFL include:
- Propagation delay: 146 ps/stage demonstrated by Nanjing Electronic Devices Institute (2013)
- Operating frequency: 201 MHz in 17-stage ring oscillators
- Temperature stability: Full logic functionality maintained at 300°C
- Breakdown voltage: Up to 1400V for integrated E-mode power HEMTs

Recent developments include Intel's 300mm GaN Chiplet technology (2026), integrating GaN N-MOSHEMT with silicon PMOS for CMOS-compatible logic libraries, pointing toward hybrid integration pathways.

#### 3.2.3 Protection and Sensing Circuits

Reliable GaN power ICs require comprehensive protection mechanisms:

**Over-Current Protection (OCP):** SenseFET-based current sensing enables microsecond-level fault detection. Recent work has demonstrated "Fast Short-Circuit Detection" (FSCD) using matched sensing transistors with propagation delays below 1μs.

**Over-Voltage Protection (OVP):** High-voltage level shifters must withstand extreme dV/dt transients. The Three-Branch Level Shifter (TBLS) architecture achieves dV/dt immunity exceeding 100V/ns while maintaining propagation delays below 14ns.

**Thermal Management:** Dynamic on-resistance (Rds(on)) degradation, known as "current collapse," results from charge trapping in buffer layers and surface states. This phenomenon is thermally activated and represents a critical reliability concern for GaN devices.

#### 3.2.4 Research Gap

Despite significant progress, critical gaps remain in GaN power IC development:

1. **Limited Integration of Protection Functions:** Most demonstrations focus on individual circuit blocks rather than complete protection systems integrated with power devices.

2. **Insufficient High dV/dt Immunity:** While discrete level shifters show promising results, their integration with GaN power switches under realistic switching conditions requires further investigation.

3. **Lack of AI-Enhanced Design:** Current design methodologies rely primarily on physics-based simulation and manual optimization. The application of machine learning for GaN circuit optimization remains largely unexplored.

4. **Thermal-Electrical Co-Design:** The interaction between thermal gradients and electrical performance in densely integrated GaN ICs requires systematic study.

5. **Standardized Design Kits:** The absence of comprehensive Process Design Kits (PDKs) limits the accessibility of GaN IC design for broader research and industrial adoption.

---

## 4. Objectives and Research Questions

### 4.1 Primary Objective

To develop a comprehensive GaN power integrated circuit platform using DCFL architecture, integrating high-voltage power switches with intelligent protection, sensing, and drive functions, while establishing AI-enhanced design methodologies for optimization.

### 4.2 Specific Research Questions

**RQ1: Circuit Protection Architecture**
How can over-current, over-voltage, and over-temperature (OC/OV/OT) protection circuits be optimally integrated with GaN power HEMTs using DCFL technology to achieve rapid fault detection while minimizing silicon area overhead?

*Hypothesis:* A protection system utilizing SenseFET-based current sensing, stacked high-voltage detection structures, and temperature-compensated reference circuits can achieve sub-microsecond response time with minimal area penalty through optimized circuit topology and layout techniques.

**RQ2: High Noise Immunity Level Shifting**
What circuit architectures can achieve high dV/dt immunity for high-side gate drive in 650V GaN half-bridge configurations while maintaining low propagation delays?

*Hypothesis:* A modified Three-Branch Level Shifter (TBLS) with adaptive common-mode cancellation and integrated filtering can achieve enhanced dV/dt immunity with reduced propagation delay through capacitive isolation and differential common-mode rejection techniques.

**RQ3: Precision Current Sensing**
How can current mirror sensing circuits be optimized to achieve high accuracy across the full load range while compensating for device mismatch and parasitic inductance effects in integrated GaN current sensors?

*