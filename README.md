# Minecraft-HAL-Lighting-VanillaShader
_I don't remember why it is named HAL.._

I created it as a tool for making lighting on maps

Minecraft 26.1 Snapshot 1\
**Incompatible with Sodium!**

Video: https://youtu.be/WDjhtDT9G6Y

It might be not perfect but I just wanted to create some lighting system using minecraft vanilla shaders. Just for fun.\
It affects blocks, entities and particles, but it is still unfinished since not all object are affected by this system. And there is a lot of things that can be done to improve this shader. Probably I'll fix all of it.

Here is some screenshots from the developing process:\
<img width="342" height="192" alt="2025-12-30_21 56 08" src="https://github.com/user-attachments/assets/73350011-81b9-472f-bedd-5fb603f94d0c" /> <img width="342" height="192" alt="2025-12-30_15 41 03" src="https://github.com/user-attachments/assets/0580e6ef-de2e-4c24-942a-ca5accfdca50" />
<img width="342" height="192" alt="2025-12-31_00 42 59" src="https://github.com/user-attachments/assets/22e1f5ae-a74f-462e-a697-3e3c3de87701" /> <img width="342" height="192" alt="2025-12-30_15 43 17" src="https://github.com/user-attachments/assets/38bfd014-5dad-4c06-82c5-4c9bc1c4fc9a" />
<img width="342" height="192" alt="2026-01-06_17 52 12" src="https://github.com/user-attachments/assets/364c645c-aeab-4aeb-af97-a20252fac74f" />
<img width="342" height="192" alt="2026-01-06_17 59 47" src="https://github.com/user-attachments/assets/82a30691-3f50-460e-b465-5aac338b6420" />
<img width="342" height="192" alt="2026-01-06_02 47 52" src="https://github.com/user-attachments/assets/a7e955c0-297c-4636-9cca-c429dffdca7c" />
<img width="342" height="192" alt="2026-01-02_22 05 24" src="https://github.com/user-attachments/assets/3f1fc782-fd9c-4481-b35d-196a9a259d5c" />



This shader allow you to create areas that filled with light\
It has next files:
- `hal_config.glsl` - some values to configure
- `hal_list.glsl` - list of areas that will be filled with light
- `hal_modes.glsl` - blend modes for lighting
- `hal_shapes.glsl` - shapes of areas in which light "spreads"
- `hal.glsl` - main file for lighting.

Mainly you need only `hal_list.glsl` and `hal_config.glsl`

in `hal_config.glsl` you only need these lines:
```
#define     AREA_LIGHTS_COUNT 100
#define LIGHT_RENDER_DISTANCE -1
#define FIX_OUT_OF_BOUNDS_MIX true
```
- `AREA_LIGHTS_COUNT` - defines how many light areas you can store in the shader
- `LIGHT_RENDER_DISTANCE` - defines how far light renders
- `FIX_OUT_OF_BOUNDS_MIX` - I don't remember why exactly I needed to add this but probably it's important

Talking about creating lights...\
You can create them in the `hal_list.glsl`\
There is some examples how you can create them
```
// default way to create
        area_light[0] = arealight(
            vec4( 1.0, 0.0, 0.0, 0.0 ), vec4( 0.0, 0.0, 0.0, 0.0 ), 
            vec3( 0.5, 0.0, 0.0 ), LIGHT_MODE_ADD,
            vec3( -247, -44, 14 ), vec3( 5.0, 0.0, 0.0 ),
            LIGHT_SHAPE_CUBOID,    vec3( 5.5, 5.5, 5.5 )
        );

// using variables
        arealight CHECKPOINT_DEFAULT = arealight(
            vec4( 0.4, 0.6, 1.0, 0.0 ) * 1.1, vec4( 0.0, 0.0, 0.0, 0.0 ), 
            vec3( 1.0, 0.25, 1.0 ), LIGHT_MODE_ADD,
            vec3( 0, 0, 0 ),    vec3( 0.0, 1.5, 0.0 ),
            LIGHT_SHAPE_CUBOID, vec3( 1.5, 1.5, 1.5 )
        );
        area_light[5] = CHECKPOINT_DEFAULT;
        area_light[5].pos = vec3( 24.5, -48.5, 9.5 );

// by components
        area_light[11].mode         = LIGHT_MODE_ADD;
        area_light[11].start_color  = vec4( 1.0, 0.7, 0.1, 0.0 ) * 0.8;
        area_light[11].end_color    = vec4( 0.0, 0.0, 0.0, 0.0 );
        area_light[11].mix_strength = vec3( 0.0, 0.0, 0.8 );
        area_light[11].shape           = LIGHT_SHAPE_CUBOID;
        area_light[11].pos             = vec3( -3.5, -49.0, 16.0 );
        area_light[11].shape_parameter = vec3( 1.0, 1.0, 1.9 );
        area_light[11].offset          = vec3( 0.0, 1.0, 0.0 );
```

As you can see every light source(if it can be called that way) has 8 parameters
- `start_color` (vec4, rgba) - start_color of the light
- `end_color` (vec4, rgba) - end_color of the light
- `mix_strngth` (vec3, xyz) - how color blends between start and end colors in each axis
- `mode` (int) - how color applies to verticies
- `pos` (vec3, xyz) - center position of the light area
- `offset` (vec3, xyz) - offset off the light starting point from the area center
- `shape` (int) - shape of the area
- `shape_parameter` (vec3, xyz) - light "spread" distance in each axis (both positive and negative direction)

More screenshots:\
<img width="342" height="192" alt="2025-12-31_15 18 36" src="https://github.com/user-attachments/assets/5d2207d4-7af6-40ff-b6ef-06c2095393f7" /> <img width="342" height="192" alt="2025-12-31_14 48 50" src="https://github.com/user-attachments/assets/ac1389d9-323c-4bb4-b28a-cfd269a3e2e0" />
<img width="342" height="192" alt="2025-12-30_21 14 59" src="https://github.com/user-attachments/assets/fd88b3f6-7525-4cdc-8210-11f8054fda73" /> <img width="342" height="192" alt="2025-12-31_00 21 30" src="https://github.com/user-attachments/assets/2f305b12-ae75-4449-822e-b98cb0cfa5ee" />
<img width="342" height="192" alt="2025-12-30_16 54 55" src="https://github.com/user-attachments/assets/b6c93172-dcf8-4787-af2a-0c8380dfab38" /> <img width="342" height="192" alt="2025-12-31_15 49 31" src="https://github.com/user-attachments/assets/440b720a-3822-4b46-9a33-4a1217714c3f" />
<img width="342" height="192" alt="2025-12-30_21 34 53" src="https://github.com/user-attachments/assets/93f9b7d4-480e-4d9d-8463-acd2683b132d" /> <img width="342" height="192" alt="2025-12-30_17 42 23" src="https://github.com/user-attachments/assets/7f448859-f023-4ddd-8972-b2053dd11968" />
