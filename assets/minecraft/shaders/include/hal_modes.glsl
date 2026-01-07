#version 330

// LIGHT_MODES - do not change
#define     LIGHT_MODE_NONE 0
#define LIGHT_MODE_OVERRIDE 1
#define   LIGHT_MODE_DIVIDE 2
#define LIGHT_MODE_MULTIPLY 3
#define LIGHT_MODE_SUBTRACT 4
#define      LIGHT_MODE_ADD 5

// applying
vec4 apply_color( vec4 color, vec4 light_color, int mode ) {
    vec4 result_color = color;
    if ( mode == LIGHT_MODE_OVERRIDE ) { result_color = light_color; }
    if ( mode ==   LIGHT_MODE_DIVIDE ) { result_color = result_color / light_color; }
    if ( mode == LIGHT_MODE_MULTIPLY ) { result_color = result_color * light_color; }
    if ( mode == LIGHT_MODE_SUBTRACT ) { result_color = result_color - light_color; }
    if ( mode ==      LIGHT_MODE_ADD ) { result_color = result_color + light_color; }
    return result_color;
}