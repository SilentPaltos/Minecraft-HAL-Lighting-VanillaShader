#version 330

// LIGHT_MODES - do not change
#define     LIGHT_MODE_NONE 0
#define LIGHT_MODE_OVERRIDE 1
#define      LIGHT_MODE_ADD 2
#define LIGHT_MODE_SUBTRACT 3
#define LIGHT_MODE_MULTIPLY 4
#define   LIGHT_MODE_DIVIDE 5

// areas for lights to process
struct vec3_range {
    vec3 start;
    vec3 end;
};

// custom light structure
struct light {
    int mode;
    vec4 color;
    vec3_range areas[LIGHT_AREAS_COUNT];
};

light lights[LIGHTS_COLORS_COUNT];