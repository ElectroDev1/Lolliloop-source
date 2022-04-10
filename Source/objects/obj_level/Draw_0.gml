if(obj_controller.black>0){exit;}

if(!audio_is_playing(snd_title)){ audio_play_sound(snd_title,2,true); }

var leveldata = obj_controller.filedata[? "Level"+string(LEVEL-1)];

var scale = levelstruct.gamescale;

var W = levelstruct.gridW;
var H = levelstruct.gridH;

var cellW=18*scale;
var cellH=18*scale;

var realW = cellW*W;
var realH = cellH*H;

var startX=room_width/2 - realW/2-1;
var startY=room_height/2 - realH/2-1;

draw_rectangle_color(startX,startY,startX+realW+1,startY+realH+1,c_black,c_black,c_black,c_black,0);

if(scale==2){draw_rectangle(startX,startY,startX+realW+1,startY+realH+1,1);}
else{draw_rectangle(startX,startY,startX+realW+2,startY+realH+2,1);}


for(var a=0; a<W; a++){

    for(var b=0; b<H; b++){
		
	    //Base
	    var cellX = startX+(cellW+1)*a;
		var cellY = startY+(cellH)*b;
		
		draw_set_color(c_white);
		
		var _id = levelstruct.grid[a,b];
		
		var _sprX = cellX+9*scale;
		var _sprY = cellY+9.5*scale;
		
		switch(_id[0]){
		
		       case Pp.wall:
			      draw_sprite_ext(spr_wall,0,_sprX,_sprY,scale,scale,0,c_white,1);
			   break;
			   
			   case Pp.player:
			      draw_set_color(c_white);
				  
				  draw_sprite_ext(spr_player,win,_sprX,_sprY,scale,scale,0,c_white,1);
				  
			      switch(levelstruct.startdir){
					     default: draw_line_width(_sprX+5*scale,_sprY,_sprX+8*scale,_sprY,8);
						          draw_set_color(c_black);
								  draw_line_width(_sprX-8*scale,_sprY,_sprX-5*scale,_sprY,8);
						 break;
					     case 1: draw_line_width(_sprX,_sprY+5*scale,_sprX,_sprY+8*scale,8);
						         draw_set_color(c_black);
								 draw_line_width(_sprX,_sprY-8*scale,_sprX,_sprY-5*scale,8);
						 break;
					     case 2: draw_line_width(_sprX-8*scale,_sprY,_sprX-5*scale,_sprY,8);
						         draw_set_color(c_black);
								 draw_line_width(_sprX+5*scale,_sprY,_sprX+8*scale,_sprY,8);
						 break;
					     case 3: draw_line_width(_sprX,_sprY-8*scale,_sprX,_sprY-5*scale,8);
						         draw_set_color(c_black);
								 draw_line_width(_sprX,_sprY+5*scale,_sprX,_sprY+8*scale,8);
						 break;
				  }
			   
			      
				  
				  
				  
			   break;
			   
			   case Pp.wstraight:
			      draw_sprite_ext(spr_pipes,0,_sprX,_sprY,scale,scale,-90*_id[1],c_white,1);
			   break;
			   
			   case Pp.wangle:
			      draw_sprite_ext(spr_pipes,1,_sprX,_sprY,scale,scale,-90*_id[1],c_white,1);
			   break;
		
		}
		
		if(energygrid[a,b])&&(_id[0]!=Pp.player){
		   	draw_sprite_ext(spr_energy,0,_sprX,_sprY,scale,scale,0,c_white,1);
		}
		
		
	}

	
}

var _off=[9,9];
if(scale==1){_off=[9,8.5];}

draw_sprite_ext(spr_cursor,0,startX+(cellW+1)*Select[0]+_off[0]*scale,
startY+(cellH+1)*Select[1]+_off[1]*scale
,scale,scale,0,c_white,1
);

if(keyboard_check_pressed(vk_right)){ Select[0]++; if(Select[0]>=W){Select[0]=0;} }
if(keyboard_check_pressed(vk_left)){ Select[0]--; if(Select[0]<0){Select[0]=W-1;} }

if(keyboard_check_pressed(vk_down)){ Select[1]++; if(Select[1]>=H){Select[1]=0;} }
if(keyboard_check_pressed(vk_up)){ Select[1]--; if(Select[1]<0){Select[1]=H-1;} }

if(!win)&&(keyboard_check_pressed(ord("Z"))){
		
		   var _posid = levelstruct.grid[Select[0],Select[1]];
		
		   switch(_posid[0]){
			
			      case Pp.wstraight: _posid[1]=!_posid[1]; moves++; UpdateWire(); break;
			      case Pp.wangle: _posid[1]++; if(_posid[1]>3){_posid[1]=0;} moves++; UpdateWire(); break;
			
		   }
		   
		   
		
}

if(win){
if(obj_controller.steps%60<30){				
	for(var i=0; i<360; i+=360/8;){
		
		var cellX = startX+(cellW+1)*playerpos[0];
		var cellY = startY+(cellH)*playerpos[1];
		
		var _sprX = cellX+9*scale;
		var _sprY = cellY+9.5*scale;
							
		var _angle = i;
		var _dist = 12*scale;
							
		var _x = _sprX + lengthdir_x(_dist,_angle);	
		var _y = _sprY + lengthdir_y(_dist,_angle);
							
		var _rad = 1.5*scale;
							
		draw_set_color(c_black);
		draw_rectangle(_x-(_rad+1),_y-(_rad+1),_x+(_rad+1),_y+(_rad+1),0);
							
		draw_set_color(c_white);
		draw_rectangle(_x-_rad,_y-_rad,_x+_rad,_y+_rad,0);
		
		
	}
}			
}

if(win==0 && wireconn>=wirelength && energygrid[playerpos[0],playerpos[1]]){
 obj_controller.steps=0; alarm[0]=1.5*room_speed; win=1;	
}


var _connected = scribble("[scale,1]"+string(wireconn)+"/"+string(wirelength));
//_connected.draw(obj_controller.PAD+6,obj_controller.PAD+6);

var _startdir = "Right";

switch(levelstruct.startdir){
       case 1: _startdir = "Bottom"; break;
	   case 2: _startdir = "Left"; break;
	   case 3: _startdir = "Top"; break;
}

var _txt = scribble("[scale,0.5]Dir. [scale,1]"+_startdir);
_txt.align(fa_left,fa_bottom);
_txt.draw(obj_controller.PAD+6,room_height-obj_controller.PAD-6);

var _atxt = scribble("[scale,1]"+string(Select[0])+"|"+string(Select[1])+"[scale,0.5] Pos\n\n[scale,1]R[scale,0.5] retry\n[scale,1]E[scale,0.5]  exit");
_atxt.align(fa_right,fa_top);
_atxt.draw(room_width-obj_controller.PAD-6,obj_controller.PAD+6);

   var _mtxt = scribble("[scale,1]"+string(moves)+"/"+string(levelstruct.targetmoves)+
              "\n[scale,0.5]Moves");
	_mtxt.align(fa_right,fa_bottom);
	//_mtxt.draw(room_width-obj_controller.PAD-6,room_height-obj_controller.PAD-6);
	
var _ltxt = scribble("[scale,1]Level "+string(LEVEL));
_ltxt.align(fa_center,fa_top);
_ltxt.draw(room_width/2,obj_controller.PAD+6);


if(keyboard_check_pressed(ord("R"))){
   with(obj_controller){event_user(0);}
    

    instance_destroy(obj_enemy);
	instance_destroy(obj_laserbase);
   
   instance_create_layer(x,y,layer,obj_level)
   instance_destroy();
}

if(keyboard_check_pressed(ord("E"))){

   with(obj_controller){event_user(0);}
   obj_controller.black=2*room_speed;
   obj_controller.pag=2;
   instance_destroy(obj_laserbase);
   instance_destroy();

}

if(is_array(SCRIPT)){
   for(var a=0; a<array_length(SCRIPT); a++){
	   script_execute(SCRIPT[a]);   
   }
}else{
script_execute(SCRIPT);
}
