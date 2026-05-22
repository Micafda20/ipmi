// hecho por: Mica Villaverde

PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
int pantalla = 0;
int tiempoInicio;
PFont fuente;
float textoPosY;
int alphaRect;
boolean inicio = true;
boolean fin = false;

// titulos de las pantallas
String titulo1 = "¿Que es Naruto?";
String titulo2 = "El personaje principal";
String titulo3 = "El mundo ninja";
String titulo4 = "La historia";
String titulo5 = "Los personajes";

// textos 
String texto1 = "Naruto es un manga y anime creado por Masashi Kishimoto.\nFue publicado entre 1999 y 2014. Tiene mas de 700 capitulos\ny es uno de los animes mas famosos del mundo.";
String texto2 = "Naruto Uzumaki es un joven ninja de la aldea de la Hoja.\nTiene dentro suyo al Zorro de las Nueve Colas. Su sueno\nes convertirse en Hokage, el lider de su aldea.";
String texto3 = "La historia ocurre en un mundo donde existen aldeas ninja.\nLos ninjas usan el chakra para hacer tecnicas especiales\nllamadas jutsu. Hay 5 grandes naciones con sus aldeas.";
String texto4 = "Naruto crece solo porque todos lo rechazaban por el zorro.\nAprende a luchar con sus amigos Sasuke y Sakura.\nJuntos enfrentan enemigos cada vez mas peligrosos.";
String texto5 = "Los personajes mas importantes son: Naruto, Sasuke, Sakura,\nKakashi (su sensei), Jiraiya, Tsunade, Minato (el padre\nde Naruto) y el villano principal Madara Uchiha.";

void setup() {
  size(640, 480);
  img1 = loadImage("NARUTO1.jpg");
  img2 = loadImage("NARUTO2.jpg");
  img3 = loadImage("NARUTO3.jpg");
  img4 = loadImage("NARUTO4.jpg");
  img5 = loadImage("NARUTO4.jpg");

  fuente = createFont("Arial", 16);
  textFont(fuente);
  
  textoPosY = 480;
  
  alphaRect = 0;
  
  tiempoInicio = millis();
}

void draw() {
  
  if (inicio == true) {
    mostrarInicio();
  } else if (fin == true) {
    mostrarFin();
  } else {
    mostrarPantalla();
  }
  
}

void mostrarInicio() {
  background(20, 20, 20);
  
  // titulo
  fill(255, 165, 0);
  textSize(42);
  textAlign(CENTER, CENTER);
  text("NARUTO", width/2, 150);
  
  
  // dibujo el boton de inicio
  fill(255, 140, 0);
  rect(220, 300, 200, 55);
  
  fill(0);
  textSize(20);
  text("INICIAR", width/2, 327);
}

void mostrarPantalla() {

  int tiempoPasado = millis() - tiempoInicio;
 
  if (tiempoPasado >= 6000) {
    pantalla = pantalla + 1;
    tiempoInicio = millis();
    textoPosY = 480; 
  
    if (pantalla >= 5) {
      fin = true;
    }
  }
  
  if (pantalla == 0) {
    image(img1, 0, 0, 640, 480);
  } else if (pantalla == 1) {
    image(img2, 0, 0, 640, 480);
  } else if (pantalla == 2) {
    image(img3, 0, 0, 640, 480);
  } else if (pantalla == 3) {
    image(img4, 0, 0, 640, 480);
  } else if (pantalla == 4) {
    image(img5, 0, 0, 640, 480);
  }
  

  fill(0, 0, 0, 190);
  noStroke();
  rect(0, 290, 640, 190);
  
  if (textoPosY > 320) {
    textoPosY = textoPosY - 4;
  }

  fill(255, 165, 0);
  textSize(20);
  textAlign(LEFT, TOP);
  text(getTitulo(), 20, textoPosY - 25);
  

  fill(255, 255, 255);
  textSize(13);
  text(getTexto(), 20, textoPosY + 5);
  
  
  fill(255, 255, 255, 180);
  textSize(13);
  textAlign(RIGHT, TOP);
  text((pantalla + 1) + " / 5", 625, 10);
 
  float porcentaje = tiempoPasado / 6000.0;
  fill(255, 165, 0, 200);
  noStroke();
  rect(0, 476, 640 * porcentaje, 4);
  
}

void mostrarFin() {
  background(20, 20, 20);
  
  fill(255, 165, 0);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("¡Fin de la presentacion!", width/2, 130);
   
  //los temas que vimos
  fill(200, 200, 200);
  textSize(14);
  text("Pantalla 1: ¿Que es Naruto?", width/2, 235);
  text("Pantalla 2: El personaje principal", width/2, 258);
  text("Pantalla 3: El mundo ninja", width/2, 281);
  text("Pantalla 4: La historia", width/2, 304);
  text("Pantalla 5: Los personajes", width/2, 327);
  
  // boton de reiniciar
  fill(255, 140, 0);
  rect(220, 370, 200, 55);
  
  fill(0);
  textSize(18);
  text("REINICIAR", width/2, 397);
}

String getTitulo() {
  if (pantalla == 0) {
    return titulo1;
  } else if (pantalla == 1) {
    return titulo2;
  } else if (pantalla == 2) {
    return titulo3;
  } else if (pantalla == 3) {
    return titulo4;
  } else {
    return titulo5;
  }
}

String getTexto() {
  if (pantalla == 0) {
    return texto1;
  } else if (pantalla == 1) {
    return texto2;
  } else if (pantalla == 2) {
    return texto3;
  } else if (pantalla == 3) {
    return texto4;
  } else {
    return texto5;
  }
}

void mouseClicked() {
  if (inicio == true) {
    if (mouseX >= 220 && mouseX <= 420 && mouseY >= 300 && mouseY <= 355) {
      inicio = false;
      tiempoInicio = millis();
    }
  }

  if (fin == true) {
    if (mouseX >= 220 && mouseX <= 420 && mouseY >= 370 && mouseY <= 425) {
      // reinicio todo
      pantalla = 0;
      fin = false;
      inicio = true;
      textoPosY = 480;
    }
  }
  
}

void mousePressed() {
  
  if (inicio == true) {
    if (mouseX >= 220 && mouseX <= 420 && mouseY >= 300 && mouseY <= 355) {
      inicio = false;
      tiempoInicio = millis();
    }
  }
  
  if (fin == true && mouseX >= 220 && mouseX <= 420 && mouseY >= 370 && mouseY <= 425) {
    pantalla = 0;
    fin = false;
    inicio = true;
    textoPosY = 480;
  }
  
}
