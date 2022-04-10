//Adjust speed to delta time
speed = ospeed*obj_controller.delta_multiplier;

//Destroy enemy
switch(direction){

       case 0: if(x>room_width+20){ instance_destroy(); } break;
	   case 270: if(y>room_height+20){ instance_destroy(); } break;
	   case 180: if(x<-20){instance_destroy(); } break;
	   case 90: if(y<-20){instance_destroy(); } break;

}

if(obj_controller.black>0){instance_destroy();}
