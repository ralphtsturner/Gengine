#pragma once

#include <SDL2/SDL.h>
#include <linmath.h>

#include "../types.h"

typedef struct render_state {
	SDL_Window* window;
	f32 width;
	f32 height;
    const char* title;
} Render_State;

void render_init(u32 width, u32 height, const char* title);
void render_begin(void);
void render_end(void);
void render_quad(vec2 pos, vec2 size, vec4 color);
void render_quad_line(vec2 pos, vec2 size, vec4 color);
void render_line_segment(vec2 start, vec2 end, vec4 color);
void render_aabb(f32* aabb, vec4 color);
