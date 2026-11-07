# PeraBots Phase 2 Robot — Design Files

This repository contains a preliminary shopping checklist and an adjustable conceptual chassis layout for the Phase 2 robot.

## Current design decisions

- Controller: ESP32-S3 N16R8.
- Drive: two GA12-N20 encoder motors in a differential-drive arrangement.
- Drive motor driver: one TB6612FNG dual driver, subject to verification of motor voltage and stall current.
- Third motor: intentionally deferred. Keep a modular mounting area and wiring provision until the physical challenge is announced.
- Sensors: two QTR-8RC arrays, MPU6050, VL53L0X, HC-SR04 and TCS3200.
- Battery concept: 2S 7.4V LiPo with separately regulated logic supply.
- Chassis concept envelope: 180 × 150 mm base plate. The complete robot must remain within the event's 200 × 200 × 200 mm overall limit.

## Files

- `Phase2/Purchase_Checklist.csv` — editable shopping checklist with quantities and compatibility notes.
- `Phase2/Modular_Chassis_Adjustable.scad` — editable OpenSCAD conceptual model.
- `Phase2/Chassis_Top_View.svg` — schematic top-view layout.
- `Phase2/README.md` — this design note.

## Critical verification before purchasing/fabrication

1. Obtain the exact GA12-N20 motor rated voltage, no-load RPM, stall current, encoder supply voltage and output type.
2. Check motor stall current against the TB6612FNG rating. Do not assume the driver is suitable from the motor name or no-load RPM.
3. Confirm the exact ESP32-S3 N16R8 board pinout. Two QTR-8RC arrays provide 16 outputs, so GPIO allocation must be planned.
4. Never connect a 5V sensor output directly to ESP32-S3 GPIO. The HC-SR04 Echo pin needs a suitable 3.3V-safe interface.
5. Verify the 2S battery discharge rating, charger compatibility, regulator output and power distribution for the complete load.
6. Measure actual modules, motor mounting holes, motor shaft, wheel hub, battery and sensor dimensions before cutting or drilling.

## Chassis model limitations

The OpenSCAD file is an adjustable concept, not a manufacturing-ready drawing. Motor bracket positions and component footprints are placeholders. It does not model the actual motor bodies, wheels, battery, wiring or future mechanism. Replace placeholder dimensions with measurements from the exact purchased parts. Check the full assembled robot, including wheels and sensor mounts, against the 200 × 200 × 200 mm event limit.

## Budget note

The previously discussed Rs. 24,757 figure was only a provisional baseline derived from the user's original list by removing the Nano and deferring one motor at an assumed equal unit price. It excludes the ESP32-S3 replacement price, additional chassis/wiring/protection items and any supplier price changes. Obtain current quotations before treating it as a final budget.
