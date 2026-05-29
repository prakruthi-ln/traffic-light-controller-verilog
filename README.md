# Traffic-light-controller-verilog

A Traffic Light Controller (TCL) implemented in Verilog HDL using a Finite State Machine (FSM). The controller manages traffic signals for a main road and a side road based on a sensor input and timed state transitions.

Overview

This project implements a traffic light control system with:

Main Road Signal (mr)
Side Road Signal (sr)
Vehicle Sensor Input (sen)

The controller changes traffic lights dynamically using an FSM and timing counters.
The design is simulated and verified using a Verilog testbench.

 Signal Description

| Signal    | Type   | Description          |
| --------- | ------ | -------------------- |
| `clk`     | Input  | System clock signal  |
| `rst`     | Input  | Reset signal         |
| `sen`     | Input  | Vehicle sensor input |
| `mr[1:0]` | Output | Main road signal     |
| `sr[1:0]` | Output | Side road signal     |

 Traffic Light Encoding

| Light  | Binary Value |
| ------ | ------------ |
| Green  | `00`         |
| Yellow | `01`         |
| Red    | `10`         |


FSM States

The controller consists of 4 states:

State S0
Main Road → Green
Side Road → Red
Waits for sensor (sen) input.

State S1
Main Road → Yellow
Side Road → Red
Runs for 5 clock cycles.

State S2
Main Road → Red
Side Road → Green
Runs for 10 clock cycles.

State S3
Main Road → Red
Side Road → Yellow
Runs for 5 clock cycles.

After S3, the FSM returns to S0.

Timing Parameters

parameter ty = 5;
parameter t  = 10;
ty → Yellow signal duration
t → Green signal duration for side road

## Key Takeaways

* Learned that **synchronous FSMs** are best implemented with **separate always blocks** for state transition logic and output logic, making the design cleaner and more synthesis-friendly.

* Understood how **timer-based state transitions** work by using a **counter as a hardware delay mechanism**.

* Improved understanding of **sequential digital design**, including clocks, resets, and state-dependent behavior.

* Gained experience in **simulating and debugging FSM-based systems** using waveform analysis.



## OUPUT WAVEFORM

<img width="1359" height="477" alt="Screenshot 2026-02-28 201042" src="https://github.com/user-attachments/assets/1957649b-f002-4203-8f31-892e4f594161" />

## Simulation Result
The waveform shows the traffic light controller working as expected. At the beginning, the **main road stays green** while the **side road remains red**, allowing normal traffic flow. Once the **sensor is triggered**, the controller changes the lights step by step — first the **main road turns yellow**, then the **side road gets green**, followed by **yellow**, and finally returns to the initial state. The delays between each signal change confirm that the timer logic is working properly, and the FSM transitions are happening in the correct order.




