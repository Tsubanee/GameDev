
if(!show_inventory) exit;

//------Inventory Back
draw_sprite_part_ext(spr_inv_UI, 0, cell_size, 0, inv_UI_width, inv_UI_height, inv_UI_x, inv_UI_y, scale, scale, c_white, 1);
	

var info_grid = ds_player_info;

draw_set_font(fnt_text_24);
var c = c_black;
draw_text_color(info_x, info_y, info_grid[# 0, 3] + ": " + info_grid[# 1, 3], c,c,c,c,1);

draw_set_font(fnt_smalldigits);
var yy = 0;
repeat(3)
	{
		draw_text_color(info_x + (192*scale) + ((15+18)*scale*yy), info_y, string(info_grid[# 1, yy]), c,c,c,c,1);
		yy += 1;
	}
	
	
	
//-------Inventory
var ii, ix, iy, xx, yy, sx, sy, iitem, inv_grid;
ii = 0; ix = 0; iy = 0; inv_grid = ds_inventory;

repeat(inv_slots)
{
	//x,y location for slot
	xx = slots_x + ((cell_size+x_buffer)*ix*scale);
	yy = slots_y + ((cell_size+y_buffer)*iy*scale);
	
	
	//Item
	iitem = inv_grid[# 0, ii];
	sx = (iitem mod spr_inv_items_columns)*cell_size;
	sy = (iitem div spr_inv_items_columns)*cell_size;
	
	//Draw slot and Item
	draw_sprite_part_ext(spr_inv_UI, 0,0,0, cell_size, cell_size, xx,yy, scale, scale, c_white, 1);
	if(iitem > 0) draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
	
	
	//Draw item number
	if(iitem > 0)
	{
		var number = inv_grid[# 1, ii];
		draw_text_color(xx,yy, string(number), c,c,c,c,1);
	}
	
	
	
	//Increment
	ii += 1;
	ix = ii mod inv_slots_width;
	iy = ii div inv_slots_width;
	
	
}