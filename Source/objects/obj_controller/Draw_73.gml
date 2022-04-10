
if(black>0){

   for(var a=0; a<360; a+=360/4;){
	
	   var _dist = 12+8*sin(current_time*0.01);
	   var _angle = a+current_time/8;
	   var _rad=6;
	   
	   var _x = room_width/2+lengthdir_x(_dist,_angle);
	   var _y = room_height/2+lengthdir_y(_dist,_angle);
	   
	   draw_set_colour(c_white);
	   draw_circle(_x,_y,_rad,0);
	
   }

}

var P=PAD;
var W=room_width;
var H=room_height;
var L=4;

draw_line_width(P,P,W-P,P,L);
draw_line_width(P,P,P,H-P,L);
draw_line_width(W-P-2,P,W-P-2,H-P,L);
draw_line_width(P,H-P-2,W-P,H-P-2,L);
