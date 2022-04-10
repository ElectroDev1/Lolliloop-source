function coverlevel(){
			var scale = SCALE; 

			var W = levelstruct.gridW;
			var H = levelstruct.gridH;

			var cellW=18*scale;
			var cellH=18*scale;

			var realW = cellW*W;
			var realH = cellH*H;

			var startX=room_width/2 - realW/2-1;
			var startY=room_height/2 - realH/2-1;
			
			with(obj_levelcover){
				
			     if(hsp>0 && x+hsp>=startX+realW) || (hsp<0 && x-hsp<=startX){hsp*=-1;}
			     if(vsp>0 && y+vsp>=startY+realH) || (vsp<0 && y-vsp<=startY){vsp*=-1;}
				 
				 x=clamp(x,startX,startX+realW);
				 y=clamp(y,startY,startY+realH);
				 
				 offsetX=startX;
				 offsetY=startY;
	
			}
			
			if(!surface_exists(topsurf)){
			
			   topsurf = surface_create(realW,realH);
				
			}
			else{
			
			   surface_set_target(topsurf);
			   
			   draw_clear(c_black);
			   
			   gpu_set_blendmode(bm_subtract);
			   with(obj_levelcover){event_user(0);}
			   gpu_set_blendmode(bm_normal)
			   
			   surface_reset_target();
			   
			   if(!obj_level.win){draw_surface(topsurf,startX,startY);}
			
			}

}