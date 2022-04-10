//Draw laser
if(state){
	
	   var _r = irandom(3);
	  
	  draw_set_colour(c_black);
	  draw_line_width(startlaser[0],startlaser[1],endlaser[0],endlaser[1],3+_r+3);  
	  draw_set_colour(c_white);
	  draw_line_width(startlaser[0],startlaser[1],endlaser[0],endlaser[1],3+_r);   
}

//Draw laser bases
if(!mode){
  
   mask.x=startlaser[0];
   mask.y=startlaser[1]-3;   
   mask.image_xscale=endlaser[0]-startlaser[0];
   mask.image_yscale=6;
  
   draw_sprite_ext(spr_laserbase,0,startlaser[0],startlaser[1],image_xscale,image_yscale,0,c_white,1);
   draw_sprite_ext(spr_laserbase,0,endlaser[0],endlaser[1],image_xscale,image_yscale,180,c_white,1);

}else{

   mask.x=startlaser[0]-3;
   mask.y=startlaser[1];   
   mask.image_yscale=endlaser[1]-startlaser[1];
   mask.image_xscale=6;
   
   draw_sprite_ext(spr_laserbase,0,startlaser[0],startlaser[1],image_xscale,image_yscale,-90,c_white,1);
   draw_sprite_ext(spr_laserbase,0,endlaser[0],endlaser[1],image_xscale,image_yscale,90,c_white,1);

}
