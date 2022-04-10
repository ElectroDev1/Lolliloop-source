function levelcreate() constructor
{
	gridW=3;
	gridH=3;
	gamescale=2;
	maxlength=-1;
	startdir=0;
	targetmoves=4;
	order=[[2,2],[2,1],[2,0],[1,0],[0,0],[0,1],[0,2],[1,2]];
	levelfunc = function(){
			  
	}
	grid[0,0] = [Pp.wangle,0];    grid[1,0]=[Pp.wstraight,0]; grid[2,0]=[Pp.wangle,0];
	grid[0,1] = [Pp.wstraight,1]; grid[1,1]=[Pp.wall];        grid[2,1]=[Pp.wstraight,0];
	grid[0,2] = [Pp.wangle,1];    grid[1,2]=[Pp.player];      grid[2,2]=[Pp.wangle,3];	
}

function init_levels(){
	
	
    levels = {
	
	    level1 : new levelcreate(),
	    level2 : new levelcreate(),
	    level3 : new levelcreate(),
	    level4 : new levelcreate(),
	    level5 : new levelcreate()
	
	}
	
	with(levels.level2){
		maxlength=17;

		gridW=6; gridH=4;startdir=1; gamescale=2;
		grid[0,0]=[Pp.wall];     grid[1,0]=[Pp.wangle,1]; grid[2,0]=[Pp.wstraight,0]; grid[3,0]=[Pp.wstraight,1]; grid[4,0]=[Pp.wstraight,0]; grid[5,0]=[Pp.wangle,0];
		grid[0,1]=[Pp.wangle,0]; grid[1,1]=[Pp.wangle,1]; grid[2,1]=[Pp.wangle,2]; grid[3,1]=[Pp.wangle,3]; grid[4,1]=[Pp.wall]; grid[5,1]=[Pp.wstraight,0];
		grid[0,2]=[Pp.wangle,0]; grid[1,2]=[Pp.wangle,2]; grid[2,2]=[Pp.player]; grid[3,2]=[Pp.wangle,1]; grid[4,2]=[Pp.wstraight,1]; grid[5,2]=[Pp.wangle,0];
		grid[0,3]=[Pp.wall];     grid[1,3]=[Pp.wangle,1]; grid[2,3]=[Pp.wangle,3]; grid[3,3]=[Pp.wall]; grid[4,3]=[Pp.wangle,0]; grid[5,3]=[Pp.wangle,2];

		order=[[2,3],[1,3],[1,2],[0,2],[0,1],[1,1],[1,0],[2,0],[3,0],[4,0],[5,0],[5,1],[5,2],[5,3],[4,3],[4,2],[3,2],[3,1],[2,1],[2,2]];
	}
	
	with(levels.level3){
		
		levelfunc=[enemyspawn,heartplayer];
		
		maxlength=-1;
		gridW=5; gridH=4; gamescale=2;
		maxlength=13;
grid[0,0]=[Pp.wangle,1];grid[1,0]=[Pp.wstraight,0];grid[2,0]=[Pp.wangle,1];grid[3,0]=[Pp.wstraight,0];grid[4,0]=[Pp.wangle,3];
grid[0,1]=[Pp.wangle,0];grid[1,1]=[Pp.wstraight,1];grid[2,1]=[Pp.wangle,2];grid[3,1]=[Pp.wangle,2];grid[4,1]=[Pp.wstraight,1];
grid[0,2]=[Pp.wstraight,1];grid[1,2]=[Pp.wangle,2];grid[2,2]=[Pp.player];grid[3,2]=[Pp.wstraight,0];grid[4,2]=[Pp.wangle,2];
grid[0,3]=[Pp.wangle,3];grid[1,3]=[Pp.wangle,1];grid[2,3]=[Pp.wangle,0];grid[3,3]=[Pp.wangle,3];grid[4,3]=[Pp.wstraight,1];

order = [[3,2],[4,2],[4,1],[4,0],[3,0],[2,0],[2,1],[1,1],[0,1],[0,2],[0,3],[1,3],[1,2]];
	}
	
	with(levels.level4){
		
		maxlength=-1;
		gridW=7; gridH=3;
		gamescale=2;
		
grid[0,0]=[Pp.wangle,0];grid[1,0]=[Pp.wstraight,1];grid[2,0]=[Pp.wstraight,1];grid[3,0]=[Pp.player];grid[4,0]=[Pp.wangle,2];grid[5,0]=[Pp.wall];grid[6,0]=[Pp.wstraight,1];
grid[0,1]=[Pp.wstraight,0];grid[1,1]=[Pp.wangle,0];grid[2,1]=[Pp.wstraight,0];grid[3,1]=[Pp.wangle,1];grid[4,1]=[Pp.wstraight,1];grid[5,1]=[Pp.wstraight,0];grid[6,1]=[Pp.wangle,2];
grid[0,2]=[Pp.wangle,2];grid[1,2]=[Pp.wangle,3];grid[2,2]=[Pp.wstraight,0];grid[3,2]=[Pp.wangle,0];grid[4,2]=[Pp.wangle,0];grid[5,2]=[Pp.wstraight,0];grid[6,2]=[Pp.wall];
		maxlength=13;
		
		order = [[4,0],[4,1],[4,2],[3,2],[3,1],[2,1],[1,1],[1,2],[0,2],[0,1],[0,0],[1,0],[2,0]];
		
		levelfunc=[coverlevel];
				
	}
	
	
	with(levels.level5){
	
	     gridW=6;gridH=6; gamescale=1;
		 
grid[0,0]=[Pp.wall];grid[1,0]=[Pp.wstraight,0];grid[2,0]=[Pp.wstraight,1];grid[3,0]=[Pp.wangle,0];grid[4,0]=[Pp.wstraight,0];grid[5,0]=[Pp.wangle,2];
grid[0,1]=[Pp.wangle,3];grid[1,1]=[Pp.player];grid[2,1]=[Pp.wstraight,0];grid[3,1]=[Pp.wangle,1];grid[4,1]=[Pp.wstraight,0];grid[5,1]=[Pp.wangle,3];
grid[0,2]=[Pp.wstraight,1];grid[1,2]=[Pp.wangle,1];grid[2,2]=[Pp.wstraight,1];grid[3,2]=[Pp.wangle,0];grid[4,2]=[Pp.wall];grid[5,2]=[Pp.wangle,0];
grid[0,3]=[Pp.wstraight,0];grid[1,3]=[Pp.wstraight,1];grid[2,3]=[Pp.wall];grid[3,3]=[Pp.wangle,2];grid[4,3]=[Pp.wangle,3];grid[5,3]=[Pp.wstraight,1];
grid[0,4]=[Pp.wstraight,0];grid[1,4]=[Pp.wangle,2];grid[2,4]=[Pp.wstraight,0];grid[3,4]=[Pp.wangle,3];grid[4,4]=[Pp.wstraight,0];grid[5,4]=[Pp.wall];
grid[0,5]=[Pp.wangle,0];grid[1,5]=[Pp.wstraight,0];grid[2,5]=[Pp.wstraight,1];grid[3,5]=[Pp.wstraight,1];grid[4,5]=[Pp.wangle,1];grid[5,5]=[Pp.wangle,3];
		 
		 levelfunc=[heartplayer,laserlevel];
		 
		 order = [[2,1],[3,1],[3,2],[2,2],[1,2],[1,3],[1,4],[2,4],[3,4],[3,3],[4,3],[4,4],[4,5],[3,5],[2,5],[1,5],[0,5],[0,4],[0,3],[0,2],[0,1]];
	maxlength=21;
	}
	
	
    levelmax=0;
	
	while(variable_struct_exists(levels,"level"+string(levelmax+1))){
	      levelmax++;	
	}

    
	
   
	

}