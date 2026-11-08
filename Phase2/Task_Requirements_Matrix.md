# PeraBots 2026 — Rulebook-to-Hardware Matrix

**Source:** PeraBots 2026 School Category Rulebook, Sections 4.2–4.6 and 5.2–5.5. This matrix distinguishes explicit task requirements from engineering recommendations.

| Rulebook task/skill | Explicit challenge | Proposed hardware | Priority | Notes |
|---|---|---|---|---|
| Phase 1 Task 1 | Continuous/dashed line, sharp turns, T-junctions, dead ends, checkpoints | One QTR-8RC array + two drive motors | Essential capability | Test array width and sensor height on the actual track |
| Phase 1 Task 2 | Detect blocked route before contact; stop with clearance; reverse to last junction; choose alternative | Forward VL53L0X + encoder drive | Essential capability | Encoders are an engineering recommendation for repeatable distance, not named as a rulebook requirement |
| Phase 1 Task 3 | Read red/blue patch; red-left, blue-right; approach/reverse is permitted | TCS3200 + line array + encoder drive | Essential capability | Calibrate under lighting; place sensor where it can see the patch before turning |
| Phase 2 possible combined skills | Line following, complex navigation, obstacle avoidance, junctions, colour detection, route selection | Modular line, distance and colour sensor mounts | Prepare for these skills | Exact final challenge is not disclosed |
| Phase 2 possible memory/decision | Use information collected earlier for a later action | ESP32-S3 program state/storage | Prepare for this skill | Keep software architecture able to store route/colour observations |
| Size and autonomy | Maximum 20 × 20 × 20 cm; autonomous operation | Compact chassis, secured battery, onboard controller | Rulebook requirement | Measure complete robot, including wheels and protruding sensors |
| Safety | No unreasonable safety risk or arena damage | Protected wiring, secured battery, fuse, smooth mounts | Rulebook requirement | Inspect before powered testing |

## Sensor and part priority

- **Start with one line array**, not two. The second QTR-8RC is optional until track testing proves it is needed.
- **Use one distance sensor initially.** VL53L0X is the preferred concept; HC-SR04 is an alternative/backup, not an automatic additional requirement.
- **Use one colour sensor** for the red/blue decision task. Calibrate it with representative patches and expected lighting.
- **Keep MPU6050 optional.** No IMU is explicitly required by the task descriptions.
- **Keep the third motor and its driver deferred.** The rulebook does not specify a third motor or a manipulator.
- **Encoders are strongly recommended** for repeatable reverse distance and returning to a junction, but the rulebook does not explicitly mandate encoder motors.

## Unknowns that must remain open

The Final Round Challenge Guide will specify the actual arena, task sequence, final action and detailed scoring. Until then, do not design around a guessed mechanism or buy optional hardware solely on speculation.
