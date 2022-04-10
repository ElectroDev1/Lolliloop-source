if(LEVEL<=obj_controller.levelmax-1){

   if(obj_controller.filedata[? "Level"+string(LEVEL)]==0){
	  
	  obj_controller.filedata[? "Level"+string(LEVEL)]=1; 
   }
   
   

}

instance_destroy(obj_laserbase);
instance_destroy(obj_hurtmask);

obj_controller.filedata[? "Level"+string(LEVEL-1)]=2;

with(obj_controller){event_user(0);}
obj_controller.black=2*room_speed;

switch(LEVEL){
default: obj_controller.pag=2; break;
case 5: obj_controller.pag=10; break;
}


instance_destroy();
