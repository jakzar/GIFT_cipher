# Verilog Implementation of the GIFT Block Cipher

This repository contains a Verilog HDL implementation of the **GIFT-128** lightweight block cipher in three architectural variants, each optimized for different design trade-offs in terms of performance, area, and throughput. The project was developed as part of the "Cryptographic Digital Circuit Design 2" course at the Military University of Technology.

## Overview

GIFT is a lightweight block cipher introduced by Banik et al. in 2017 as an evolution of the PRESENT cipher. It is designed for efficient hardware implementation in constrained environments such as IoT devices and embedded systems. The version implemented here is **GIFT-128**, which operates on 128-bit data blocks using a 128-bit key and performs **40 rounds** of encryption.

## Implementations

Three architectures of the cipher were implemented:

### 1. Iterative (Basic) Architecture

* **Description**: Performs one encryption/decryption round per clock cycle using control logic and round-key generation units.
* **Pros**: Lowest resource usage.
* **Cons**: Lowest throughput.
* **Throughput**:

  * Encryption: \~0.81 Gb/s
  * Decryption: \~0.31 Gb/s
* **FPGA Resource Usage**: \~2–3% ALMs on Cyclone V.

### 2. Combinational (Single-Cycle) Architecture

* **Description**: All 40 encryption/decryption rounds are hardwired and executed in a single clock cycle.
* **Pros**: High-speed processing.
* **Cons**: Significant increase in area.
* **Throughput**:

  * Encryption: \~1.01 Gb/s
  * Decryption: \~0.83 Gb/s
* **FPGA Resource Usage**: \~17–25% ALMs.

### 3. Pipelined Architecture

* **Description**: Fully pipelined design with 40 pipeline stages for continuous data processing.
* **Pros**: Maximum throughput.
* **Cons**: Highest area cost.
* **Throughput**:

  * Encryption: \~32.18 Gb/s
  * Decryption: \~33.61 Gb/s
* **FPGA Resource Usage**: \~19–30% ALMs and \~11k+ registers.

## Test Vectors

All implementations were verified against official GIFT-128 test vectors:

* Source: [GIFT GitHub repository – Test Vectors](https://github.com/giftcipher/gift/blob/master/implementations/test%20vectors/GIFT128_test_vector_2.txt)

Correct encryption and decryption results were confirmed for:

* Zero plaintext/key
* Sample values (e.g., `0xfedcba9876543210fedcba9876543210`)

## Compilation Results

Each variant was synthesized using **Intel Quartus** for **Cyclone V 5CEBA4F23C7 FPGA**. Resource utilization and maximum frequencies were analyzed to calculate throughput.

| Architecture         | Resource Usage          | Clock Cycles   | Throughput   |
| -------------------- | ----------------------- | ------------------ | ------------ |
| Basic Encrypt        | \~400 ALMs              | 40 CCs + 1 CC init | \~0.81 Gb/s  |
| Basic Decrypt        | \~500 ALMs + RAM        | 80 CCs + 1 CC init | \~0.31 Gb/s  |
| Single-Cycle Encrypt | \~3,000 ALMs            | 1 CCs + 1 CC init  | \~1.01 Gb/s  |
| Single-Cycle Decrypt | \~4,500 ALMs            | 1 CCs + 1 CC init  | \~0.83 Gb/s  |
| Pipeline Encrypt     | \~3,500 ALMs + 11k regs | 40-stage pipe      | \~32.18 Gb/s |
| Pipeline Decrypt     | \~5,300 ALMs + 11k regs | 40-stage pipe      | \~33.61 Gb/s |

## File Structure

The source code is organized into the following folders:

* `basic_implementation/`: Iterative architecture
* `one_round_implementation/`: Full unrolled architecture
* `pipelined_implementation/`: Fully pipelined architecture

```text
basic_implementation/HDL/
├── GiftEnc.v
│   ├── GiftControl.v
│   ├── GiftKeyschFun.v
│   ├── GiftConstFun.v
│   ├── GiftKeyschReg.v
│   ├── GiftRoundFun.v
│   │   ├── GiftSubBytesFun.v
│   │   │   ├── GiftSboxFun.v
│   │   ├── GiftPermutationFun.v
│   │   ├── GiftAddRounkKeyFun.v
│   ├── GiftRoundReg.v
│   ├── GiftDataOutReg.v
│
├── GiftDec.v
│   ├── GiftDecControl.v
│   ├── GiftSinglePortMem.v
│   ├── GiftKeyschFun.v
│   ├── GiftConstFun.v
│   ├── GiftDecKeyschReg.v
│   ├── GiftInvRoundFun.v
│   │   ├── GiftAddRounkKeyFun.v
│   │   ├── GiftInvPermutationFun.v
│   │   ├── GiftInvSubBytesFun.v
│   │       ├── GiftInvSboxFun.v
│   ├── GiftRoundReg.v
│   ├── GiftDataOutReg.v
│

basic_implementation/SIM/
├── TbGiftEnc.v
├── TbGiftEncDec.v


one_round_implementation/HDL/
├── GiftFullEnc.v
│   ├── GiftFullControl.v
│   ├── GiftFullKeyschReg.v
│   ├── GiftFullRoundFun.v
│   │   ├── GiftKeyschFun.v
│   │   ├── GiftConstFun.v
│   │   ├── GiftRoundFun.v
│   │       ├── GiftSubBytesFun.v
│   │       │   ├── GiftSboxFun.v
│   │       ├── GiftPermutationFun.v
│   │       ├── GiftAddRounkKeyFun.v
│   ├── GiftFullRoundReg.v
│   ├── GiftDataOutReg.v
│
├── GiftFullDec.v
│   ├── GiftFullDecControl.v
│   ├── GiftFullDecKeyschReg.v
│   ├── GiftFullDecRoundFun.v
│   │   ├── GiftKeyschFun.v
│   │   ├── GiftConstFun.v
│   │   ├── GiftFullInvRoundFun.v
│   │       ├── GiftAddRounkKeyFun.v
│   │       ├── GiftInvPermutationFun.v
│   │       ├── GiftInvSubBytesFun.v
│   │           ├── GiftInvSboxFun.v
│   ├── GiftFullRoundReg.v
│   ├── GiftDataOutReg.v

one_round_implementation/SIM/
├── TbFullEnc.v
├── TbFullEncDec.v


pipeline_implementation/HDL/
├── GiftPipeEnc.v
│   ├── GiftPipeControl.v
│   ├── GiftFullKeyschReg.v
│   ├── GiftPipeRoundFun.v
│   │   ├── GiftKeyschFun.v
│   │   ├── GiftRoundFun.v
│   │       ├── GiftSubBytesFun.v
│   │       │   ├── GiftSboxFun.v
│   │       ├── GiftPermutationFun.v
│   │       ├── GiftAddRounkKeyFun.v
│   ├── GiftFullRoundReg.v
│   ├── GiftPipeDataOutReg.v
│
├── GiftPipeEnc.v
│   ├── GiftPipeControl.v
│   ├── GiftFullKeyschReg.v
│   ├── GiftPipeDecRoundFun.v
│   │   ├── GiftPipeInvKeyschFun.v
│   │   ├── GiftFullInvRoundFun.v
│   │       ├── GiftAddRounkKeyFun.v
│   │       ├── GiftInvPermutationFun.v
│   │       ├── GiftInvSubBytesFun.v
│   │       │   ├── GiftInvSboxFun.v
│   ├── GiftFullRoundReg.v
│   ├── GiftPipeDataOutReg.v

pipeline_implementation/SIM/
├── TbPipeEnc.v
├── TbPipeDec.v
```

## Tools Used

* **Language**: Verilog HDL
* **Simulator**: Questa
* **Synthesis**: Intel Quartus Prime 23.1
* **Target Platform**: Cyclone V 5CEBA4F23C7

## Author

Jakub Zaroda
Contact: \[[jakub.zaroda@outlook.com](mailto:jakub.zaroda@outlook.com)]

## References

1. Banik et al., *GIFT: A Small Present – Towards Reaching the Limit of Lightweight Encryption*, ePrint 2017/622
   [https://eprint.iacr.org/2017/622](https://eprint.iacr.org/2017/622)
2. GIFT Test Vectors
   [https://github.com/giftcipher/gift/blob/master/implementations/test%20vectors/GIFT128\_test\_vector\_2.txt](https://github.com/giftcipher/gift/blob/master/implementations/test%20vectors/GIFT128_test_vector_2.txt)
