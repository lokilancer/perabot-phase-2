# PeraBots Phase 2 Robot — Rulebook-Aligned Design

**Status:** revised against the PeraBots 2026 School Category Rulebook (Sections 4.2–4.6 and 5.2–5.5). This is a flexible engineering concept, not a guarantee of success in the undisclosed Phase 2 final challenge.

## What the rulebook actually requires

### Phase 1 skills to carry into the physical robot

| Task | Rulebook challenge | Hardware capability needed |
|---|---|---|
| Task 1 — Line following | Continuous/dashed line, sharp turns, T-junctions, dead ends, checkpoints | Reflectance array across the front; differential drive; reliable junction and line-loss logic |
| Task 2 — Obstacle route selection | Five junction decisions; detect blocked route before contact; stop with clearance; return to latest junction; take alternative route | Forward distance sensor; controlled reverse/turn; wheel encoders strongly recommended |
| Task 3 — Colour direction | Five decision junctions; red patch = left; blue patch = right; may approach patch then reverse | Downward-facing colour sensor; reflectance array; controlled reverse/turn |

### Phase 2 is not fully specified in this rulebook

The rulebook says the physical final may combine line following, complex navigation, obstacle avoidance, junctions, colour recognition, autonomous route selection and using information collected earlier. The detailed arena, task sequence, final action and scoring are reserved for a separate Final Round Challenge Guide. Therefore, this design deliberately keeps mounting and wiring modular.

## Revised hardware decisions

- **Controller — ESP32-S3 N16R8:** selected by the team; suitable as a programmable controller concept. Confirm the exact board pinout and 3.3V logic.
- **Drive — two encoder gear motors:** required design choice for differential drive. Encoders help measure distance and repeat reverse/turn movements. Buy only after confirming rated voltage, RPM, stall current and encoder electrical specifications.
- **Motor driver — one TB6612FNG:** intended for the two drive motors only. Verify its current capability against the motors' stall current and the motor supply voltage before purchase.
- **Line sensing — one QTR-8RC array as the starting configuration:** eight channels should be tested across the actual line width and junction geometry. A second array is **optional**, not a rulebook requirement; add it only if testing proves a need and GPIO capacity allows it.
- **Obstacle sensing — one forward-facing VL53L0X as the preferred initial option:** test range and reliability against the actual competition cubes and lighting. HC-SR04 is an optional alternative/backup, not automatically required. Its Echo output must be made 3.3V-safe before connecting to ESP32-S3.
- **Colour sensing — one downward-facing TCS3200 module:** mount near the front so the robot can read a patch before the junction. Calibrate red/blue readings under expected lighting. Verify module output voltage and pin requirements.
- **MPU6050:** optional. The rulebook does not require an IMU; add it only if testing shows it helps orientation or motion estimation.
- **Third motor/mechanism:** deferred. No third motor or driver is specified in the rulebook. Keep a clear mounting reserve; do not buy or drill final mounting holes yet.
- **Power:** 2S battery concept remains provisional. Confirm motor voltage/current, battery discharge rating, regulator output, fuse, connectors and charger compatibility before connecting.

## Chassis concept

- Nominal base plate: **180 × 150 mm** (concept dimensions only).
- Competition maximum overall dimensions: **200 × 200 × 200 mm**, including wheels, sensor brackets and every protruding part.
- Keep line array and colour sensor near the front; place distance sensor facing forward; keep battery low and secured; protect wiring; leave a reserved modular zone.
- The SCAD and SVG are layout aids only. They are not manufacturing drawings. Replace placeholders with measurements from the exact purchased modules, motors, hubs, battery and brackets before fabrication.

## Important electrical/mechanical checks

1. Confirm GA12-N20 rated voltage, no-load RPM, stall current, encoder voltage/output type and shaft dimensions.
2. Check motor stall current against the TB6612FNG rating; do not choose a driver from motor name or no-load RPM alone.
3. Plan ESP32-S3 GPIO for eight QTR channels, two motor drivers' control inputs, encoder signals, I2C distance sensor, colour sensor and any optional modules. Check the exact development-board pinout first.
4. ESP32-S3 GPIO is 3.3V logic. Do not connect a 5V output directly. In particular, make HC-SR04 Echo 3.3V-safe.
5. Test the colour sensor's red/blue classification and the distance sensor's stop clearance using representative patches and obstacles.
6. Verify battery discharge rating, charger support for 2S LiPo, regulator current/voltage, fuse and power distribution.
7. Check wheel hubs against the actual motor shaft and verify the complete assembled robot dimensions.
8. Test controlled reverse and return-to-junction behaviour on a measured track; avoid relying only on timed motor commands.

## Files

- `Phase2/Purchase_Checklist.csv` — revised priority-based purchase checklist.
- `Phase2/Task_Requirements_Matrix.md` — rulebook-to-hardware traceability.
- `Phase2/Modular_Chassis_Adjustable.scad` — editable conceptual OpenSCAD layout.
- `Phase2/Chassis_Top_View.svg` — viewable schematic top view.
- `Phase2/README.md` — this design note.

## Budget note

Do not treat earlier totals as a final budget. The ESP32-S3 replacement price, optional sensors, protection/wiring parts and supplier prices need current quotations. The second QTR array, HC-SR04 and MPU6050 are now optional pending tests; the third motor and its driver remain deferred.
