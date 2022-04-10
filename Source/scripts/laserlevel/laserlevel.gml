function laserlevel(){
			var scale = SCALE; 

			var W = levelstruct.gridW;
			var H = levelstruct.gridH;

			var cellW=18*scale;
			var cellH=18*scale;

			var realW = cellW*W;
			var realH = cellH*H;

			var startX=room_width/2 - realW/2-1;
			var startY=room_height/2 - realH/2-1;
			
	if(!instance_exists(laser[0]) || !instance_exists(laser[1]) ){ exit; }

   var _las0 = laser[0];
   
   if(_las0.vsp==0){_las0.vsp=choose(-0.5,0.5);}
   
   if(_las0.vsp>0 && _las0.y+_las0.sprite_height/2+_las0.vsp>=startY+realH)
   ||(_las0.vsp<0 && _las0.y-_las0.sprite_height/2+_las0.vsp<=startY){
	   _las0.vsp*=-1;   
   }
   
   _las0.y=clamp(_las0.y,startY+_las0.sprite_height/2,startY+realH-_las0.sprite_height/2);
   
   _las0.startlaser[1]=_las0.y;
   _las0.endlaser[1]=_las0.y;
   
   _las0.startlaser[0]=startX-cellW;
   _las0.endlaser[0]=startX+realW+cellW;
   
   
   var _las1 = laser[1];
   
   _las1.mode=1;
   
   if(_las1.hsp==0){_las1.hsp=choose(-0.5,0.5);}
   
   if(_las1.hsp>0 && _las1.x+_las1.sprite_width/2+_las1.hsp>=startX+realW)
   ||(_las1.hsp<0 && _las1.x-_las1.sprite_width/2+_las1.hsp<=startX){
	   _las1.hsp*=-1;   
   }
   
   _las1.x=clamp(_las1.x,startX+_las1.sprite_width/2,startX+realW-_las1.sprite_width/2);
   
   _las1.startlaser[0]=_las1.x;
   _las1.endlaser[0]=_las1.x;
   
   _las1.startlaser[1]=startY-cellH;
   _las1.endlaser[1]=startY+realH+cellH;
   
   
   var _col = collision_rectangle(
           startX+(cellW+1)*Select[0]+4*scale,
		   startY+(cellH+1)*Select[1]+4*scale,
		   startX+(cellW+1)*Select[0]+9*scale-4*scale,
		   startY+(cellH+1)*Select[1]+9*scale-4*scale,obj_hurtmask,1,1
   );
   
   if(_col && !win){ 
			
			   with(obj_controller){event_user(0); black=1*room_speed}

                instance_destroy(obj_laserbase);
			   instance_create_layer(x,y,layer,obj_level)
			   instance_destroy();
			   
			   with(obj_controller){ black=1*room_speed}
			
  }
   
   

}