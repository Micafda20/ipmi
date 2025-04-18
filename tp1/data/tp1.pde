void setup(){
size(800, 400);
background(255);

PImage objeto;
objeto = loadImage("objeto.png");
   image(objeto, 0 , 0, 400,400);
}

void draw() {
  strokeWeight(2); // Borde de los objetos
 
 // Joy-Con izquierdo (celeste)
  fill(0, 200, 255);
  rect(400, 100, 80, 160, 40);
  
   // Joy-Con derecho (rojo)
  fill(255, 70, 70);
  rect(700, 100, 80, 160, 40);

 
  // Cuerpo central (negro)
  fill(20);
  rect(440, 100, 300, 160, 9);

  // Pantalla (gris oscuro)
  fill(90);
  rect(460, 110, 260, 140, 5);

  // Palanca izquierda (círculo)
  fill(0);
  ellipse(420, 150, 20, 20);

  // Botones izquierdos (cruz)
  ellipse(410, 190, 7, 7);
  ellipse(420, 180, 7, 7);
  ellipse(430, 190, 7, 7);
  ellipse(420, 200, 7, 7);

  // Palanca derecha
  ellipse(755, 200, 20, 20);

  // Botones derechos
  ellipse(747, 160, 7, 7);
  ellipse(765, 160, 7, 7);
  ellipse(755, 150, 7, 7);
  ellipse(755, 170, 7, 7);
}
