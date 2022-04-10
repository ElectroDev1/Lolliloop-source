mode=0; //Horizontal or vertical

//Laser coordinates
startlaser=[0,0];
endlaser=[0,0]

//Timers
otimer_normal=3*room_speed+irandom(60);
otimer_laser=1*room_speed+irandom(20);

timer_normal=otimer_normal;
timer_laser=0;

//If the laser should appear
state=0;

//Create hurtmask
mask = instance_create_depth(x,y,depth,obj_hurtmask);
instance_deactivate_object(mask);


hsp=0;
vsp=0;

//Initialize particles
sys=part_system_create();

emit_start=part_emitter_create(sys);
emit_end=part_emitter_create(sys);
part_system_depth(sys,depth-1)
type=setParticleType(sys,[ 1,1,1 ],0,[ 16777215,16580605,16777215 ],[ 1,1 ],[ 0,90 ],[ 0.01,0.07,-0.00,0 ],[ 0,359,0,0 ],[ 0,359,0,0,1 ],[ 0.50,0.75,0,0 ],[ 5,15 ],[ 0,"spr_example",0,0,0 ],1)
