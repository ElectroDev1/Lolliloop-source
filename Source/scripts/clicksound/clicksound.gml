function clicksound(){
randomize();
var _snd = asset_get_index("snd_button"+string(irandom(3)+1));

if(audio_is_playing(_snd)){
  _snd = asset_get_index("snd_button"+string(irandom(3)+1));
  
}

audio_play_sound(_snd,3,0);


}