# Phase 2 Electronics Design

This folder contains the proposed electronics architecture for the PeraBots Phase 2 robot.

## Design approach

- One differential-drive robot with two encoder-equipped DC gear motors.
- ESP32-S3 development board as a removable controller module.
- One dual-channel TB6612FNG motor driver, subject to motor voltage and stall-current verification.
- QTR-8RC reflectance array for line sensing.
- VL53L0X time-of-flight sensor for front obstacle-distance measurement.
- TCS34725 RGB sensor as the preferred digital colour-sensing option; the already-listed TCS3200 may be retained if it is already purchased and tested.
- Optional MPU6050 for motion/turn measurement.
- A separate expansion connector and reserved mounting area for any future mechanism. A third motor and its driver are deliberately deferred.

## Files

- [PCB Design Requirements](PCB_Design_Requirements.md)
- [Component Selection Notes](Component_Selection.md)
- [Wiring and Pin Assignment Template](Wiring_and_Pin_Assignment_Template.csv)
- [System Architecture Diagram](System_Architecture.svg)

## Important design status

These are planning and prototype documents, not a manufacturing-ready PCB. Exact ESP32-S3 board model/pinout, motor specifications, sensor breakout voltage levels, connector footprints, battery current capability and physical dimensions must be confirmed before a PCB layout is frozen or fabricated.

Do not connect 5 V signals directly to ESP32-S3 GPIO. Add level shifting or dividers where required. Check every module's schematic/datasheet rather than assuming all breakout boards are 3.3 V compatible.
