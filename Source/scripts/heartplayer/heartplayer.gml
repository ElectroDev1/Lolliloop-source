function heartplayer(){
			var scale = SCALE; 

			var W = levelstruct.gridW;
			var H = levelstruct.gridH;

			var cellW=18*scale;
			var cellH=18*scale;

			var realW = cellW*W;
			var realH = cellH*H;

			var startX=room_width/2 - realW/2-1;
			var startY=room_height/2 - realH/2-1;
var _off=[9,9];
if(scale==1){_off=[9,8.5];}
			
draw_sprite_ext(spr_heart,0,startX+(cellW+1)*Select[0]+_off[0]*scale,
startY+(cellH+1)*Select[1]+_off[1]*scale
,scale,scale,0,c_white,1
);
			
}