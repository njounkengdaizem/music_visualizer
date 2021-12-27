///Credit: https://youtu.be/2lZZhTf5uHY 

//Import library to help with 3D display
// The PeasyCam Processing library provides an easy-peasy camera for 3D sketching.

import peasy.*;

//initialize class PeasyCam
PeasyCam drum;
import ddf.minim.*;


//Library makes it easier to add audio sounds to processing projects
//Learn more from http://artandtech.aalto.fi/wp-content/uploads/2012/06/minim.pdf

Minim minim;
AudioPlayer player;

void setup(){
 //Typical size declaration, however, P3D is used as a render here
 // Check out page 271  of learning processing for more info
  size(800, 800, P3D);
  smooth(8);
  drum = new PeasyCam(this,180);
  //This 2 lines add constraints for the 3D
  drum.setMinimumDistance(50);
  drum.setMaximumDistance(500);
  
  //Creating a new instance of Minim
  minim = new Minim(this);
  player = minim.loadFile("music.mp3");
  player.play();
}

void draw(){
  //Display
  background(0);
  rotateY(.5);
  rotateZ(.5);
  
 for (int i =0; i<player.bufferSize()-1; i++){
   rotate(50+player.right.get(i)/100);
   
   //The pushMatrix() function saves the current coordinate system to the stack 
   pushMatrix();
     fill(#00fff7,100);
  //popMatrix() restores the prior coordinate system
     popMatrix();
     
     strokeWeight(.5+player.right.get(i)); //Weight. Try messing around with this. 
     stroke(0);
     
     box(10, 10, 55 + player.right.get(i)*200);//Smaller box
     box(10, 55 + player.right.get(i)+50, 10);//Larger Box Note: You can use different shapes   
 }

}

  
