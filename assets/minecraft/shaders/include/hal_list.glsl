#version 330

void init_lights() {

    // level 1

        // shades
        lights[0].mode = LIGHT_MODE_SUBTRACT;
        lights[0].color = vec4( 1, 1, 1, 0 );
        lights[0].areas[0].start = vec3( -37.0, -37.0,  6.0 );
        lights[0].areas[0].end =   vec3(  22.0, -36.0, 11.0 );

        lights[1].mode = LIGHT_MODE_SUBTRACT;
        lights[1].color = vec4( 0.4, 0.4, 0.4, 0 );
        lights[1].areas[0].start = vec3( -41.0, -39.50,  6.0 );
        lights[1].areas[0].end =   vec3(  26.0, -37.00, 11.0 );

        lights[2].mode = LIGHT_MODE_MULTIPLY;
        lights[2].color = vec4( 0, 0.1, 0.4, 1 );
        lights[2].areas[0].start = vec3( -41.0, -61.00,  3.0 );
        lights[2].areas[0].end =   vec3(  26.0, -58.15, 14.0 );

        // red lights
        lights[3].mode = LIGHT_MODE_ADD;
        lights[3].color = vec4( 0.5, 0, 0, 0 );
        lights[3].areas[0].start = vec3( 19.5, -54.5, 13.0 );
        lights[3].areas[0].end =   vec3( 21.5, -50.5, 14.0 );

        lights[4].mode = LIGHT_MODE_ADD;
        lights[4].color = vec4( 0.5, 0, 0, 0 );
        lights[4].areas[0].start = vec3( 19.5, -54.5, 2.5 );
        lights[4].areas[0].end =   vec3( 21.5, -50.5, 3.5 );
        
        lights[5].mode = LIGHT_MODE_ADD;
        lights[5].color = vec4( 0.5, 0, 0, 0 );
        lights[5].areas[0].start = vec3( 11.5, -54.5, 13.0 );
        lights[5].areas[0].end =   vec3( 13.5, -50.5, 14.0 );

        lights[6].mode = LIGHT_MODE_ADD;
        lights[6].color = vec4( 0.5, 0, 0, 0 );
        lights[6].areas[0].start = vec3( 11.5, -54.5, 2.5 );
        lights[6].areas[0].end =   vec3( 13.5, -50.5, 3.5 );
        
        lights[7].mode = LIGHT_MODE_ADD;
        lights[7].color = vec4( 0.5, 0, 0, 0 );
        lights[7].areas[0].start = vec3( 3.5, -54.5, 13.0 );
        lights[7].areas[0].end =   vec3( 5.5, -50.5, 14.0 );

        lights[8].mode = LIGHT_MODE_ADD;
        lights[8].color = vec4( 0.5, 0, 0, 0 );
        lights[8].areas[0].start = vec3( 3.5, -54.5, 2.5 );
        lights[8].areas[0].end =   vec3( 5.5, -50.5, 3.5 );
        
        lights[9].mode = LIGHT_MODE_ADD;
        lights[9].color = vec4( 0.5, 0, 0, 0 );
        lights[9].areas[0].start = vec3( -4.5, -54.5, 13.0 );
        lights[9].areas[0].end =   vec3( -2.5, -50.5, 14.0 );

        lights[10].mode = LIGHT_MODE_ADD;
        lights[10].color = vec4( 0.5, 0, 0, 0 );
        lights[10].areas[0].start = vec3( -4.5, -54.5, 2.5 );
        lights[10].areas[0].end =   vec3( -2.5, -50.5, 3.5 );
        
        lights[11].mode = LIGHT_MODE_ADD;
        lights[11].color = vec4( 0.5, 0, 0, 0 );
        lights[11].areas[0].start = vec3( -12.5, -54.5, 13.0 );
        lights[11].areas[0].end =   vec3( -10.5, -50.5, 14.0 );

        lights[12].mode = LIGHT_MODE_ADD;
        lights[12].color = vec4( 0.5, 0, 0, 0 );
        lights[12].areas[0].start = vec3( -12.5, -54.5, 2.5 );
        lights[12].areas[0].end =   vec3( -10.5, -50.5, 3.5 );

    //level 2

        // campfire
        lights[13].mode = LIGHT_MODE_ADD;
        lights[13].color = vec4( 1, 0.6, 0.1, 0 ) / 3;
        lights[13].areas[0].start = vec3( 27.0, -54.1, 56.0 );
        lights[13].areas[0].end =   vec3( 30.0, -51.0, 61.0 );

        lights[14].mode = LIGHT_MODE_ADD;
        lights[14].color = vec4( 1, 0.6, 0.1, 0 ) / 3;
        lights[14].areas[0].start = vec3( 26.0, -54.1, 57.0 );
        lights[14].areas[0].end =   vec3( 31.0, -51.0, 60.0 );

        lights[15].mode = LIGHT_MODE_ADD;
        lights[15].color = vec4( 1, 0.6, 0.1, 0 ) / 3;
        lights[15].areas[0].start = vec3( 27.0, -54.1, 57.0 );
        lights[15].areas[0].end =   vec3( 30.0, -52.0, 60.0 );

        // shroomlight
        lights[16].mode = LIGHT_MODE_ADD;
        lights[16].color = vec4( 1, 0.5, 0.1, 0 );
        lights[16].areas[0].start = vec3( 5.00, -54.1, 60.25 );
        lights[16].areas[0].end =   vec3( 6.75, -52.5, 62.00 );

        // redstone block
        lights[17].mode = LIGHT_MODE_ADD;
        lights[17].color = vec4( 0.8, 0.0, 0.0, 0 );
        lights[17].areas[0].start = vec3( 6.0, -54.0, 53.0 );
        lights[17].areas[0].end =   vec3( 9.0, -52.0, 55.0 );

        // redstone wire
        lights[27].mode = LIGHT_MODE_ADD;
        lights[27].color = vec4( 0.5, 0.0, 0.0, 0 );
        lights[27].areas[0].start = vec3( 7.0, -54.0, 54.0 );
        lights[27].areas[0].end =   vec3( 8.0, -53.0, 57.0 );

        // altar
        lights[18].mode = LIGHT_MODE_ADD;
        lights[18].color = vec4( 0.1, 0.8, 1.0, 0 );
        lights[18].areas[0].start = vec3( -18.0, -53.0, 56.0 );
        lights[18].areas[0].end =   vec3( -13.0, -49.0, 61.0 );

        // magma
        lights[19].mode = LIGHT_MODE_ADD;
        lights[19].color = vec4( 1, 0.5, 0.0, 0 );
        lights[19].areas[0].start = vec3( -40.5, -54.0, 53.5 );
        lights[19].areas[0].end =   vec3( -38.5, -52.0, 55.5 );

        // torches

            // torch
            lights[20].mode = LIGHT_MODE_ADD;
            lights[20].color = vec4( 1, 0.8, 0.3, 0 );
            lights[20].areas[0].start = vec3( -45.0, -53.0, 58.0 );
            lights[20].areas[0].end =   vec3( -44.0, -52.0, 59.0 );

            // redtsone torch
            lights[21].mode = LIGHT_MODE_ADD;
            lights[21].color = vec4( 1, 0.0, 0.0, 0 );
            lights[21].areas[0].start = vec3( -44.0, -53.0, 59.0 );
            lights[21].areas[0].end =   vec3( -43.0, -52.0, 60.0 );

            // soul torch
            lights[22].mode = LIGHT_MODE_ADD;
            lights[22].color = vec4( 0.2, 0.5, 1, 0 );
            lights[22].areas[0].start = vec3( -44.0, -53.0, 58.0 );
            lights[22].areas[0].end =   vec3( -43.0, -52.0, 59.0 );

            // copper torch
            lights[23].mode = LIGHT_MODE_ADD;
            lights[23].color = vec4( 0.5, 1, 0.7, 0 );
            lights[23].areas[0].start = vec3( -45.0, -53.0, 59.0 );
            lights[23].areas[0].end =   vec3( -44.0, -52.0, 60.0 );

        // froglights
        
            // ochre
            lights[24].mode = LIGHT_MODE_ADD;
            lights[24].color = vec4( 1.0, 0.8, 0.3, 0 ) * 0.9;
            lights[24].areas[0].start = vec3( -69.0, -53.0, 58.0 );
            lights[24].areas[0].end =   vec3( -64.0, -51.0, 63.0 );

            // verdant
            lights[25].mode = LIGHT_MODE_ADD;
            lights[25].color = vec4( 0.5, 1.0, 0.5, 0 ) * 0.7;
            lights[25].areas[0].start = vec3( -72.0, -53.0, 55.0 );
            lights[25].areas[0].end =   vec3( -67.0, -51.0, 60.0 );

            // pearlescent
            lights[26].mode = LIGHT_MODE_ADD;
            lights[26].color = vec4( 0.8, 0.4, 1, 0 ) * 0.7;
            lights[26].areas[0].start = vec3( -69.0, -53.0, 52.0 );
            lights[26].areas[0].end =   vec3( -64.0, -51.0, 57.0 );

    // level 3
        
        // shades

            // floor
            lights[28].mode = LIGHT_MODE_SUBTRACT;
            lights[28].color = vec4( 1, 1, 1, 1 );
            lights[28].areas[0].start = vec3( -53.0, -58.0,  96.0 );
            lights[28].areas[0].end =   vec3(  36.0, -56.0, 107.0 );

            // ceil
            lights[29].mode = LIGHT_MODE_SUBTRACT;
            lights[29].color = vec4( 1, 1, 1, 1 );
            lights[29].areas[0].start = vec3( -53.0, -38.0,  96.0 );
            lights[29].areas[0].end =   vec3(  36.0, -36.0, 107.0 );

        // modes showcase

            // add

                // red
                lights[30].mode = LIGHT_MODE_ADD;
                lights[30].color = vec4( 1, 0, 0, 1 );
                lights[30].areas[0].start = vec3( 28.0, -53.0,  99.0 );
                lights[30].areas[0].end =   vec3( 33.0, -52.0, 104.0 );

                // green
                lights[31].mode = LIGHT_MODE_ADD;
                lights[31].color = vec4( 0, 1, 0, 1 );
                lights[31].areas[0].start = vec3( 23.0, -52.0, 101.0 );
                lights[31].areas[0].end =   vec3( 26.0, -51.0, 104.0 );

                // blue
                lights[32].mode = LIGHT_MODE_ADD;
                lights[32].color = vec4( 0, 0, 1, 1 );
                lights[32].areas[0].start = vec3( 18.0, -51.0,  99.0 );
                lights[32].areas[0].end =   vec3( 21.0, -50.0, 102.0 );

            // subtract

                // red
                lights[33].mode = LIGHT_MODE_SUBTRACT;
                lights[33].color = vec4( 1, 0, 0, 0 );
                lights[33].areas[0].start = vec3( 10.0, -53.0,  99.0 );
                lights[33].areas[0].end =   vec3( 15.0, -52.0, 104.0 );

                // green
                lights[34].mode = LIGHT_MODE_SUBTRACT;
                lights[34].color = vec4( 0, 1, 0, 0 );
                lights[34].areas[0].start = vec3( 4.0, -52.0, 100.0 );
                lights[34].areas[0].end =   vec3( 7.0, -51.0, 103.0 );

                // blue
                lights[35].mode = LIGHT_MODE_SUBTRACT;
                lights[35].color = vec4( 0, 0, 1, 0 );
                lights[35].areas[0].start = vec3( -2.0, -51.0, 100.0 );
                lights[35].areas[0].end =   vec3(  1.0, -50.0, 103.0 );

            // multiply

                // red
                lights[36].mode = LIGHT_MODE_MULTIPLY;
                lights[36].color = vec4( 1, 0, 0, 1 );
                lights[36].areas[0].start = vec3( -10.0, -53.0,  99.0 );
                lights[36].areas[0].end =   vec3(  -5.0, -52.0, 104.0 );

                // green
                lights[37].mode = LIGHT_MODE_MULTIPLY;
                lights[37].color = vec4( 0, 1, 0, 1 );
                lights[37].areas[0].start = vec3( -15.0, -52.0,  99.0 );
                lights[37].areas[0].end =   vec3( -12.0, -51.0, 102.0 );

                // blue
                lights[38].mode = LIGHT_MODE_MULTIPLY;
                lights[38].color = vec4( 0, 0, 1, 1 );
                lights[38].areas[0].start = vec3( -22.0, -52.0, 101.0 );
                lights[38].areas[0].end =   vec3( -19.0, -51.0, 104.0 );

            // divide

                // red
                lights[39].mode = LIGHT_MODE_DIVIDE;
                lights[39].color = vec4( 1, 0, 0, 1 );
                lights[39].areas[0].start = vec3( -30.0, -53.0,  99.0 );
                lights[39].areas[0].end =   vec3( -25.0, -52.0, 104.0 );

                // green
                lights[40].mode = LIGHT_MODE_DIVIDE;
                lights[40].color = vec4( 0, 1, 0, 1 );
                lights[40].areas[0].start = vec3( -35.0, -52.0,  99.0 );
                lights[40].areas[0].end =   vec3( -32.0, -51.0, 102.0 );

                // blue
                lights[41].mode = LIGHT_MODE_DIVIDE;
                lights[41].color = vec4( 0, 0, 1, 1 );
                lights[41].areas[0].start = vec3( -40.0, -51.0, 101.0 );
                lights[41].areas[0].end =   vec3( -37.0, -50.0, 104.0 );
        
        // end of parkour

            // divide
            lights[42].mode = LIGHT_MODE_DIVIDE;
            lights[42].color = vec4( 1, 1, 1, 0 );
            lights[42].areas[0].start = vec3( -47.0, -53.0, 102.0 );
            lights[42].areas[0].end =   vec3( -45.0, -52.0, 104.0 );

            // multiply
            lights[43].mode = LIGHT_MODE_MULTIPLY;
            lights[43].color = vec4( 1, 1, 1, 0 );
            lights[43].areas[0].start = vec3( -49.0, -53.0, 102.0 );
            lights[43].areas[0].end =   vec3( -47.0, -52.0, 104.0 );

            // subtract
            lights[44].mode = LIGHT_MODE_SUBTRACT;
            lights[44].color = vec4( 1, 1, 1, 1 );
            lights[44].areas[0].start = vec3( -49.0, -53.0, 100.0 );
            lights[44].areas[0].end =   vec3( -47.0, -52.0, 102.0 );

            // add
            lights[45].mode = LIGHT_MODE_ADD;
            lights[45].color = vec4( 1, 1, 1, 1 );
            lights[45].areas[0].start = vec3( -47.0, -53.0, 100.0 );
            lights[45].areas[0].end =   vec3( -45.0, -52.0, 102.0 );

    // lobby

        // lights

            // orange
            lights[46].mode = LIGHT_MODE_ADD;
            lights[46].color = vec4( 1, 0.5, 0, 0 );
            lights[46].areas[0].start = vec3( 81.0, -60.1, 74.0 );
            lights[46].areas[0].end =   vec3( 84.0, -50.0, 77.0 );

            // magenta
            lights[47].mode = LIGHT_MODE_ADD;
            lights[47].color = vec4( 1, 0, 1, 0 );
            lights[47].areas[0].start = vec3( 81.0, -60.1, 68.0 );
            lights[47].areas[0].end =   vec3( 84.0, -50.0, 71.0 );

            // cyan
            lights[48].mode = LIGHT_MODE_ADD;
            lights[48].color = vec4( 0, 0.7, 0.6, 0 );
            lights[48].areas[0].start = vec3( 81.0, -60.1, 62.0 );
            lights[48].areas[0].end =   vec3( 84.0, -50.0, 65.0 );

        // shades
        lights[49].mode = LIGHT_MODE_SUBTRACT;
        lights[49].color = vec4( 1, 1, 1, 1 );
        lights[49].areas[0].start = vec3( 75.0, -60.1, 62.0 );
        lights[49].areas[0].end =   vec3( 76.0, -50.0, 77.0 );
}