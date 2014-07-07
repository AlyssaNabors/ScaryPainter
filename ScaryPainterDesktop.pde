//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies
//Modifications by Alyssa Nabors, July 2014

//Photo from: http://www.freedigitalphotos.net/images/Education_g314-Empty_Room_Wth_Many_Chairs_p45682.html
//Audio Track 1 from: http://freesound.org/people/abcopen/sounds/166207/
//Audio Track 2 from: http://freesound.org/people/MadamVicious/sounds/218184/


Maxim maxim;
AudioPlayer player;
AudioPlayer player2;
PImage img;
int counter = 0;
int secret_x = 250;
int secret_y = 200;
boolean up = true;

void setup()
{
  size(400, 239);
  maxim = new Maxim(this);
  player = maxim.loadFile("classroom.wav");
  player.setLooping(true);
  player2 = maxim.loadFile("girl-crying.wav");
  player2.setLooping(true);
  player.volume(0.50);
  player2.volume(0);
  background(0);
  rectMode(CENTER);
  img = loadImage("classroom.jpg");

}

void draw()
{
//  
}

void mouseDragged()
{
  player.play();
  player2.play();

  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 0, 10);
  //float lineWidth = map(speed, 0, 10, 10, 1);
  //lineWidth = constrain(lineWidth, 0, 10);
  
  noStroke();
  fill(0, alpha);
  if(up){
    tint(255, counter);
    image(img, 0, 0);
  }
  else
    rect(width/2, height/2, width, height);
  
  cycleTint();
  
  int nearToSecret = distance(mouseX, mouseY);
  
  if(nearToSecret > 300 && nearToSecret < 400)
  {
    player2.volume(0);
  }
  if(nearToSecret > 200 && nearToSecret < 300)
  {
    player2.volume(0.10);
  }
  if(nearToSecret > 100 && nearToSecret < 200)
  {
    player2.volume(0.30);
  }
  if(nearToSecret > 50 && nearToSecret < 100)
  {
    player2.volume(0.50);
    player.volume(0.25);
  }
  if(nearToSecret > 5 && nearToSecret < 50)
  {
    player2.volume(0.60);
    player.volume(0.10);
  }
  if(nearToSecret > 0 && nearToSecret < 5)
  {
    player2.volume(0.60);
    player.volume(0);
  }
  if(nearToSecret == 0)
  {
    player2.volume(0);
    player.volume(0);
  }
}

void cycleTint()
{
  if(up && counter < 25){
    counter++;
  }
  else {
    if(up)
    {
      up = false;
      counter--;
    }
    else if (counter == -100)
    {
      up = true;
      counter++;
    }
    else {
      counter--;
    }
  }
}

int distance(int mouse_x, int mouse_y){
  return (int) sqrt(sq(secret_x - mouse_x)+sq(secret_y - mouse_y));
}

void mouseReleased()
{
  player2.ramp(0.,1000);      
}

