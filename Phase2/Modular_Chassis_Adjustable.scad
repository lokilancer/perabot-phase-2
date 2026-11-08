// PeraBots Phase 2 — rulebook-aligned modular chassis concept
// Units: mm. Concept only. Measure exact parts before fabrication.
// Nominal base 180 x 150 mm; complete robot must fit within 200 x 200 x 200 mm.

$fn = 48;
base_x = 180; base_y = 150; base_t = 3; corner_r = 8;
m3_clearance = 3.4; edge_margin = 8;

// Motor mounting placeholders — replace with exact purchased motor dimensions.
motor_center_y = 0; motor_x_offset = 48;
motor_slot_len = 22; motor_slot_w = 3.6;
motor_bracket_w = 28; motor_bracket_l = 48; motor_bracket_t = 3;

// Front sensor carrier: one QTR array is the starting configuration.
// Leave adjustable room for optional second array only if tests require it.
sensor_bar_x = 150; sensor_bar_y = 22; sensor_bar_t = 3;
sensor_front_y = 62;

// Approximate component placeholders only; not real product dimensions.
controller_x = 55; controller_y = 30; controller_pos = [0, 20];
battery_x = 95; battery_y = 45; battery_pos = [0, -32];

// Front-facing distance sensor and downward-facing colour sensor placeholders.
distance_pos = [0, 57]; distance_x = 22; distance_y = 18;
colour_pos = [0, 43]; colour_x = 18; colour_y = 18;

// Reserve space for unknown future mechanism; no third motor model included.
future_zone_x = 52; future_zone_y = 42; future_zone_pos = [55, 28];

module rounded_plate(x,y,t,r) {
    linear_extrude(height=t) offset(r=r) square([x-2*r,y-2*r],center=true);
}
module slot_hole(len,w,t) {
    hull() {
        translate([-len/2,0,-0.1]) cylinder(h=t+0.2,d=w);
        translate([len/2,0,-0.1]) cylinder(h=t+0.2,d=w);
    }
}
module base_plate() {
    difference() {
        rounded_plate(base_x,base_y,base_t,corner_r);
        for (x=[-base_x/2+edge_margin,base_x/2-edge_margin])
            for (y=[-base_y/2+edge_margin,base_y/2-edge_margin])
                translate([x,y,-0.1]) cylinder(h=base_t+0.2,d=m3_clearance);
        for (s=[-1,1]) {
            translate([s*motor_x_offset,motor_center_y-12,-0.1]) slot_hole(motor_slot_len,motor_slot_w,base_t);
            translate([s*motor_x_offset,motor_center_y+12,-0.1]) slot_hole(motor_slot_len,motor_slot_w,base_t);
        }
        translate([-74,0,-0.1]) slot_hole(12,m3_clearance,base_t);
        translate([-60,0,-0.1]) slot_hole(12,m3_clearance,base_t);
        for (x=[-55,55])
            translate([x,sensor_front_y-10,-0.1]) slot_hole(18,m3_clearance,base_t);
    }
}
module motor_bracket(xpos) {
    difference() {
        translate([xpos,motor_center_y,base_t]) cube([motor_bracket_w,motor_bracket_l,motor_bracket_t],center=true);
        for (y=[-12,12])
            translate([xpos,motor_center_y+y,base_t-motor_bracket_t/2-0.1])
                slot_hole(motor_slot_len,motor_slot_w,motor_bracket_t+0.2);
    }
}
module sensor_bar() {
    translate([0,sensor_front_y,base_t])
        difference() {
            cube([sensor_bar_x,sensor_bar_y,sensor_bar_t],center=true);
            for (x=[-55,55])
                translate([x,0,-0.1]) cylinder(h=sensor_bar_t+0.2,d=m3_clearance);
        }
}
module footprint(pos,sx,sy,h=2) {
    translate([pos[0],pos[1],base_t+1])
        cube([sx,sy,h],center=true);
}
module future_zone() {
    color([0.95,0.65,0.1,0.25])
        translate([future_zone_pos[0],future_zone_pos[1],base_t+2])
            cube([future_zone_x,future_zone_y,2],center=true);
}

color("silver") base_plate();
color("dimgray") motor_bracket(-motor_x_offset);
color("dimgray") motor_bracket(motor_x_offset);
color("orange") sensor_bar(); // one QTR array carrier; second is optional
color([0.2,0.55,0.85,0.35]) footprint(controller_pos,controller_x,controller_y);
color([0.2,0.75,0.35,0.35]) footprint(battery_pos,battery_x,battery_y);
color([0.2,0.75,0.85,0.55]) footprint(distance_pos,distance_x,distance_y);
color([0.8,0.25,0.65,0.55]) footprint(colour_pos,colour_x,colour_y);
future_zone();
