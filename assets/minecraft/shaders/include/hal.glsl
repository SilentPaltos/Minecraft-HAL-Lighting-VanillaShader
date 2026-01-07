#version 330

#moj_import <minecraft:hal_config.glsl>
#moj_import <minecraft:hal_modes.glsl>
#moj_import <minecraft:hal_shapes.glsl>
#moj_import <minecraft:hal_list.glsl>

// processing light
vec4 apply_hal( vec4 color, vec3 vertex, float dist ) {

    // render distance check
    if ( (LIGHT_RENDER_DISTANCE >= 0) && (dist > LIGHT_RENDER_DISTANCE) ) {
        return color;
    }
    
    init_lights();

    // applying
    vec4 result_color = color;
    for ( int i = 0; i < AREA_LIGHTS_COUNT; i++ ) {
        if ( is_in_area( 
            vertex, area_light[i].pos, 
            area_light[i].shape, area_light[i].shape_parameter )
            ) {
                vec3 mix_strength = area_light[i].mix_strength;
                vec3 p_light = area_light[i].pos;
                vec3 offset = area_light[i].offset;
                vec3 shape_p = area_light[i].shape_parameter;
                float mix_value = length( vec3(
                    ((vertex.x - offset.x) - p_light.x) / shape_p.x * mix_strength.x,
                    ((vertex.y - offset.y) - p_light.y) / shape_p.y * mix_strength.y,
                    ((vertex.z - offset.z) - p_light.z) / shape_p.z * mix_strength.z
                    )
                );
                if ( FIX_OUT_OF_BOUNDS_MIX ) {
                    if ( mix_value >= 1 ) { mix_value = 1; }
                    if ( mix_value <= 0 ) { mix_value = 0; }
                }
                result_color = apply_color(
                    result_color, 
                    mix( area_light[i].start_color, area_light[i].end_color, mix_value ), 
                    area_light[i].mode
                );
            }
    }

    return result_color;
}