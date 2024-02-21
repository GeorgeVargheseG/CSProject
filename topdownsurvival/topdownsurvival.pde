float x;
float y;
float vx;
float vy;
float ax,ay;
float friction;

void setup(){
  size(640,480);
  x= width/2;
  y= height/2;
  
  ax = 0;
  ay = 0;
  friction = .9;
  
}

void draw(){
  background(0,0,0);
  circle(x,y,40);
  vx += ax;
  vy += ay;
  x += vx;
  y += vy;
  vx *= friction;
  vy *= friction;
  
  if (x < 0) {
    x = width;
  } else if (x > width) {
    x = 0;
  } else if (y < 0) {
    y = height;
  } else if (y > height) {
    y = 0;
  }
}

void keyPressed(){
  if(key == 'w'){
    ay = -.8;
  }
  else if(key == 's'){
    ay = .8;
  }
  else if(key == 'd'){
   ax = .8;
  }
  else if(key == 'a'){
    ax = -.8;
  }
}

void keyReleased(){
  if(key == 'w'){
    ay = 0;
  }
  else if(key == 's'){
    ay = 0;
  }
  else if(key == 'd'){
    ax =0;
  }
  else if(key == 'a'){
    ax = 0;
  }
}
