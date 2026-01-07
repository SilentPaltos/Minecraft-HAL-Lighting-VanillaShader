#version 330

// custom light structure
struct arealight {
    vec4 start_color;  vec4 end_color;       // color characteristic
    vec3 mix_strength; int  mode;            // blending characteristic
    vec3 pos;          vec3 offset;          // position characteristic
    int  shape;        vec3 shape_parameter; // shape characteristic
};

// About mix_strength
// determines how in each axis start_color blends to end_color
// Useful when you need to make gradient only in one axis and don't want it to change through other axes
// (Why plural for axis is the axes)

// About mode:
// All modes can be seen in the hal_modes.glsl

// About offset:
// Offset change where the light starting point is
// It does not change position of the area filled with light
// So you can move starting point to the corner of the area

// About shape_parameter:
// this parameter determines how light "spreads" in each axis (both positive and negative direction)
// Ex: arealight(..., LIGHT_SHAPE_CUBOID, vec3(1.0, 3.0, 1.0) )
// It describes Cuboid with sizes 2.0, 6.0, 2.0

arealight area_light[AREA_LIGHTS_COUNT];

// you can create lightareas as variables and then asign array values using these variables
arealight CHECKPOINT_DEFAULT = arealight(
    vec4( 0.4, 0.6, 1.0, 0.0 ) * 1.1, vec4( 0.0, 0.0, 0.0, 0.0 ), 
    vec3( 1.0, 0.25, 1.0 ), LIGHT_MODE_ADD,
    vec3( 0, 0, 0 ),    vec3( 0.0, 1.5, 0.0 ),
    LIGHT_SHAPE_CUBOID, vec3( 1.5, 1.5, 1.5 )
);
arealight WELL_DEFAULT = arealight(
    vec4( 2.0, 2.0, 2.0, 2.0 ), vec4( 0.0, 0.0, 0.0, 0.0 ), 
    vec3( 0.3, 0.5, 0.0 ), LIGHT_MODE_SUBTRACT,
    vec3( 0, 0, 0 ),    vec3( 0.0, -3.5, 0.0 ),
    LIGHT_SHAPE_CUBOID, vec3( 1.5, 3.5, 1.5 )
);
arealight LAVA_BLOCK_DEFAULT = arealight(
    vec4( 1.0, 0.7, 0.0, 1.0 ) * 1, vec4( 0.0, 0.0, 0.0, 0.0 ), 
    vec3( 0.0, 0.0, 0.0 ), LIGHT_MODE_ADD,
    vec3( 0, 0, 0 ), vec3( 0.0, 0.0, 0.0 ),
    LIGHT_SHAPE_CUBOID,        vec3( 1.5, 1.5, 1.5 )
);

void init_lights() {

    // end of the map

        // light blending cube
        area_light[0] = arealight(
            vec4( 1.0, 0.0, 0.0, 0.0 ), vec4( 0.0, 0.0, 0.0, 0.0 ), 
            vec3( 0.5, 0.0, 0.0 ), LIGHT_MODE_ADD,
            vec3( -247, -44, 14 ), vec3( 5.0, 0.0, 0.0 ),
            LIGHT_SHAPE_CUBOID,    vec3( 5.5, 5.5, 5.5 )
        );
        area_light[1] = arealight(
            vec4( 0.0, 1.0, 0.0, 0.0 ), vec4( 0.0, 0.0, 0.0, 0.0 ), 
            vec3( 0.0, 0.5, 0.0 ), LIGHT_MODE_ADD,
            vec3( -247, -44, 14 ), vec3( 0.0, 5.0, 0.0 ),
            LIGHT_SHAPE_CUBOID,    vec3( 5.5, 5.5, 5.5 )
        );
        area_light[2] = arealight(
            vec4( 0.0, 0.0, 1.0, 0.0 ), vec4( 0.0, 0.0, 0.0, 0.0 ), 
            vec3( 0.0, 0.0, 0.5 ), LIGHT_MODE_ADD,
            vec3( -247, -44, 14 ), vec3( 0.0, 0.0, 5.0 ),
            LIGHT_SHAPE_CUBOID,    vec3( 5.5, 5.5, 5.5 )
        );
        
        // links room
        area_light[3] = arealight(
            vec4( 1.0, 1.0, 1.0, 0.0 ) * 0.7, vec4( 0.0, 0.0, 0.0, 0.0 ), 
            vec3( 0.0, 0.5, 0.0 ), LIGHT_MODE_ADD,
            vec3( -227.5, -46.0, 17.5 ), vec3( 0.0, 3.5, 5.0 ),
            LIGHT_SHAPE_CUBOID,          vec3( 7.5, 3.5, 7.5 )
        );

    // well
    area_light[4] = arealight(
        vec4( 2.0, 2.0, 2.0, 2.0 ), vec4( 0.0, 0.0, 0.0, 0.0 ), 
        vec3( 0.3, 0.5, 0.0 ), LIGHT_MODE_SUBTRACT,
        vec3( 25.5, -33.0, 30.5 ), vec3( 0.0, -3.5, 0.0 ),
        LIGHT_SHAPE_CUBOID,        vec3( 1.5,  3.5, 1.5 )
    );
    
    // checkpoints
    area_light[5] = CHECKPOINT_DEFAULT;
    area_light[5].pos = vec3( 24.5, -48.5, 9.5 );

    area_light[6] = CHECKPOINT_DEFAULT;
    area_light[6].pos = vec3( 39.5, -41.5, -4.5 );

    area_light[7] = CHECKPOINT_DEFAULT;
    area_light[7].pos = vec3( 84.5, -31.5, 6.5 );

    area_light[8] = CHECKPOINT_DEFAULT;
    area_light[8].pos = vec3( 68.5, -20.5, -34.5 );

    area_light[9] = CHECKPOINT_DEFAULT;
    area_light[9].pos = vec3( 76.5, -6.5, -13.5 );

    area_light[10] = CHECKPOINT_DEFAULT;
    area_light[10].pos = vec3( 48.5, -3.5, 1.5 );

    // ship (another way to init lightarea)
    area_light[11].mode         = LIGHT_MODE_ADD;
    area_light[11].start_color  = vec4( 1.0, 0.7, 0.1, 0.0 ) * 0.8;
    area_light[11].end_color    = vec4( 0.0, 0.0, 0.0, 0.0 );
    area_light[11].mix_strength = vec3( 0.0, 0.0, 0.8 );
    area_light[11].shape           = LIGHT_SHAPE_CUBOID;
    area_light[11].pos             = vec3( -3.5, -49.0, 16.0 );
    area_light[11].shape_parameter = vec3( 1.0, 1.0, 1.9 );
    area_light[11].offset          = vec3( 0.0, 1.0, 0.0 );
    
    // redstone block
    area_light[12] = arealight(
        vec4( 1.0, 0.0, 0.0, 0.0 ) * 1, vec4( 0.0, 0.0, 0.0, 0.0 ), 
        vec3( 0.7, 0.7, 0.7 ), LIGHT_MODE_ADD,
        vec3( 66.5, -38.5, -16.5 ), vec3( 0.0, 0.0, 0.0 ),
        LIGHT_SHAPE_CUBOID,         vec3( 1.5, 1.5, 1.5 )
    );
    
    // blood puddle
    area_light[13] = arealight(
        vec4( 1.0, 0.0, 0.0, 1.0 ) * 1, vec4( 1.0, 1.0, 1.0, 1.0 ), 
        vec3( 0.8, 0.0, 0.8 ), LIGHT_MODE_MULTIPLY,
        vec3( 74.5, -48.0, 28.5 ), vec3( 0.0, 0.0, 0.0 ),
        LIGHT_SHAPE_CUBOID,        vec3( 1.5, 0.1, 1.5 )
    );
    
    // lava(resin) blocks
    area_light[14] = LAVA_BLOCK_DEFAULT;
    area_light[14].pos = vec3( 63.5, -22.5, -20.5);

    area_light[15] = LAVA_BLOCK_DEFAULT;
    area_light[15].pos = vec3( 71.5, -20.5, -2.5 );

    area_light[16] = LAVA_BLOCK_DEFAULT;
    area_light[16].pos = vec3( 79.5, -19.5, 6.5 );

    area_light[17] = LAVA_BLOCK_DEFAULT;
    area_light[17].pos = vec3( 75.5, -15.5, 19.5 );

    // lava(resin) pool
    area_light[18] = LAVA_BLOCK_DEFAULT;
    area_light[18].mix_strength    = vec3(  0.5,   0.0,  0.5 );
    area_light[18].pos             = vec3( 63.0, -14.0, 13.0 );
    area_light[18].shape_parameter = vec3(  1.0,   1.0,  1.0 );
    area_light[18].offset          = vec3(  0.0,  -1.0,  0.0 );

    // nether portal
    area_light[19] = arealight(
        vec4( 0.7, 0.0, 1.0, 0.0 ) * 1, vec4( 0.0, 0.0, 0.0, 0.0 ), 
        vec3( 0.0, 0.0, 0.5 ), LIGHT_MODE_ADD,
        vec3( 69.0, -9.5, -0.5 ), vec3( 0.0, 0.0, 0.0 ),
        LIGHT_SHAPE_CUBOID,       vec3( 1.0, 1.6, 2.5 )
    );

    // colorcubes
        
        // big ones
        area_light[20] = arealight(
            vec4( 1.0, 1.0, 1.0, 1.0 ) * 1, vec4( 0.0, 0.0, 0.0, 0.0 ), 
            vec3( 0.0, 0.5, 0.0 ), LIGHT_MODE_ADD,
            vec3( 76.5, -11.5, -13.5 ), vec3( 0.0, 3.0, 0.0 ),
            LIGHT_SHAPE_CUBOID,         vec3( 2.5, 3.0, 2.5 )
        );
        area_light[21] = arealight(
            vec4( 1.0, 1.0, 1.0, 1.0 ) * 1, vec4( 0.0, 0.0, 0.0, 0.0 ), 
            vec3( 0.0, 0.5, 0.0 ), LIGHT_MODE_SUBTRACT,
            vec3( 48.5, -8.5, 1.5 ), vec3( 0.0, 3.0, 0.0 ),
            LIGHT_SHAPE_CUBOID,      vec3( 2.5, 3.0, 2.5 )
        );
        
        // small ones
        area_light[22] = arealight(
            vec4( 1.0, 1.0, 1.0, 0.0 ), vec4( 0.0, 0.0, 0.0, 0.0 ), 
            vec3( 0.0, 0.7, 0.0 ), LIGHT_MODE_SUBTRACT,
            vec3( 69.0, -11.0, -3.0 ), vec3( 0.0, 0.0, 0.0 ),
            LIGHT_SHAPE_CUBOID,        vec3( 1.0, 2.0, 1.0 )
        );
        area_light[23] = arealight(
            vec4( 1.0, 0.8, 0.4, 1.0 ), vec4( 1.0, 1.0, 1.0, 1.0 ), 
            vec3( 0.3, 0.0, 0.1 ), LIGHT_MODE_MULTIPLY,
            vec3( 73.0, -10.0, -7.0 ), vec3( -1.0, -1.0, -1.0 ),
            LIGHT_SHAPE_CUBOID,        vec3(  1.0,  2.0,  1.0 )
        );
        area_light[24] = arealight(
            vec4( 0.0, 1.0, 0.0, 1.0 ), vec4( 0.0, 0.0, 0.0, 1.0 ), 
            vec3( 0.0, 0.7, 0.0 ), LIGHT_MODE_ADD,
            vec3( 76.0, -9.0, -20.0 ), vec3( 0.0, 0.0, 0.0 ),
            LIGHT_SHAPE_CUBOID,        vec3( 1.0, 2.0, 1.0 )
        );
        area_light[25] = arealight(
            vec4( 1.0, 0.0, 0.0, 1.0 ), vec4( 0.0, 0.0, 0.0, 1.0 ), 
            vec3( 0.0, 0.7, 0.0 ), LIGHT_MODE_ADD,
            vec3( 71.0, -9.0, -23.0 ), vec3( 0.0, 0.0, 0.0 ),
            LIGHT_SHAPE_CUBOID,        vec3( 1.0, 2.0, 1.0 )
        );
        area_light[26] = arealight(
            vec4( 0.0, 0.0, 1.0, 0.0 ), vec4( 0.0, 0.0, 0.0, 0.0 ), 
            vec3( 0.0, 0.7, 0.0 ), LIGHT_MODE_ADD,
            vec3( 65.0, -11.0, -27.0 ), vec3( 0.0, 0.0, 0.0 ),
            LIGHT_SHAPE_CUBOID,         vec3( 1.0, 2.0, 1.0 )
        );
        area_light[27] = arealight(
            vec4( 1.0, 0.0, 1.0, 0.0 ), vec4( 0.0, 0.0, 0.0, 0.0 ), 
            vec3( 0.0, 0.7, 0.0 ), LIGHT_MODE_SUBTRACT,
            vec3( 58.0, -14.0, -23.0 ), vec3( 0.0, 0.0, 0.0 ),
            LIGHT_SHAPE_CUBOID,         vec3( 1.0, 2.0, 1.0 )
        );
        area_light[28] = arealight(
            vec4( 0.0, 1.0, 1.0, 0.0 ), vec4( 0.0, 0.0, 0.0, 0.0 ), 
            vec3( 0.0, 0.7, 0.0 ), LIGHT_MODE_SUBTRACT,
            vec3( 54.0, -14.0, -18.0 ), vec3( 0.0, 0.0, 0.0 ),
            LIGHT_SHAPE_CUBOID,         vec3( 1.0, 2.0, 1.0 )
        );
        area_light[29] = arealight(
            vec4( 1.0, 1.0, 0.0, 0.0 ), vec4( 0.0, 0.0, 0.0, 0.0 ), 
            vec3( 0.0, 0.7, 0.0 ), LIGHT_MODE_SUBTRACT,
            vec3( 53.0, -14.0, -12.0 ), vec3( 0.0, 0.0, 0.0 ),
            LIGHT_SHAPE_CUBOID,         vec3( 1.0, 2.0, 1.0 )
        );
        area_light[30] = arealight(
            vec4( 1.0, 0.0, 0.0, 0.0 ), vec4( 0.0, 1.0, 0.0, 0.0 ), 
            vec3( 0.25, 0.25, 0.25 ), LIGHT_MODE_ADD,
            vec3( 55.0, -13.0, -7.0 ), vec3( -1.0, -2.0, -1.0 ),
            LIGHT_SHAPE_CUBOID,        vec3(  1.0,  2.0,  1.0 )
        );
        area_light[31] = arealight(
            vec4( 0.0, 1.0, 1.0, 0.0 ), vec4( 1.0, 0.0, 1.0, 0.0 ), 
            vec3( 0.25, 0.25, 0.25 ), LIGHT_MODE_SUBTRACT,
            vec3( 55.0, -12.0, -2.0 ), vec3( -1.0, -2.0, -1.0 ),
            LIGHT_SHAPE_CUBOID,        vec3(  1.0,  2.0,  1.0 )
        );
        area_light[32] = arealight(
            vec4( 1.0, 0.0, 0.0, 1.0 ), vec4( 0.0, 1.0, 0.0, 1.0 ), 
            vec3( 0.25, 0.25, 0.25 ), LIGHT_MODE_MULTIPLY,
            vec3( 56.0, -11.0, 3.0 ), vec3( -1.0, -2.0, -1.0 ),
            LIGHT_SHAPE_CUBOID,       vec3(  1.0,  2.0,  1.0 )
        );
        area_light[33] = arealight(
            vec4( 1.0, 0.0, 0.0, 1.0 ), vec4( 0.0, 1.0, 0.0, 1.0 ), 
            vec3( 0.25, 0.25, 0.25 ), LIGHT_MODE_DIVIDE,
            vec3( 52.0, -10.0, 7.0 ), vec3( -1.0, -2.0, -1.0 ),
            LIGHT_SHAPE_CUBOID,       vec3(  1.0,  2.0,  1.0 )
        );
        area_light[34] = arealight(
            vec4( 1.0, 0.0, 0.0, 1.0 ), vec4( 0.0, 1.0, 0.0, 1.0 ), 
            vec3( 0.25, 0.25, 0.25 ), LIGHT_MODE_OVERRIDE,
            vec3( 48.0, -9.0, 7.0 ), vec3( -1.0, -2.0, -1.0 ),
            LIGHT_SHAPE_CUBOID,      vec3(  1.0,  2.0,  1.0 )
        );
        area_light[35] = arealight(
            vec4( 1.0, 1.0, 1.0, 1.0 ), vec4( 0.0, 0.0, 0.0, 1.0 ), 
            vec3( 0.25, 0.25, 0.25 ), LIGHT_MODE_DIVIDE,
            vec3( 43.0, -9.0, 4.0 ), vec3( -1.0, -2.0, -1.0 ),
            LIGHT_SHAPE_CUBOID,      vec3(  1.0,  2.0,  1.0 )
        );
        area_light[36] = arealight(
            vec4( 1.0, 1.0, 1.0, 1.0 ), vec4( 0.0, 0.0, 0.0, 1.0 ), 
            vec3( 0.25, 0.25, 0.25 ), LIGHT_MODE_MULTIPLY,
            vec3( 43.0, -7.0, 0.0 ), vec3( -1.0, -2.0, -1.0 ),
            LIGHT_SHAPE_CUBOID,      vec3(  1.0,  2.0,  1.0 )
        );
        area_light[37] = arealight(
            vec4( 1.0, 0.0, 0.0, 0.0 ), vec4( 0.0, 0.0, 0.0, 1.0 ), 
            vec3( 0.25, 0.25, 0.25 ), LIGHT_MODE_ADD,
            vec3( 50.0, -5.0, -3.0 ), vec3( 0.0, 0.0, 0.0 ),
            LIGHT_SHAPE_CUBOID,       vec3( 2.0, 2.0, 2.0 )
        );
        area_light[38] = arealight(
            vec4( 0.0, 1.0, 0.0, 0.0 ), vec4( 0.0, 0.0, 0.0, 1.0 ), 
            vec3( 0.25, 0.25, 0.25 ), LIGHT_MODE_ADD,
            vec3( 48.0, -4.0, -6.0 ), vec3( 0.0, 0.0, 0.0 ),
            LIGHT_SHAPE_CUBOID,       vec3( 2.0, 2.0, 2.0 )
        );
        area_light[39] = arealight(
            vec4( 0.0, 0.0, 1.0, 0.0 ), vec4( 0.0, 0.0, 0.0, 1.0 ), 
            vec3( 0.25, 0.25, 0.25 ), LIGHT_MODE_ADD,
            vec3( 46.0, -3.0, -3.0 ), vec3( 0.0, 0.0, 0.0 ),
            LIGHT_SHAPE_CUBOID,       vec3( 2.0, 2.0, 2.0 )
        );
        area_light[40] = arealight(
            vec4( 1.0, 0.0, 1.0, 0.0 ), vec4( 0.0, 1.0, 0.0, 1.0 ), 
            vec3( 0.5, 0.5, 0.5 ), LIGHT_MODE_ADD,
            vec3( 52.0, -3.0, 5.0 ), vec3( -1.0, -1.0, -1.0 ),
            LIGHT_SHAPE_CUBOID,      vec3(  2.0,  2.0,  2.0 )
        );
        area_light[41] = arealight(
            vec4( 0.0, 1.0, 1.0, 0.0 ), vec4( 1.0, 0.0, 0.0, 1.0 ), 
            vec3( 0.45, 0.45, 0.45 ), LIGHT_MODE_ADD,
            vec3( 48.0, -6.0, 12.0 ), vec3( 0.0, 0.0, 0.0 ),
            LIGHT_SHAPE_CUBOID,       vec3( 1.0, 1.0, 1.0 )
        );
        area_light[42] = arealight(
            vec4( 0.0, 0.0, 0.0, 0.0 ), vec4( 1.0, 1.0, 1.0, 1.0 ), 
            vec3( 0.45, 0.45, 0.45 ), LIGHT_MODE_ADD,
            vec3( 48.0, -8.0, 18.0 ), vec3( 0.0, 0.0, 0.0 ),
            LIGHT_SHAPE_CUBOID,       vec3( 1.0, 1.0, 1.0 )
        );
        // xyz light-add cube
            area_light[43] = arealight(
                vec4( 1.0, 0.0, 0.0, 0.0 ), vec4( 0.0, 0.0, 0.0, 1.0 ), 
                vec3( 0.5, 0.0, 0.0 ), LIGHT_MODE_ADD,
                vec3( 41.0, -12.0, 22.0 ), vec3( 1.0, 0.0, 0.0 ),
                LIGHT_SHAPE_CUBOID,        vec3( 1.0, 1.0, 1.0 )
            );
            area_light[44] = arealight(
                vec4( 0.0, 1.0, 0.0, 0.0 ), vec4( 0.0, 0.0, 0.0, 1.0 ), 
                vec3( 0.0, 0.5, 0.0 ), LIGHT_MODE_ADD,
                vec3( 41.0, -12.0, 22.0 ), vec3( 0.0, 1.0, 0.0 ),
                LIGHT_SHAPE_CUBOID,        vec3( 1.0, 1.0, 1.0 )
            );
            area_light[45] = arealight(
                vec4( 0.0, 0.0, 1.0, 0.0 ), vec4( 0.0, 0.0, 0.0, 1.0 ), 
                vec3( 0.0, 0.0, 0.5 ), LIGHT_MODE_ADD,
                vec3( 41.0, -12.0, 22.0 ), vec3( 0.0, 0.0, 1.0 ),
                LIGHT_SHAPE_CUBOID,        vec3( 1.0, 1.0, 1.0 )
            );
        // xyz light-subtract cube
            area_light[46] = arealight(
                vec4( 1.0, 0.0, 0.0, 0.0 ), vec4( 0.0, 0.0, 0.0, 0.0 ), 
                vec3( 0.5, 0.0, 0.0 ), LIGHT_MODE_SUBTRACT,
                vec3( 39.0, -14.0, 28.0 ), vec3( 1.0, 0.0, 0.0 ),
                LIGHT_SHAPE_CUBOID,        vec3( 1.0, 1.0, 1.0 )
            );
            area_light[47] = arealight(
                vec4( 0.0, 1.0, 0.0, 0.0 ), vec4( 0.0, 0.0, 0.0, 0.0 ), 
                vec3( 0.0, 0.5, 0.0 ), LIGHT_MODE_SUBTRACT,
                vec3( 39.0, -14.0, 28.0 ), vec3( 0.0, 1.0, 0.0 ),
                LIGHT_SHAPE_CUBOID,        vec3( 1.0, 1.0, 1.0 )
            );
            area_light[48] = arealight(
                vec4( 0.0, 0.0, 1.0, 0.0 ), vec4( 0.0, 0.0, 0.0, 0.0 ), 
                vec3( 0.0, 0.0, 0.5 ), LIGHT_MODE_SUBTRACT,
                vec3( 39.0, -14.0, 28.0 ), vec3( 0.0, 0.0, 1.0 ),
                LIGHT_SHAPE_CUBOID,        vec3( 1.0, 1.0, 1.0 )
            );
        // xyz light-multiply cube
            area_light[49] = arealight(
                vec4( 1.0, 0.0, 0.0, 1.0 ), vec4( 1.0, 1.0, 1.0, 1.0 ), 
                vec3( 0.5, 0.0, 0.0 ), LIGHT_MODE_MULTIPLY,
                vec3( 42.0, -13.0, 32.0 ), vec3( 1.0, 0.0, 0.0 ),
                LIGHT_SHAPE_CUBOID,        vec3( 1.0, 1.0, 1.0 )
            );
            area_light[50] = arealight(
                vec4( 0.0, 1.0, 0.0, 1.0 ), vec4( 1.0, 1.0, 1.0, 1.0 ), 
                vec3( 0.0, 0.5, 0.0 ), LIGHT_MODE_MULTIPLY,
                vec3( 42.0, -13.0, 32.0 ), vec3( 0.0, 1.0, 0.0 ),
                LIGHT_SHAPE_CUBOID,        vec3( 1.0, 1.0, 1.0 )
            );
            area_light[51] = arealight(
                vec4( 0.0, 0.0, 1.0, 1.0 ), vec4( 1.0, 1.0, 1.0, 1.0 ), 
                vec3( 0.0, 0.0, 0.5 ), LIGHT_MODE_MULTIPLY,
                vec3( 42.0, -13.0, 32.0 ), vec3( 0.0, 0.0, 1.0 ),
                LIGHT_SHAPE_CUBOID,        vec3( 1.0, 1.0, 1.0 )
            );
        // xyz light-divide cube
            area_light[52] = arealight(
                vec4( 1.0, 0.0, 0.0, 1.0 ), vec4( 1.0, 1.0, 1.0, 1.0 ), 
                vec3( 0.5, 0.0, 0.0 ), LIGHT_MODE_DIVIDE,
                vec3( 42.0, -12.0, 36.0 ), vec3( 1.0, 0.0, 0.0 ),
                LIGHT_SHAPE_CUBOID,        vec3( 1.0, 1.0, 1.0 )
            );
            area_light[53] = arealight(
                vec4( 0.0, 1.0, 0.0, 1.0 ), vec4( 1.0, 1.0, 1.0, 1.0 ), 
                vec3( 0.0, 0.5, 0.0 ), LIGHT_MODE_DIVIDE,
                vec3( 42.0, -12.0, 36.0 ), vec3( 0.0, 1.0, 0.0 ),
                LIGHT_SHAPE_CUBOID,        vec3( 1.0, 1.0, 1.0 )
            );
            area_light[54] = arealight(
                vec4( 0.0, 0.0, 1.0, 1.0 ), vec4( 1.0, 1.0, 1.0, 1.0 ), 
                vec3( 0.0, 0.0, 0.5 ), LIGHT_MODE_DIVIDE,
                vec3( 42.0, -12.0, 36.0 ), vec3( 0.0, 0.0, 1.0 ),
                LIGHT_SHAPE_CUBOID,        vec3( 1.0, 1.0, 1.0 )
            );
        // xyz light-pverride cube
            area_light[55] = arealight(
                vec4( 1.0, 0.0, 0.0, 1.0 ), vec4( 1.0, 1.0, 1.0, 1.0 ), 
                vec3( 0.5, 0.0, 0.0 ), LIGHT_MODE_OVERRIDE,
                vec3( 39.0, -11.0, 40.0 ), vec3( 1.0, 0.0, 0.0 ),
                LIGHT_SHAPE_CUBOID,        vec3( 1.0, 1.0, 1.0 )
            );
            area_light[56] = arealight(
                vec4( 0.0, 1.0, 0.0, 1.0 ), vec4( 1.0, 1.0, 1.0, 1.0 ), 
                vec3( 0.0, 0.5, 0.0 ), LIGHT_MODE_OVERRIDE,
                vec3( 39.0, -11.0, 40.0 ), vec3( 0.0, 1.0, 0.0 ),
                LIGHT_SHAPE_CUBOID,        vec3( 1.0, 1.0, 1.0 )
            );
            area_light[57] = arealight(
                vec4( 0.0, 0.0, 1.0, 1.0 ), vec4( 1.0, 1.0, 1.0, 1.0 ), 
                vec3( 0.0, 0.0, 0.5 ), LIGHT_MODE_OVERRIDE,
                vec3( 39.0, -11.0, 40.0 ), vec3( 0.0, 0.0, 1.0 ),
                LIGHT_SHAPE_CUBOID,        vec3( 1.0, 1.0, 1.0 )
            );
        area_light[58] = arealight(
            vec4( 1.0, 1.0, 1.0, 1.0 ), vec4( 0.0, 0.0, 0.0, 1.0 ), 
            vec3( 0.0, 0.0, 0.0 ), LIGHT_MODE_SUBTRACT,
            vec3( 34.0, -8.0, 37.0 ), vec3( 0.0, -1.0, 0.0 ),
            LIGHT_SHAPE_CUBOID,       vec3( 1.0, 1.1, 1.0 )
        );

    // link cubes
        area_light[59] = arealight(
            vec4( 1.0, 0.6, 0.0, 1.0 ), vec4( 0.0, 0.0, 0.0, 1.0 ), 
            vec3( 0.5, 0.5, 0.5 ), LIGHT_MODE_ADD,
            vec3( -230.5, -48.5, 10.5 ), vec3( 0.0, 0.0, 0.0 ),
            LIGHT_SHAPE_CUBOID,          vec3( 2.0, 2.0, 2.0 )
        );
        area_light[60] = arealight(
            vec4( 1.0, 0.6, 0.0, 1.0 ), vec4( 0.0, 0.0, 0.0, 1.0 ), 
            vec3( 0.5, 0.5, 0.5 ), LIGHT_MODE_ADD,
            vec3( -224.5, -48.5, 10.5 ), vec3( 0.0, 0.0, 0.0 ),
            LIGHT_SHAPE_CUBOID,          vec3( 2.0, 2.0, 2.0 )
        );

    // sand temple
        area_light[61] = arealight(
            vec4( 0.6, 0.2, 1.0, 1.0 ), vec4( 0.0, 0.0, 0.0, 1.0 ), 
            vec3( 0.8, 0.25, 0.8 ), LIGHT_MODE_ADD,
            vec3( 100.5, -26.5, -23.5 ), vec3( 0.0, 0.0, 0.0 ),
            LIGHT_SHAPE_CUBOID,          vec3( 3.5, 2.0, 3.5 )
        );

    // lanterns
        area_light[62] = arealight(
            vec4( 1.0, 0.6, 0.0, 1.0 ), vec4( 0.0, 0.0, 0.0, 1.0 ), 
            vec3( 0.9, 0.9, 0.9 ), LIGHT_MODE_ADD,
            vec3( 51.5, -43.5, 33.5 ), vec3( 0.0, 0.0, 0.0 ),
            LIGHT_SHAPE_ELLIPSOID,     vec3( 5.5, 4.5, 5.5 )
        );
        area_light[63] = arealight(
            vec4( 1.0, 0.6, 0.0, 1.0 ), vec4( 0.0, 0.0, 0.0, 1.0 ), 
            vec3( 0.9, 0.9, 0.9 ), LIGHT_MODE_ADD,
            vec3( 62.5, -35.5, 7.5 ), vec3( 0.0, 0.0, 0.0 ),
            LIGHT_SHAPE_ELLIPSOID,    vec3( 5.5, 4.5, 2.0 )
        );
        area_light[64] = arealight(
            vec4( 1.0, 0.6, 0.0, 1.0 ), vec4( 0.0, 0.0, 0.0, 1.0 ), 
            vec3( 0.9, 0.9, 0.9 ), LIGHT_MODE_ADD,
            vec3( 65.5, -35.5, 7.5 ), vec3( 0.0, 0.0, 0.0 ),
            LIGHT_SHAPE_ELLIPSOID,    vec3( 5.5, 4.5, 2.0 )
        );

    // void temple
        area_light[65] = arealight(
            vec4( 1.0, 1.0, 1.0, 1.0 ), vec4( 0.0, 0.0, 0.0, 1.0 ), 
            vec3( 0.2, 1.0, 0.2 ), LIGHT_MODE_SUBTRACT,
            vec3( 35.5, -19.5, -39.5 ), vec3( 0.0, -2.6, 0.0 ),
            LIGHT_SHAPE_CUBOID,         vec3( 3.0,  3.0, 3.0 )
        );
}