//https://youtu.be/_WOmBEl_7jc

PImage referencia;

float giro = 0;

int cantidadLineas = 8;

int columnas = 8;
int filas = 8;

void setup() {
  size(800, 400); 
   

  referencia = loadImage("10.jpeg");
}

void draw() {

  background(255);

  image(referencia, 0, 0, 400, 400);


  float dCentro = dist(mouseX, mouseY, 600, 200);

  //map
  giro = map(dCentro, 0, 300, 0.35, 0);

  float tamModulo = 50;

  //for anidados
  for (int fila = 0; fila < filas; fila++) {

    for (int col = 0; col < columnas; col++) {

      float x = 400 + col * 50;
      float y = fila * 50;

      dibujarModulo(x, y, tamModulo);
    }
  }
}

//funsion propia sin retorno

void dibujarModulo(float x, float y, float tam) {

  pushMatrix();

  translate(x + tam/2, y + tam/2);

  rotate(calcularRotacion(x, y));

  translate(-tam/2, -tam/2);

  stroke(0);
  strokeWeight(2);
  noFill();

  for (int i = 0; i < cantidadLineas; i++) {

    float margen = 4 + i * (tam / 10.0);

    line(margen, tam, margen, margen);
    line(margen, margen, tam, margen);
  }

  popMatrix();
}


//funsion propia con retorno

float calcularRotacion(float x, float y) {

  float d = dist(mouseX, mouseY, x, y);

  float rot = map(d, 0, 400, giro, 0);

  return rot;
}
//teclas

void keyPressed() {

  //reiniciar
  if (key == 'r' || key == 'R') {

    cantidadLineas = 8;
    giro = 0;
  }

  //sacar líneas
  else if (key == '-') {

    cantidadLineas--;

    if (cantidadLineas < 3) {
      cantidadLineas = 3;
    }
  }
}
