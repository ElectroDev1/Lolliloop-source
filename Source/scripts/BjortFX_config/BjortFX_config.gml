function BjortFX_config(){
/*

This script has everything you need to set up the BjörtFX shader to your needs!

BjörtFX was made by Zik;
https://twitter.com/ZIKBAKGURI

This edit was been made by Trixelized;
https://twitter.com/Trixelized

*/


// If the shader is enabled. You most likely want this to be true.
enabled = true;
	
// The main game width and height.
// This is the non-resized games' resolution in pixels, not the window resolution~!!
// if you want to set the actual window resolution, use window_set_size
screenWid = room_width;
screenHei = room_height;


// Disable things if things are too blurry for your taste.
// This does not affect performance!
doTexFilter = true;

// The CRT resolution multiplier!
// Keep this at 0 if you want the game to scale to the window width and height automatically.
// If set to 2, the CRT effect will be double the size compared to the game size~ etc.
// It is recommended to change this to something low if you are experiencing lag.
crtResMult = 0;


// The amount of colors in each color channel!
// Setting this to 4 will only allow 64 (4*4*4) colors to be displayed
// Setting this to 256 will disable this
crtColorAmt = 256;
	
	
// Here comes the fun part! All the values below should be messed around with!
// Change things until you think it looks just right, or just go wild!



// CRT Emulation
crtDistortion = 0.2; // sScreen distortion intensity
crtReflection = .25; // Border reflection intensity
crtShadowmask = .4; // Shadow mask intensity
crtScanline =0; // Scanline intensity
crtBleed = 0.1; // Bleed intensity
crtBleedSize = 4; // Bleed size
crtTint = 0.05; // Plasma effect intensity
crtVignette = 0.1; // Vignette intensity
crtFilmgrain = 0.15; // Film grain intensity
crtBrightness = 0.23; // Brightness adjustment
crtContrast = 1.0; // Contrast adjustment


// Specular Light
crtSpecularR = 0.9; // Red amount
crtSpecularG = 0.85/1; // Green amount
crtSpecularB = 1.0/1; // Blue amount

crtSpecularAmp = 0.20; // Specular light amount
crtSpecularOffX = 0.25; // Specular light offset x
crtSpecularOffY = -0.3; // Specular light offset y


// Final post processing FX
crtGlowFactor = 0.1; // Amount of glow (hard-capped at certain amount)
crtGlowTint = 20.5; // Colour tint amount of blur (like chromatic aberration)
crtBlurSize = 5; // Size of blur
crtBlurZoom = 1; // Zoom amount of blur



}