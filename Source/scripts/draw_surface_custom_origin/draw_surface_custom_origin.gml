function draw_surface_custom_origin(surf,x,y,xoffset=0,yoffset=0,xscale=1,yscale=1,rot=0,col=c_white,alpha=1,w=-1,h=-1){

/*
This function lets you draw a surface with a custom origin, instead of
having to use the default top-left origin
*/

//Get world matrix
var _mat = matrix_get(matrix_world);

//Build surface matrix
var new_mat = matrix_build(x, y, 0, 0, 0, rot,xscale,yscale,1);

//Set the new matrix and draw the surface with it
matrix_set(matrix_world, new_mat);

if(w<=0 || h<=0){
draw_surface_ext(surf, -xoffset, -yoffset,1,1,0,col,alpha);
}else{
draw_surface_stretched_ext(surf,-xoffset, -yoffset,w,h,col,alpha)	
}

matrix_set(matrix_world, _mat);

}