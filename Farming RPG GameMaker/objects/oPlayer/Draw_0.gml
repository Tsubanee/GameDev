/// @description Insert description here
// You can write your code in this editor

var anim_length = 9;
var frame_size = 64;
var anim_speed = 12;

switch(facing) 
{
	case dir.left:  y_frame = 9; break;	
	case dir.right: y_frame = 11; break;		
	case dir.up:  y_frame = 8;	break;	
	case dir.down:  y_frame = 10;	break;	
	case -1:  x_frame = 0;	break;	
	
}

var xx = x - x_offset;
var yy = y - y_offset

//DRAW CHARACTER SHADOW
if(s_char_shadow != -1) draw_sprite(s_char_shadow, 0, x, y);

//INCREMENT FRAME FOR ANIMATION
if(x_frame + (anim_speed/60) < anim_length) x_frame += anim_speed/60;
else						  x_frame = 1;

//DRAW CHARACTER BASE
if(s_base != -1) draw_sprite_part(s_base, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx, yy);

//DRAW CHARACTER FEET
if(s_feet != -1) draw_sprite_part(s_feet, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx, yy);

//DRAW CHARACTER LEGS
if(s_legs != -1) draw_sprite_part(s_legs, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx, yy);

//DRAW CHARACTER SHIRT
if(s_torso != -1) draw_sprite_part(s_torso, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx, yy);

//DRAW CHARACTER HAIR
if(s_hair != -1) draw_sprite_part(s_hair, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx, yy);



