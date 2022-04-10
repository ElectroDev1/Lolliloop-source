with(obj_controller){init_levels(); event_user(0);}

Select=[0,0];

moves=0;

win=0;


LEVEL = obj_controller.levelpos+1;
var _struct = variable_struct_get(obj_controller.levels,"level"+string(LEVEL));
levelstruct=struct_copy(_struct);

var W = levelstruct.gridW;
var H = levelstruct.gridH;

SCALE = levelstruct.gamescale;

SCRIPT = levelstruct.levelfunc;

wirelength = W*H-1;

wireconn = 0;

playerpos = [0,0];


for(var a=0; a<W; a++){
	   for(var b=0; b<H; b++){

		   if(levelstruct.grid[a,b][0] == Pp.wall){ wirelength--; }
		   if(levelstruct.grid[a,b][0] == Pp.player){ playerpos = [a,b]; }
	   }
}

wirelength=max(wirelength,0);

if(levelstruct.maxlength!=-1){wirelength=levelstruct.maxlength}

for(var a=0; a<W*H; a++){
energygrid[a] = array_create(W*H,0);	
}

connect = function(pos,mypos,givedir=0){
   
   var _pos = levelstruct.grid[pos[0],pos[1]];
   var _type = _pos[0];

   if(_type==Pp.wall){return;}
   
   if(_type==Pp.player){
	   
	   show_debug_message("Connecting player")
	  switch(levelstruct.startdir){
		     case 0: //Get from left
			   if(pos[1]!=mypos[1]){return;} if(pos[0]!=mypos[0]+1){return;}
			 break;
			 case 1: //Get from top
			   if(pos[0]!=mypos[0]){return;} if(pos[1]!=mypos[1]+1){return;}
			 break;
			 case 2: //Get from right
			   if(pos[1]!=mypos[1]){return;} if(pos[0]!=mypos[0]-1){return;}
			 break;
			 case 3: //Get from bottom
			   if(pos[1]!=mypos[1]){return;} if(pos[1]!=mypos[1]-1){return;}
			 break;
	  }
	  show_debug_message("Could connect player")
	
   }
   
   //Straight wall
   if(_type==Pp.wstraight){
	   
	   var _mode = _pos[1];
	  
	  //Horizontal mode
	  if(_mode==0){

		 if(givedir==1){return;}
		 if(pos[1]!=mypos[1]){ show_debug_message("Y axis not shared"); return; }  //No match
		 if(mypos[0]!=pos[0]-1 && mypos[0]!=pos[0]+1){ show_debug_message("No connection") return; } //  X-X
		 
	  }else{
		if(givedir==0){return;}

		if(pos[0]!=mypos[0]){ show_debug_message("X axis not shared"); return; }  //No match
		if(mypos[1]!=pos[1]-1 && mypos[1]!=pos[1]+1){ show_debug_message("No connection"); return; } 
		
	  }
		 
   }
   
   if(_type==Pp.wangle){
	  
	  var _mode = _pos[1];
	  
	  switch(_mode){
		
		     case 1: //Bottom and right
			    
				
				if(!givedir){
				if(mypos[0]!=pos[0]+1 || mypos[1]!=pos[1]){ show_debug_message("Cannot connect to the right"); return; }
				}else{
				if(mypos[1]!=pos[1]+1 || mypos[0]!=pos[0]){ show_debug_message("Cannot connect to the bottom"); return; }
				}
				
			 break;
			 
			 case 2: //Bottom and left
			 

				if(!givedir){
				if(mypos[0]!=pos[0]-1 || mypos[1]!=pos[1]){ show_debug_message("Cannot connect to the left"); return; }
				}else{
				if(mypos[1]!=pos[1]+1 || mypos[0]!=pos[0]){ show_debug_message("Cannot connect to the bottom"); return; }
				}
			 break;
			 
			 case 3: //Top and left
			 

			   if(!givedir){
			   if(mypos[0]!=pos[0]-1 || mypos[1]!=pos[1]){ show_debug_message("Cannot connect to the left"); return; }
			   }else{
			   if(mypos[1]!=pos[1]-1 || mypos[0]!=pos[0]){ show_debug_message("Cannot connect to the top"); return; }
			   }
			 break;
			 
			 case 0: //Top and right
			 

			  if(!givedir){
			  if(mypos[0]!=pos[0]+1 || mypos[1]!=pos[1]){ show_debug_message("Cannot connect to the right"); return; }
			  }else{
			  if(mypos[1]!=pos[1]-1 || mypos[0]!=pos[0]){ show_debug_message("Cannot connect to the top"); return; }
			  }
			 break;
		
	  }
	  
   }   
   
   
   energygrid[pos[0],pos[1]]=1;
   
}

UpdateWire = function (){
		
	
   //Get direction
   var _dir1 = levelstruct.startdir;
   
   var W = levelstruct.gridW;
   var H = levelstruct.gridH;
   
   var _px = playerpos[0];
   var _py = playerpos[1];
   for(var a=0; a<W; a++){
   for(var b=0; b<H; b++){
	   energygrid[a,b]=0;
   }
   }
 
   
   //Go through the cables

	   wireconn=0;
	   switch(_dir1){
	   case 0: 
		 connect([_px+1,_py],[_px,_py])
	   break;
	   case 1: connect(levelstruct.order[0],[_px,_py],1);  break;
   }
   for(var i=0; i<array_length(levelstruct.order); i++){
	   
	       var a = levelstruct.order[i][0]
	       var b = levelstruct.order[i][1]

		
		   var _pos = [a,b];
		   var _type = levelstruct.grid[a,b][0];
		   
		   if(energygrid[a,b]==1){ if(_type!=Pp.player){wireconn++;}
		   
		   
		   switch(_type){
			 
			      case Pp.wstraight:

				      var _mode = levelstruct.grid[a,b][1];

					  if(!_mode){
						 if(a>0){ connect([a-1,b],_pos); }
						 if(a<W-1){ connect([a+1,b],_pos); }
					  }else{
						 if(b>0){ connect([a,b-1],_pos,1); }
						 if(b<H-1){ connect([a,b+1],_pos,1); }
					  }
				  
				  break;
				  
				  case Pp.wangle:
				  
				     var _mode = levelstruct.grid[a,b][1];
					 
					 switch(_mode){
					
					   case 0://Top right
					   
					     if(a<W-1){ connect([a+1,b],_pos); }
						 if(b>0){ connect([a,b-1],_pos,1); }
					   
					   break;
					   
					   case 1://Bottom right
					   
					     if(a<W-1){ connect([a+1,b],_pos); }
						 if(b<H-1){ connect([a,b+1],_pos,1); }
					   
					   break;
					   
					   case 2://Bottom left

					     if(a>0){ connect([a-1,b],_pos); }
						 if(b<H-1){ connect([a,b+1],_pos,1); }
					   
					   break;
					   
					   case 3://Top left
					   
					     if(a>0){ connect([a-1,b],_pos); }
						 if(b>0){ connect([a,b-1],_pos,1); }
					   
					   break;
					
					 }
				  
				  break;
			
		   }
		   }   
	
   }
   
}

UpdateWire();

topsurf=-4;

switch(LEVEL){

    case 4:
	   repeat(3){
		   with(instance_create_depth(irandom(room_width),irandom(room_height),obj_level.depth-1,obj_levelcover)	
		    ){
			   vsp=choose(-1,1);
			   hsp=choose(-1,1);
			}
		}
	break;
	
	case 5:
	
	  laser[0] = instance_create_depth(0,0,depth-1,obj_laserbase).id; 
	  laser[1] = instance_create_depth(0,0,depth-1,obj_laserbase).id; 

	break;

}
