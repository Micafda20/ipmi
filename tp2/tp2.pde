PImage img1;
PImage img2;
PImage img3;
PImage img4;

PFont fuente;

int pantalla = 0;

int tiempo;

float textoX = -500;

boolean finalPantalla = false;

void setup() {

  size(640, 480);

  // cargar imagenes
  img1 = loadImage("naruto1.jpg");
  img2 = loadImage("naruto2.jpg");
  img3 = loadImage("naruto3.jpg");
  img4 = loadImage("naruto4.jpg");

  // cargar fuente
  fuente = loadFont("ArchieroBold-Regular-32.vlw");

  tiempo = millis();
}

void draw() {

  background(0);

  // cambiar pantalla automaticamente
  if (millis() - tiempo > 7000) {

    pantalla = pantalla + 1;

    tiempo = millis();

    textoX = -500;
  }

  // pantalla 1
  if (pantalla == 0) {

    image(img1, 0, 0, width, height);

    mostrarTexto("Naruto Uzumaki es un joven ninja de Konoha.");
  }

  // pantalla 2
  if (pantalla == 1) {

    image(img2, 0, 0, width, height);

    mostrarTexto("Su mayor sueño es convertirse en Hokage.");
  }

  // pantalla 3
  if (pantalla == 2) {

    image(img3, 0, 0, width, height);

    mostrarTexto("Forma parte del equipo 7 junto a Sasuke y Sakura.");

    // OR
    if (mousePressed || keyPressed) {

      fill(255, 150, 0);

      ellipse(560, 70, 40, 40);
    }
  }

  // pantalla 4
  if (pantalla == 3) {

    image(img4, 0, 0, width, height);

    mostrarTexto("Con entrenamiento Naruto aprende tecnicas mas fuertes.");
  }

  // pantalla final
  if (pantalla >= 4) {

    background(30);

    fill(255);

    textAlign(CENTER);

    textFont(fuente);

    textSize(35);

    text("Fin de la presentacion", width/2, 170);

    fill(120);

    rect(220, 250, 200, 60);

    fill(255);

    textSize(25);

    text("Reiniciar", width/2, 290);

    finalPantalla = true;
  }
}

// funcion para mostrar texto
void mostrarTexto(String texto) {

  fill(0, 180);

  rect(0, 370, width, 110);

  fill(255);

  textFont(fuente);

  textSize(22);

  // mover texto
  textoX = textoX + 1;

  // frenar texto
  if (textoX > 20) {

    textoX = 20;
  }

  text(texto, textoX, 430);
}

// reiniciar presentacion
void mousePressed() {

  // AND
  if (finalPantalla == true && mouseX > 220 && mouseX < 420 && mouseY > 250 && mouseY < 310) {

    pantalla = 0;

    tiempo = millis();

    textoX = -500;

    finalPantalla = false;
  }
}
