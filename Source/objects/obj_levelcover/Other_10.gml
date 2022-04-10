
var _radius = 25;

switch(shape){
  
       default:
	      draw_circle(x-offsetX,y-offsetY,_radius,0);
	   break;
	   
	   case 1:
	      draw_triangle(
		   x,y-_radius
		   ,x-_radius,y+_radius,x+_radius,y+_radius,0);
	   break;
	
}
