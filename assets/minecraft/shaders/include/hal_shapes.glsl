#version 330

// LIGHT_SHAPES - do not change
#define   LIGHT_SHAPE_CUBOID 0
#define LIGHT_SHAPE_ELLIPSOID 1

// area test
bool is_in_area ( vec3 vertex, vec3 light_source, int shape, vec3 shape_parameter ) {

    if (
        (shape == LIGHT_SHAPE_CUBOID)
        && ( abs(vertex.x - light_source.x) <= shape_parameter.x )
        && ( abs(vertex.y - light_source.y) <= shape_parameter.y )
        && ( abs(vertex.z - light_source.z) <= shape_parameter.z )
        ) { 
            return true;
    }
    if (
        (shape == LIGHT_SHAPE_ELLIPSOID)
        && (  pow((vertex.x - light_source.x ) / shape_parameter.x, 2)
            + pow((vertex.y - light_source.y ) / shape_parameter.y, 2)
            + pow((vertex.z - light_source.z ) / shape_parameter.z, 2)
            <= 1
            )
        ) { 
            return true;
    }

    return false;
}
