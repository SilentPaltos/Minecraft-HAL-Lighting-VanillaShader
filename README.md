# Minecraft-HAL-Lighting-VanillaShader
_I don't remember why it is called HAL.._

It might be not perfect but I just wanted to create some lighting system using minecraft vanilla shaders. Just for fun.\
It affects blocks, entities and particles, but it is also unfinished since not all object are affected by this system. And there is a lot of things that can be done to improve this shader. Probably I'll fix all of it.

Here is some screenshots from the developing process:\
<img width="342" height="192" alt="2025-12-30_21 56 08" src="https://github.com/user-attachments/assets/73350011-81b9-472f-bedd-5fb603f94d0c" /> <img width="342" height="192" alt="2025-12-30_15 41 03" src="https://github.com/user-attachments/assets/0580e6ef-de2e-4c24-942a-ca5accfdca50" />
<img width="342" height="192" alt="2025-12-31_00 42 59" src="https://github.com/user-attachments/assets/22e1f5ae-a74f-462e-a697-3e3c3de87701" /> <img width="342" height="192" alt="2025-12-30_15 43 17" src="https://github.com/user-attachments/assets/38bfd014-5dad-4c06-82c5-4c9bc1c4fc9a" />

This shader allow you to create areas that filled with light
It has 3 main files:
- `hal_structs.glsl` - just custom variable types but also it defines light modes
- `hal_list.glsl` - list of areas that will be filled with light
- `hal.glsl` - all the functions for lighting. Also here count of lights is defined

Mainly you need only `hal_list.glsl` and `hal.glsl`

in `hal.glsl` you only need these 2 lines:
```
#define LIGHTS_COLORS_COUNT 50
#define LIGHT_AREAS_COUNT 1
```
`LIGHTS_COLORS_COUNT` - defines how many light colors you can use\
`LIGHT_AREAS_COUNT` - defines how many areas can be created for 1 color\
Actually you can keep `LIGHT_AREAS_COUNT 1` and just change number of colors and then you can just create two separate lights with identical color value

Talking about creating lights...\
You can create them in the `hal_list.glsl`\
Here is example from the Parkour Map that you can also download. I created this map just for demonstration
```
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
```

Example from the level 1
```
// red lights
        lights[3].mode = LIGHT_MODE_ADD;
        lights[3].color = vec4( 0.5, 0, 0, 0 );
        lights[3].areas[0].start = vec3( 19.5, -54.5, 13.0 );
        lights[3].areas[0].end =   vec3( 21.5, -50.5, 14.0 );

        lights[4].mode = LIGHT_MODE_ADD;
        lights[4].color = vec4( 0.5, 0, 0, 0 );
        lights[4].areas[0].start = vec3( 19.5, -54.5, 2.5 );
        lights[4].areas[0].end =   vec3( 21.5, -50.5, 3.5 );
```

As you can see every light source(if it can be called that way) has 4(actually 3 since areas is an array) parameters
- `mode` (int) - allows you to select in which way light(color) applies to the area. All light modes are defined in the `hal_structs.glsl`
- `color` (vec4, rgba) - just color of the light
- `areas` (arr) - array of starting and ending points of the areas that should be filled with light (But you always can keep maximum areas count at 1 and just repeat colors)

More screenshots:\
<img width="342" height="192" alt="2025-12-31_15 18 36" src="https://github.com/user-attachments/assets/5d2207d4-7af6-40ff-b6ef-06c2095393f7" /> <img width="342" height="192" alt="2025-12-31_14 48 50" src="https://github.com/user-attachments/assets/ac1389d9-323c-4bb4-b28a-cfd269a3e2e0" />
<img width="342" height="192" alt="2025-12-30_21 14 59" src="https://github.com/user-attachments/assets/fd88b3f6-7525-4cdc-8210-11f8054fda73" /> <img width="342" height="192" alt="2025-12-31_00 21 30" src="https://github.com/user-attachments/assets/2f305b12-ae75-4449-822e-b98cb0cfa5ee" />
<img width="342" height="192" alt="2025-12-30_16 54 55" src="https://github.com/user-attachments/assets/b6c93172-dcf8-4787-af2a-0c8380dfab38" /> <img width="342" height="192" alt="2025-12-31_15 49 31" src="https://github.com/user-attachments/assets/440b720a-3822-4b46-9a33-4a1217714c3f" />

