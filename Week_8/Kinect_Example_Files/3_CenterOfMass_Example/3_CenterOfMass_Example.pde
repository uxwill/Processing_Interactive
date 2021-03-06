import SimpleOpenNI.*;
SimpleOpenNI kinect;


void setup(){
  size(640, 480);
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
  kinect.enableUser(SimpleOpenNI.SKEL_PROFILE_NONE);
  
}

void draw() {
  kinect.update();
  image(kinect.depthImage(), 0, 0);
  
  IntVector userList = new IntVector();
  kinect.getUsers(userList);
  
  for (int i=0; i<userList.size(); i++){
    int userId = userList.get(i);
    PVector position = new PVector();
    kinect.getCoM(userId, position);
    kinect.convertRealWorldToProjective(position, position);
    noFill();
    stroke(0, 0, 255);
    strokeWeight(10);
    ellipse(position.x, position.y, 25,25);
    if(userId == 1){
    fill(0, 255, 0);
    }
    if (userId == 2){
      fill(0,0,255);
    } 
    textSize(40);
    text(userId, position.x, position.y-20);
  }
}


