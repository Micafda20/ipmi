PImage img;

void setup() {
  size(800, 400);
  img = loadImage("vela.png");
}

void draw() {
  background(30, 20, 10); // fondo
  image(img, 0, 0, 400, 400);
  
  //base
  fill(120, 80, 50);
  triangle(612, 300, 680, 362, 535, 360);
  
  //plato base
  fill(140, 100, 60);
  ellipse(606, 295, 80, 80);
  
  //parte superior del soporte
  fill(160, 120, 80);
  ellipse(605, 280, 210, 30);
  
  //palito del soporte
  fill(100, 70, 40);
  rect(597,120,10,120);
  
  //vela (cuerpo)
  fill(210, 190, 160);
  quad(581,129,630,134,630,282,579,280);

  noStroke();
  
  //centro de la llama
  fill(230, 140, 60);
  circle(602, 110, 30);
  
  // forma de llama arriba 
  fill(230, 140, 60);
  triangle(601, 80, 586, 111, 614, 110);

  fill(255, 180, 80, 40);
  circle(602, 110, 80);

  fill(255, 170, 70, 60);
  circle(602, 110, 60);

  fill(255, 160, 60, 80);
  circle(602, 110, 45);

  fill(255, 200, 120, 120);
  circle(602, 110, 25);

}
