# ESP32-S3 Robot Controller PCB — Design Requirements

## Purpose
A modular carrier/controller PCB for a two-wheel autonomous robot that follows a line, identifies coloured markers and detects obstacles. Sensors and motors should be replaceable through labelled connectors.

## Proposed board structure

### Controller
- Socket/header footprint for the exact ESP32-S3 development board selected.
- Keep USB, reset and boot controls accessible.
- Use a removable development board initially. Do not design around the bare ESP32-S3 chip until antenna, flash/PSRAM, USB and power requirements are engineered.

### Motor stage
- One TB6612FNG dual H-bridge for left and right drive motors.
- Separate motor supply (VM) and logic supply (VCC), following the driver datasheet.
- Label left/right motor outputs and direction/PWM signals.
- Place local decoupling close to the driver and bulk capacitance near motor supply.
- Verify motor stall current, supply voltage and thermal limits before selecting this driver.
- A third motor is not included. Add a second driver only after selecting the future mechanism.

### Sensor connectors
- LINE: one QTR-8RC array; eight signal pins plus power/ground as required by the exact sensor version.
- DIST_I2C: VL53L0X breakout connector with SDA, SCL, power and ground.
- COLOR_I2C: TCS34725 connector. If retaining TCS3200, use a separate documented pinout.
- ENC_L and ENC_R: encoder power, ground and channel A/B signals.
- IMU_I2C: optional MPU6050 connector on shared I2C bus.
- Test points for 3V3, sensor supply, battery voltage, ground, SDA and SCL.

### Power
- Battery input with polarity protection and appropriately rated fuse.
- Main power switch.
- Regulated rails only as required by selected modules.
- Do not route motor current through thin logic traces or controller headers.
- Check buck-converter range, current rating, heat and noise.
- Charger must match exact battery chemistry and cell count. Do not charge through this PCB unless a proper charging/protection circuit is designed.

### User interface
- Start/pause button, status LED, fault LED, buzzer connector/footprint and labelled expansion GPIO header.

## Electrical rules
- ESP32-S3 GPIO is 3.3 V logic. Never connect a 5 V signal directly.
- Check the actual output voltage of every sensor breakout and encoder.
- HC-SR04 Echo is commonly 5 V; if used, add a suitable divider or level shifter.
- Check QTR-8RC output compatibility with GPIO voltage and timing method.
- Check TCS3200 output levels and TCS34725 breakout pull-ups/regulator.
- Check I2C pull-up voltage; SDA/SCL must not be pulled above 3.3 V.
- Add reverse-polarity protection, fuse, decoupling and labelled test points.
- Separate motor-current paths from sensitive sensor/I2C routing where practical.

## PCB layout guidance
- Place motor driver near motor connectors.
- Keep high-current motor loops short and wide, sized for measured current and copper thickness.
- Place driver decoupling capacitors close to supply pins.
- Keep ESP32 antenna area clear; follow exact board/module guidance.
- Keep I2C traces short and away from motor switching paths.
- Use keyed or clearly labelled connectors.
- Add mounting holes only after measuring chassis and standoff positions.
- Label every connector and power polarity on silkscreen.

## Required checks before fabrication
- [ ] Exact ESP32-S3 board model and pinout confirmed.
- [ ] Motor rated voltage, no-load RPM, stall current and encoder output confirmed.
- [ ] TB6612FNG suitability checked against motor data.
- [ ] QTR-8RC version and supply/output requirements confirmed.
- [ ] VL53L0X and colour breakout logic levels confirmed.
- [ ] GPIO allocation checked for conflicts and reserved pins.
- [ ] Battery, fuse and regulator ratings calculated.
- [ ] Connector pitch and pin order checked against actual cables.
- [ ] PCB dimensions and mounting holes measured against chassis.
- [ ] KiCad ERC and PCB DRC completed.
- [ ] Prototype tested with current-limited supply before battery operation.

**Status:** requirements draft only. No PCB has been electrically validated or manufactured.