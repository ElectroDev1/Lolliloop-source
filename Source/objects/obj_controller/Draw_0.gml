switch(pag){
   case 0:
   if(steps==0){wave[99]=0; steps=1;}
		
   if(keyboard_check_pressed(ord("Z")))&&(wave[99]==0){
	        audio_stop_sound(snd_title);
			audio_play_sound(snd_begin,0,0);
			wave[99]=1;event_user(0);
			if(steps<80){steps=80;}
			for(var a=0; a<string_length("LolliLoop"); a++){
				wave[a+1]=1;
			}
			black=0;
 } 
	

   break;
}

if(black>0){black-=delta_multiplier; if(black<=1*delta_multiplier){if(pag==0){audio_play_sound(snd_begin,0,0);
}  event_user(0); black=0;}  exit;}

switch(pag){

    case 0:
	
	    titlealpha = lerp(titlealpha,titledest,0.05);
				
		var _data = video_draw();
		
		var _status = _data[0];

		if (_status == 0)
		{
		    var _surface = _data[1];
   
		    draw_surface_custom_origin(_surface,
			room_width/2,room_height/2,
			surface_get_width(_surface)/2,
			surface_get_height(_surface)/2,.75,.75,0,c_white,titlealpha
			)
			if(first){  
			  if(video_get_position()>=video_get_duration()-10000*2-1000){titledest=0;}
			
			  if(video_get_position()>10000 && video_get_position()<20000){titledest=1;}
			}
		}
	
	    if(wave[98]==0 && !audio_is_playing(snd_begin) && !audio_is_playing(snd_title)){
		   audio_play_sound(snd_title,10,1);	
		}
	
	    if(keyboard_check(vk_escape)){
		   if(erasetime<3*room_speed){
			  erasetime+=delta_multiplier;   
		   }else if(erasetime<4*room_speed){
			  //Erase file  
			  main_int=1;
			  erasetime=4*room_speed+5;
		   }
		}else{erasetime=0;}
	
	    //draw_sprite(spr_titleb,0,0,0);
	
	    var _off = 1*(1-wave[98]);
	
	    var _name = "LolliLoop";
		var _rad = 16;
		var _dist = 2;
		
		var _maintime = 70;
		
		draw_set_color(c_white);
		
		if(steps>=_maintime+30 && steps<=_maintime+31){titledest=1; first=1;}
		
		if(steps>_maintime){
		   wave[0]+=1*0.01;	
		}
		wave[0]=min(wave[0],1);
        		
		for(var a=0; a<string_length(_name); a++){
			
			var _spd=0.05;
			var _freq=8;
			var _d=10;
			
			if(steps>45+a*4){wave[a+1]+=1*0.05;}
		    wave[a+1]=min(wave[a+1],1);
		  
		    var _hidrad = _rad*(1-wave[a+1]);
		
		    var _y = 60;
			if(steps>_maintime){ 
				_y+=(sin((steps-80+a*_freq)*_spd)*_d)*(sin(current_time*0.0005)*2)*wave[0];
			}
			_y*=_off;
		
		    var _x = room_width/2+(_rad*2+_dist)*a-(_rad*2)*string_length(_name)/2;
		
		    var _letter = string_char_at(_name,a+1);
			
			draw_circle_colour(_x,_y,_rad+2,c_black,c_black,0);
			draw_circle(_x,_y,_rad,0);
			draw_circle_colour(_x,_y,_hidrad,c_black,c_black,0);
			
			var _t = scribble("[scale,1.5][c_black][fnt_title]"+_letter);
			_t.align(fa_center,fa_middle);
			
			_t.draw(_x,_y);
		
		}
		
		if(steps>_maintime+55){
		var _press = "- Press Z to start -";
		if(steps%100<50){ _press=""; }
		
		if(wave[99]){_press = "- Press Z to start -"; if(steps%15<15/2){_press="";} 
		
		   if(wave[98]<2){wave[98]+=0.025;}
		
		}
		if(wave[98]<2){
			
		var _txt = scribble("[scale,1][fnt_out]"+_press);
		_txt.align(fa_center,fa_middle);
		_txt.draw(room_width/2,room_height-50);
		}else{black=1*room_speed; video_close(); pag=1;}
		
		

		}
		
		var _inst = scribble("[scale,0.5][fnt_out]By Electro");
	   _inst.align(fa_left,fa_bottom);
	   _inst.draw(PAD+6,room_height-PAD-6);
	   
	   var _logo = scribble("[scale,0.5][fnt_out]Made for");
		_logo.align(fa_right,fa_bottom);
		_logo.draw(
		room_width-PAD-6-sprite_get_width(spr_jamlogo)-6,
		room_height-PAD-6);
		
		draw_sprite(spr_jamlogo,0,room_width-PAD-6-sprite_get_width(spr_jamlogo)/2,
		room_height-PAD-6-sprite_get_height(spr_jamlogo)/2);
	
	break;
	
	case 1:
	
	   if(!audio_is_playing(snd_tutorial)){ audio_play_sound(snd_tutorial,10,1); }
	
	   var _on = 1;
	   if(steps%60<60/2){_on=0;}
	
	   var _txt = scribble(
	    "[scale,1]INSTRUCTIONS\n[scale,0.5]\nRotate the wires and avoid the dangers.\n"
		+"To win, you have to connect one side of the little guy with his opposite side.\n"
		+"Cables without energy will be empty, while cables with energy will be filled."
		+"\n\nUse ARROWS to move through the level and Z to rotate a wire"
		+"\n\n\n\n[scale,1]Press Z to continue");
		
		_txt.fit_to_box(room_width-30,room_height*5);
		_txt.align(fa_center,fa_top);
		_txt.draw(room_width/2,15);
		
		if(keyboard_check_pressed(ord("Z"))){
			audio_stop_sound(snd_tutorial);
			black=1*room_speed; pag=2;
		}
		
		
		
	
	break;
	
	case 10:
	
	   if(!audio_is_playing(snd_tutorial)){ audio_play_sound(snd_tutorial,10,1); }
	   
	   var _txt = scribble(
	   "[scale,1]THANK YOU FOR PLAYING\n[scale,0.5]"+
	   "\nThis game might be updated in the future with new levels and difficulties, so"
	   +" make sure to follow me on Itch to recieve updates when they come!\n"
	   +"And also make sure to check out and rate other games from the jam!"
	   +"\n\n\nPress Z to return to the game\n\nPress ESC to exit the game");
	   
	   
	   _txt.align(fa_center,fa_top);
	   _txt.fit_to_box(room_width-30,room_height*5);
	   _txt.draw(room_width/2,15);
	   
	   var _img=0;
	   if(obj_controller.steps%60>30){ 
		   
		   _img=1; 
		   
		   for(var i=0; i<360; i+=360/8;){
			   							
				var _angle = i;
				var _dist = 12*2;
							
				var _x = room_width/2 + lengthdir_x(_dist,_angle);	
				var _y = room_height-PAD-40 + lengthdir_y(_dist,_angle);
							
				var _rad = 1.5*2;
							
				draw_set_color(c_black);
				draw_rectangle(_x-(_rad+1),_y-(_rad+1),_x+(_rad+1),_y+(_rad+1),0);
							
				draw_set_color(c_white);
				draw_rectangle(_x-_rad,_y-_rad,_x+_rad,_y+_rad,0);			   
			   
		   }
		   
	   }
	   draw_sprite_ext(spr_player,_img,room_width/2,room_height-PAD-40,2,2,0,c_white,1);
	   
	   if(keyboard_check_pressed(ord("Z"))){
		  audio_stop_sound(snd_tutorial);
		  black=1*room_speed; pag=2; 
	   }
	   
	   if(keyboard_check_pressed(vk_escape)){game_end();}
	
	break;
	
	case 2:
	
	   if(!audio_is_playing(snd_levelselect)){ audio_play_sound(snd_levelselect,10,1); }
	
	   var _txt = scribble("SELECT A LEVEL");
	   
	   _txt.align(fa_center,fa_top);
	   _txt.draw(room_width/2,15);
	   
	   var _pos = [ [60,82],[115,110],[190,90],[250,123],[320,88] ];
	   
	   var _unlocked = 0;
	   var _beat = 0;
	   
	   for(var a=0; a<levelmax; a++){
		   
		   if(!filedata[? "Level"+string(a)]){continue;}
		   
		   _unlocked++;
		   if(filedata[? "Level"+string(a)]==2){_beat++;}
		   
		   var _x = _pos[a][0];
		   var _y = _pos[a][1];
		   
		   _x+=2*sin((current_time+_x*a*10)*0.001);
		   _y+=2*sin((current_time+_y*a*10)*0.0015);
		   
		   if(a<levelmax-1 && filedata[? "Level"+string(a+1)]){
			
			  var _fx = _pos[a+1][0];
			  var _fy = _pos[a+1][1];
			  
			  for(var i=0; i<5; i++){
				  
				  var _rx = _x+(_fx-_x)/(5/i);
				  var _ry = _y+(_fy-_y)/(5/i);
				  
				  draw_circle(_rx,_ry,4,0);
				  
			  }
			
		   }
		   
		   var _rad = 12;
		   
		   if(levelpos==a){
			   _rad += sin(current_time*0.002);
			   
			   draw_circle(_x,_y,_rad+3,1);
		   }
		   
		   draw_circle(_x,_y,_rad,0);	
		   
		   if(filedata[? "Level"+string(a)]==2){
		   	  draw_circle_color(_x,_y,_rad/2,c_black,c_black,0);		   
		   }
		   
	   }
	   
	   var _perc = _beat*100 / levelmax;
	   var _txt = scribble("[scale,1]"+string(_perc)+"%");
		   _txt.align(fa_center,fa_bottom);
		   _txt.draw(room_width/2,room_height-PAD-6);
	   
	   if(keyboard_check_pressed(vk_right)){
		  levelpos++; if(levelpos>=_unlocked){levelpos=0;}   
	   }
	   if(keyboard_check_pressed(vk_left)){
		  levelpos--; if(levelpos<0){levelpos=_unlocked-1;}   
	   }
	   
	   if(keyboard_check_pressed(ord("Z"))){
		  
		  audio_stop_sound(snd_levelselect);
		  with(instance_create_layer(x,y,layer,obj_level)){
			   LEVEL = other.levelpos+1;  
		  }
		  pag=999;black=1.5*room_speed;
		  
	   }
	   
	   var _inst = scribble("[scale,1]Z[scale,0.5] start");
	   _inst.align(fa_left,fa_bottom);
	   _inst.draw(obj_controller.PAD+6,room_height-obj_controller.PAD-6);
	
	break;

}
