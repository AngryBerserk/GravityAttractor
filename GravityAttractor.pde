Mover[] movers;
Mover[] attractors;

void setup(){
 size(800,600);
 //fullScreen();
 movers = new Mover[10];
 for (int i=0; i<movers.length; i++){ 
   movers[i] = new Mover(random(width), random(height /2, height), random(10,20));
 }
 attractors = new Mover[10];
 for (int i=0; i<attractors.length; i++){ 
   attractors[i] = new Mover(20 + random(width-40), 20 + random(height-40), random(100, 200));
 }
 background(255);
 colorMode(RGB);
}

void draw(){
  //background(255, 0.5);
  //attractor.draw();
  fill(255, 255, 255, 5);
  rect(0,0,width, height);
  for(int i = 0; i <movers.length; i++){
    for(Mover a : attractors){
      //a.draw();
      PVector f = a.attract(movers[i]);
      movers[i].applyForce(f);
    }
    //PVector old = mover.location.copy();
    movers[i].move();
    //line(old.x, old.y, mover.location.x, mover.location.y);
    //mover.draw();
    if (i % 2.0 == 0)
      line(movers[i].location.x, movers[i].location.y, movers[i+1].location.x, movers[i+1].location.y);
      //else
     //line(movers[i].location.x, movers[i].location.y, movers[0].location.x, movers[0].location.y);
  }
  
}