#version 330

// custom light structure
struct arealight {
    vec4 start_color;  vec4 end_color;       // color characteristic
    vec3 mix_strength; int  mode;            // blending characteristic
    vec3 pos;          vec3 offset;          // position characteristic
    int  shape;        vec3 shape_parameter; // shape characteristic
};

// About mix_strength
// determines how in each axis color blends from start_color to end_color
// Useful when you need to make gradient only in one axis and don't want it to change through other axes
// (Why plural for axis is the axes)

// About mode:
// All modes can be seen in the hal_modes.glsl

// About offset:
// offset changes where the light starting point is
// It does not change position of the area filled with light
// So you can move starting point to the corner of the area

// About shape_parameter:
// this parameter determines how light "spreads" in each axis (both positive and negative direction)
// Ex: arealight(..., LIGHT_SHAPE_CUBOID, vec3(1.0, 3.0, 1.0) )
// It describes Cuboid with sizes 2.0, 6.0, 2.0

// lights are defined here. You can change AREA_LIGHTS_COUNT in the hal_config.glsl
arealight area_light[AREA_LIGHTS_COUNT];

void init_lights() {
    
}