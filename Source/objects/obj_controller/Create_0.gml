
//Load video
video_open("title_cube.mp4");
video_enable_loop(true)
titlealpha = 0;
titledest  = 0;
first=0;

//This was for palletes but it went nowhere
colors = [c_black,c_white];

erasetime=0;

application_surface_draw_enable(false);
main_int = 0;
main_int_spd = 0.1;
main_int_min = 0.025;

//Load fonts
scribble_font_set_default("fnt_program")
scribble_font_bake_outline_8dir("fnt_program","fnt_out",c_black,0)

instance_create_depth(0,0,0,objCRT);

black = 2*room_speed;
PAD=1;

steps=0;

pag=0;

wave[10]=0;

enum Pp {
     wstraight=0,
	 wangle=1,
	 wall=2,
	 player=3
}

init_levels();

 if(!file_exists("filedata.sav")){
	   filedata = ds_map_create();
	   for(var a=0; a<levelmax; a++){
		   ds_map_add(filedata,"Level"+string(a),0);   
		   ds_map_add(filedata,"Levelmoves"+string(a),0);   
	   }
	   
	   filedata[? "Level"+string(0)]=1;
	}else{
	   filedata = new_ds_map_secure_load("filedata.sav");
	   
	   for(var a=0; a<levelmax; a++){
		   if(!ds_map_exists(filedata,"Level"+string(a))){
		   ds_map_add(filedata,"Level"+string(a),0);   
		   ds_map_add(filedata,"Levelmoves"+string(a),0); 
		   }
	   }
	}

window_set_size(room_width*2,room_height*2);
window_center();

target_delta = 1/60;

actual_delta = delta_time/1000000;
delta_multiplier = actual_delta / target_delta;

levelpos=0;


alarm[1]=irandom_range(15*room_speed,40*room_speed);
