// Enlace al video explicativo en YouTube:


int cantidadColumnas = 14;
int cantidadFilas = 14;
float tamañoCelda = 28;
PImage imagen;

boolean modoColorActivado = false;

float radioInterno = 0.95;
float radioExterno = 1.0;

void setup(){
  size(800, 400);
  imagen = loadImage("F_37.jpg");
  imageMode(CORNER);
  smooth();
}

void draw(){
  background(255);

  // Muestra la imagen en la mitad izquierda
  image(imagen, 0, 0, width/2, height);
 
  float destinoRadioInterno = map(mouseX, width/2, width, 0.95, 0.1);
  radioInterno += (destinoRadioInterno - radioInterno) * 0.1;

  float destinoRadioExterno = map(mouseY, 0, height, 0.5, 1.5);
  radioExterno += (destinoRadioExterno - radioExterno) * 0.1;

  translate(width/2, 0); // Mueve el dibujo a la derecha

  for(int columna = 0; columna < cantidadColumnas; columna++){
    for(int fila = 0; fila < cantidadFilas; fila++){
      float x = columna * tamañoCelda + tamañoCelda / 2;
      float y = fila * tamañoCelda + tamañoCelda / 2;

      // la distancia al mouse
      float distancia = dist(mouseX, mouseY, x + width/2, y);
      float transparencia = map(distancia, 0, 200, 1, 0);
      transparencia = constrain(transparencia, 0, 1);

      float tamañoExterno = tamañoCelda * radioExterno * (0.5 + transparencia);
      float tamañoInterno = tamañoExterno * radioInterno;

      if(transparencia > 0.05){
        if(modoColorActivado && estoyEnZonaDerecha(mouseX)){
          float r = map(x, 0, width/2, 50, 255);
          float g = map(y, 0, height, 50, 200);
          float b = map(transparencia, 0, 1, 255, 50);
          dibujarAnillo(x, y, tamañoExterno, tamañoInterno, 255 * transparencia, r, g, b);
        } else {
          dibujarAnillo(x, y, tamañoExterno, tamañoInterno, 255, 0, 0, 0);
        }
      }
    }
  }
}

void keyPressed(){
  if(key == 'r' || key == 'R'){
    modoColorActivado = true;
    radioInterno = 0.95;
    radioExterno = 1.0;
  } else if(key == ' '){
    modoColorActivado = false;
  }
}

//anillo con dos elipses: una exterior y una interior blanca
void dibujarAnillo(float x, float y, float tamañoExterno, float tamañoInterno, float alfa, float r, float g, float b){
  noStroke();
  fill(r, g, b, alfa);
  ellipse(x, y, tamañoExterno, tamañoExterno);
  fill(255, alfa);
  ellipse(x, y, tamañoInterno, tamañoInterno);
}

// Devuelve true si el mouse está en la mitad derecha
boolean estoyEnZonaDerecha(float posicionMouseX){
  return posicionMouseX > width / 2;
}
