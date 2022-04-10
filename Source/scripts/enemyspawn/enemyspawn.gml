function enemyspawn(wait_time=120,enespd=1.75){

			var scale = SCALE; 

			var W = levelstruct.gridW;
			var H = levelstruct.gridH;

			var cellW=18*scale;
			var cellH=18*scale;

			var realW = cellW*W;
			var realH = cellH*H;

			var startX=room_width/2 - realW/2-1;
			var startY=room_height/2 - realH/2-1;
			
		   var _col = collision_rectangle(
		   startX+(cellW+1)*Select[0]+4*scale,
		   startY+(cellH+1)*Select[1]+4*scale,
		   startX+(cellW+1)*Select[0]+9*scale-4*scale,
		   startY+(cellH+1)*Select[1]+9*scale-4*scale,obj_enemy,0,0
		   );
		   
		   if(_col && !win){ 
			
			   with(obj_controller){event_user(0); black=1*room_speed}

                instance_destroy(obj_enemy);
			   instance_create_layer(x,y,layer,obj_level)
			   instance_destroy();
			   
			   with(obj_controller){ black=1*room_speed}
			
		   }
		   
		   var _incr = obj_controller.steps/60;
		   
		   if(obj_controller.steps%wait_time<=1+_incr && random(2)>0.25
		      && instance_number(obj_enemy)<3
		   ){
		      show_debug_message("Created enemy")
		    repeat(choose_weighted(1,0.8,2,0.2)){
				
			   var _dir = irandom(3);
			   var _probW = array_create(W,1/W);
			   _probW[Select[0]]=1/W/2;
			   var _eneX = choose_weighted(
			   0,_probW[0],1,_probW[1],2,_probW[2],3,_probW[3],4,_probW[4])
		   
			   var _probH = array_create(H,1/H);
			   _probH[Select[1]]=1/W/4;
			   var _eneY = choose_weighted(
			   0,_probH[0],1,_probH[1],2,_probH[2],3,_probH[3]);
			
			   switch(_dir){
				   
				   case 0://From left			  
			         var _fx = -20;
					 var _fy = startY+(cellH+1)*_eneY+9*scale;					 
			       break;
				   
				   case 1://From top			  
			         var _fx = startX+(cellW+1)*_eneX+9*scale;
					 var _fy = -20;					 
			       break;
				   
				   case 2://From right			  
			         var _fx = room_width+20;
					 var _fy = startY+(cellH+1)*_eneY+9*scale;					 
			       break;
				   
				   case 3://From bottom			  
			         var _fx = startX+(cellW+1)*_eneX+9*scale;
					 var _fy = room_height+20;					 
			       break;
			   
			   }
			   
			   
			   with(instance_create_depth(_fx,_fy,depth-1,obj_enemy))
					{
						direction = _dir*90; ospeed=enespd;
						image_xscale = scale; image_yscale=scale;
					}
										 			
		   
		   }
		   
		   
		}
		

}