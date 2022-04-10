//Adjust speed to delta time
hspeed=hsp*obj_controller.delta_multiplier;
vspeed=vsp*obj_controller.delta_multiplier;

//Set particle regions
part_emitter_region(sys,
emit_start,startlaser[0]-2,startlaser[0]+2
,startlaser[1]-2,startlaser[1]+2,ps_shape_ellipse,ps_distr_gaussian
)


part_emitter_region(sys,
emit_end,endlaser[0]-2,endlaser[0]+2
,endlaser[1]-2,endlaser[1]+2,ps_shape_ellipse,ps_distr_gaussian
)

//State handler
if(!state){
	
	if(timer_normal>0){ timer_normal-=obj_controller.delta_multiplier; }
	else{ timer_laser=otimer_laser; instance_activate_object(mask); state=1; }
		
}else{

    part_emitter_burst(sys,emit_start,type,1);
    part_emitter_burst(sys,emit_end,type,1);

    if(timer_laser>0){ timer_laser-=obj_controller.delta_multiplier; }
	else{ timer_normal=otimer_normal; instance_deactivate_object(mask) state=0; }
	
}

//Deactivate laser if on win state
if(instance_exists(obj_level) && obj_level.win){state=0; hspeed=0; vspeed=0;}


