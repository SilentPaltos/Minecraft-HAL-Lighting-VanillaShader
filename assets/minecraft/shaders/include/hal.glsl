#version 330

#define LIGHTS_COLORS_COUNT 50
#define LIGHT_AREAS_COUNT 1

#moj_import <minecraft:hal_structs.glsl>
#moj_import <minecraft:hal_list.glsl>

// area test
bool is_in_area (vec3 Position, vec3_range areas[LIGHT_AREAS_COUNT]) {
    vec3 pos = Position;
    for ( int i = 0; i < LIGHT_AREAS_COUNT; i++ ) {
        if ( 
            ( pos.x >= areas[i].start.x ) && ( pos.x <= areas[i].end.x ) &&
            ( pos.y >= areas[i].start.y ) && ( pos.y <= areas[i].end.y ) &&
            ( pos.z >= areas[i].start.z ) && ( pos.z <= areas[i].end.z )
        ) return true;
    }
    return false;
}

// processing light
vec4 apply_hal( vec4 color, vec3 Position, light list[LIGHTS_COLORS_COUNT] ) {
    vec3 pos = Position;
    int i = 0;
    vec4 result_color = color;
    for ( int i = 0; i < LIGHTS_COLORS_COUNT; i++ ) {
        if ( is_in_area(pos, lights[i].areas) ) {
            int mode = lights[i].mode;
            vec4 light_color = lights[i].color;
            if ( mode == LIGHT_MODE_OVERRIDE ) { result_color = light_color; }
            if ( mode ==   LIGHT_MODE_DIVIDE ) { result_color = result_color / light_color; }
            if ( mode == LIGHT_MODE_MULTIPLY ) { result_color = result_color * light_color; }
            if ( mode == LIGHT_MODE_SUBTRACT ) { result_color = result_color - light_color; }
            if ( mode ==      LIGHT_MODE_ADD ) { result_color = result_color + light_color; }
        }
    }
    return result_color;
}