//https://youtu.be/b516slm2UPQ

PImage miImagen;

int filas = 6;
int columnas = 6;
int capasOriginal = 5;// cantidad de cuadrados por celda 
float rotacionGlobalOriginal = 0;
boolean modoColorOriginal = false;
int capas;
float rotacionGlobal;
boolean modoColor;

void setup() {
  size(800, 400);
  miImagen = loadImage("10.jpeg");
  reiniciar();
}

void draw() {
  background(255);
  image(miImagen, 0, 0, 400, 400);
  pushMatrix();
  translate(400, 0);
  dibujarPatron();
  popMatrix();
  stroke(0);
  line(400, 0, 400, 400);
  noStroke();
}

void dibujarPatron() {
  fill(255);
  noStroke();
  rect(0, 0, 400, 400); 

  float tamCelda = 400.0 / columnas;

  for (int fila = 0; fila < filas; fila++) {
    for (int col = 0; col < columnas; col++) {

      float x = col * tamCelda;
      float y = fila * tamCelda;

      // distancia del centro de esta celda al mouse
      float centroX = x + tamCelda / 2;
      float centroY = y + tamCelda / 2;
      float mx = mouseX - 400;
      float my = mouseY;
      float distancia = calcularDistancia(mx, my, centroX, centroY);

      // cuantos cuadrados dibujar en esta celda
      int capasCelda = calcularCapas(distancia);

      dibujarCelda(x, y, tamCelda, capasCelda, fila, col);
    }
  }


}

// Función CON parámetros que SI retorna un valor
float calcularDistancia(float x1, float y1, float x2, float y2) {
  return dist(x1, y1, x2, y2);
}

// Función CON parámetros que SI retorna un valor
int calcularCapas(float distancia) {
  int resultado;

  if (distancia < 60) {
    resultado = int(map(distancia, 0, 60, capas + 4, capas));
  } else {
    resultado = capas;
  }

  return resultado;
}

// Función CON parámetros que NO retorna valor

void dibujarCelda(float x, float y, float tam, int numCapas, int fila, int col) {
  pushMatrix();
  translate(x + tam / 2, y + tam / 2);
  rotate(rotacionGlobal);
  translate(-tam / 2, -tam / 2);

  strokeWeight(3);
  noFill();

  // FOR que dibuja los cuadrados concéntricos, del mas chico al mas grande
  for (int k = 0; k < numCapas; k++) {

    if (modoColor) {
      stroke(random(255), random(255), random(255));
    } else {
      stroke(0);
    }

    float fraccion = map(k, 0, numCapas - 1, 0.5, 1.0);
    float s = tam * fraccion;
    rect(0, 0, s, s);
  }

  popMatrix();
}

// Reinicia todas las variables a su estado original
void reiniciar() {
  capas = capasOriginal;
  rotacionGlobal = rotacionGlobalOriginal;
  modoColor = modoColorOriginal;
}

// Click alterna entre patron en blanco y negro (original)o con colores
void mousePressed() {
  modoColor = !modoColor;
}

// Arrastrar el mouse rota todo el patron
void mouseDragged() {
  rotacionGlobal = map(mouseX, 400, 800, -PI, PI);
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    reiniciar();

  }
}
