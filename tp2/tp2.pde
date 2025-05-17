int opacidad = 0;
int text2 = 460;
int text3 = -100;
int opacidadTexto = 0;
int escena = -1; // Escena -1: pantalla de inicio
int tiempoInicio = 0;

PImage pantalla1, pantalla2, pantalla3, pantalla4;
PFont fuenteNueva;

// Textos divididos
String texto2 = "Cada vez que completás una línea,\n¡ganás puntos!\nSi hacés varias líneas a la vez \n(doble, triple o Tetris - 4 líneas),\nganás más.";
String texto3 = "El juego termina si las piezas\nse apilan hasta arriba.\nBuscá dejar espacio para las piezas largas \n(forma “I”).";
String texto4 = "Tetris es simple pero adictivo.\nAyuda a mejorar la concentración,\nla memoria visual y la rapidez mental.";

float textoY;
float img = 460;
float fondo;
boolean moviendo = true;

void setup() {
  size(640, 480);
  background(0);

  // Cargar imágenes
  pantalla1 = loadImage("Pantalla1.jpg");
  pantalla2 = loadImage("Pantalla2.jpg");
  pantalla3 = loadImage("Pantalla3.jpg");
  pantalla4 = loadImage("Pantalla4.jpg");

  pantalla1.resize(640, 480);
  pantalla2.resize(640, 480);
  pantalla3.resize(640, 480);
  pantalla4.resize(640, 480);

  fuenteNueva = createFont("Arial", 28);
  textFont(fuenteNueva);
  textAlign(CENTER, TOP);
}

void draw() {
  noTint();

  // ESCENA -1: Pantalla de inicio
  if (escena == -1) {
    background(0);
    tint(255, opacidad);
    image(pantalla1, 0, 0);
    noTint();

    // Botón de "Iniciar"
    fill(75, 0, 130); // violeta
    rect(270, 400, 99, 40);
    fill(255);
    text("Iniciar", 320, 410); // Texto centrado en el botón

    if (opacidad < 255) opacidad += 3;
  }

 else if (escena == 0) {
  background(0);
  image(pantalla2, img, 0); // imagen desliza desde la derecha

  fill(255);
  textFont(fuenteNueva);
  textAlign(CENTER, TOP);

  // El texto se mueve junto con la imagen
  float textoX = img + pantalla2.width / 2; // centro de la imagen que se mueve
  text(texto2, textoX, 40);

  if (img > 0) img -= 3;

  }

  // ESCENA 1: Pantalla 3 (texto 3)
  else if (escena == 1) {
    background(0);
    tint(255, opacidad);
    image(pantalla3, 0, 0);
    noTint();

    fill(255, opacidadTexto); 
    textFont(fuenteNueva);
    textAlign(CENTER, TOP);
    text(texto3, width / 2, 40);

    if (opacidad < 255) opacidad += 2;
    if (opacidadTexto < 255) opacidadTexto += 3;
  }

else if (escena == 2) {
  background(0); // Fondo negro
  image(pantalla4, 0, fondo);
  if (fondo > 0) fondo -= 6;

  fill(0);
  textFont(fuenteNueva);
  textAlign(CENTER, TOP);
  fill(255, opacidadTexto);
  text(texto4, width / 2, fondo + 40); // Texto se mueve con la imagen

  if (opacidadTexto < 255) opacidadTexto += 3;

  // Botón "Reiniciar"
  fill(0);
  rect(460, 420, 120, 40);
  fill(255, 50, 200); // fucsia
  textAlign(CENTER, CENTER);
  text("Reiniciar", 520, 440);
}



 
  if (escena >= 0 && escena < 2) {
    int duracion = 400;
    if (escena == 0) duracion = 600;

    if (frameCount - tiempoInicio > duracion) {
      escena++;
      tiempoInicio = frameCount;
      resetearVariables();
    }
  }
}


void resetearVariables() {
  opacidad = 0;
  img = 460;
  text2 = 460;
  text3 = -100;
  fondo = height;
  moviendo = true;
  opacidadTexto = 0;
}

void mouseClicked() {
  // Botón "Iniciar"
  if (escena == -1) {
    if (mouseX > 275 && mouseX < 365 && mouseY > 400 && mouseY < 440) {
      escena = 0;
      tiempoInicio = frameCount;
      resetearVariables();
    }
  }

  // Botón "Reiniciar"
  if (escena == 2) {
    if (mouseX > 535 && mouseX < 625 && mouseY > 420 && mouseY < 460) {
      escena = -1;
      tiempoInicio = frameCount;
      resetearVariables();
    }
  }
}
