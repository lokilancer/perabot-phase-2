# Component Selection Notes

These are engineering recommendations, not official competition requirements.

| Function | Preferred starting choice | Alternative / note |
|---|---|---|
| Main controller | ESP32-S3 N16R8 development board | Keep removable for service |
| Line sensing | One QTR-8RC array | Add a second only if testing proves necessary |
| Colour sensing | TCS34725 RGB I2C module | Existing TCS3200 can be used after output-voltage and calibration checks |
| Obstacle distance | VL53L0X ToF module | HC-SR04 is an alternative; Echo needs 3.3 V-safe interfacing |
| Drive motors | Two encoder-equipped N20 gear motors | Confirm gearbox RPM and stall current |
| Motor driver | TB6612FNG dual H-bridge | Only if motor current and voltage are within limits |
| Motion sensor | MPU6050 optional | Not a substitute for wheel encoders |
| Power | Battery selected to match motors + regulated logic supply | Confirm chemistry, cell count, discharge rating and charger |
| Future mechanism | Reserved footprint/connector space | Defer third motor and driver until mechanism is known |

## Selection checks

### Motors
Obtain rated voltage, gearbox output RPM, stall current, shaft dimensions, encoder supply/output type and mounting-hole dimensions. Do not select by advertised RPM alone. High RPM can make line following harder to control.

### Colour sensor
TCS34725 is a digital RGB sensor with I2C. It may be easier to integrate on a shared I2C bus than frequency-output TCS3200. Either sensor needs calibration under actual lighting, sensor height and marker material. Do not rely on uncalibrated raw RGB thresholds.

### Obstacle sensor
VL53L0X is a time-of-flight distance sensor. Check field of view, range on expected surfaces, breakout voltage compatibility and mounting angle. A single forward sensor is not full surround-obstacle detection.

### Power
Size battery and regulator using measured motor and electronics current. The logic regulator must remain stable during motor acceleration. Use a fuse and physical main switch. Use a charger designed for the exact battery chemistry and series-cell count.

## Reference documentation
- ESP32-S3: https://docs.espressif.com/projects/esp-idf/en/stable/esp32s3/
- TB6612FNG datasheet: https://toshiba.semicon-storage.com/info/docget.jsp?did=10660&prodName=TB6612FNG
- Pololu QTR documentation: https://www.pololu.com/docs/0J12
- ST VL53L0X: https://www.st.com/en/imaging-and-photonics-solutions/vl53l0x.html
- ams OSRAM TCS3472: https://ams-osram.com/products/sensor-solutions/ambient-light-color-spectral-proximity-sensors/ams-tcs3472-color-sensor
- TDK MPU-6050: https://invensense.tdk.com/products/motion-tracking/6-axis/mpu-6050/

Use the datasheet for the exact purchased module/revision; breakout boards can differ from the bare IC.