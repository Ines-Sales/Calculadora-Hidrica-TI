import processing.serial.*;
Serial arduino;
String serialString = "";
int distancia;
int iX;
float f=0;
PImage primeiropainel;
PImage icone, background;
int distance;
int rectx;
PImage resultadofinal;
PFont myFont;
boolean mostrarprimeiro= true;
float multiplicadorPessoas=0;
float multiplicadorDuche=0;
float multiplicadorLoica=0;
float multiplicadorRoupa=0;
PFont fonte;
float numeropainel=1;
int pontuacao=0;
float multiplicador=1;
int rectxPrevious=0;
myButton[] buttons;
int[] answers = new int[10];
PImage[] images = new PImage[10];
float resposta;
int tempo;
int startTime, actionTime, totalTime, counter=0, contadorFor=0;


void setup() {
  size(1080, 700);
  fonte=loadFont("BowlbyOne-Regular-48.vlw");
  primeiropainel = loadImage("primeiropainel.jpg");
  textFont(fonte, 32);
  createButtons(4, 70, 80, width/4, height/2);
  icone= loadImage("Icone.png");
  resultadofinal = loadImage("resultadofinal.jpeg");
  arduino = new Serial(this, Serial.list()[0], 9600);
  iX=width/2;
  rectx = width/2;
  tempo=millis();
}

void draw() {
  background(255);
  resposta=dist(rectx-5, 100, rectx+5, 100);

  // ordem de paineis
  if (numeropainel==1) {
    EcraPrincipal();
  } else if (numeropainel==2) {
    PrimeiraQuestao();
  } else if (numeropainel==3) {
    SegundaQuestao();
  } else if (numeropainel==4) {
    TerceiraQuestao();
  } else if (numeropainel==5) {
    QuartaQuestao();
  } else if (numeropainel==6) {
    QuintaQuestao();
  } else if (numeropainel==7) {
    SextaQuestao();
  } else if (numeropainel==8) {
    SetimaQuestao();
  } else if (numeropainel==9) {
    OitavaQuestao();
  } else if (numeropainel==10) {
    Resultado();
  }


  if ((numeropainel > 1.0) && (numeropainel < 10.0)) {

    // movimentar icone
    float current = f;
    while (arduino.available() > 0) {
      String c = arduino.readStringUntil('\n');
      if (c!= null) {
        String c2 = c.substring(0, c.length()-2);

        current= round(parseFloat(c2)*0.5)*4;
        println(current);
      }


      if (current <20) {
        rectx = 240;
      } else if (current >=20 && current <50) {
        rectx=450;
      } else if (current >=50 && current <70) {
        rectx=700;
      } else {
        rectx= 900;
      }
      rectx = constrain(rectx, 0+100, width-100);
    }
    image(icone, rectx, 250, 200, 200);

    for (int i = 0; i < buttons.length; i++) {

      if (counter==0) {
        actionTime=millis();
        counter++;
      }
      totalTime= millis()-actionTime;

      if ((totalTime >= 5000)) {

        // 1 pergunta
        if (numeropainel == 2) {
          if (rectx==240) {
            multiplicadorPessoas=2.5;
            arduino.write('5');
          } else if (rectx==450) {
            multiplicadorPessoas=4.5;
            arduino.write('5');
          } else if (rectx==700) {
            multiplicadorPessoas=6;
            arduino.write('5');
          } else if (rectx==900) {
            multiplicadorPessoas=1;
            arduino.write('5');
          }
          counter=0;
          arduino.write('0');
        }
        // 2 pergunta
        if (numeropainel == 3) {

          if (rectx==240) {
            multiplicadorDuche=1.5;
            arduino.write('5');
          } else if (rectx==450) {
            multiplicadorDuche=3.5;
            arduino.write('5');
          } else if (rectx==700) {
            multiplicadorDuche=5.5;
            arduino.write('5');
          } else if (rectx==900) {
            multiplicadorDuche=7.5;
            arduino.write('5');
          }
          counter=0;
          arduino.write('0');
        }


        // 3 pergunta
        if (numeropainel == 4) {
          if (rectx==240) {
            pontuacao = int((20*multiplicadorDuche)/7);
            arduino.write('5');
          } else if (rectx==450) {
            pontuacao =  int((40*multiplicadorDuche)/7);
            arduino.write('5');
          } else if (rectx==700) {
            pontuacao =  int((65*multiplicadorDuche)/7);
            arduino.write('5');
          } else if (rectx==900) {
            pontuacao =  int((75*multiplicadorDuche)/7);
            arduino.write('5');
          }
          counter=0;
          arduino.write('0');
        }

        // 4 pergunta
        if (numeropainel == 5) {
          if (rectx==240) {
            pontuacao = int(pontuacao + (1283 * 0));
            arduino.write('5');
          } else if (rectx==450) {
            pontuacao =  int(pontuacao + (1283 * 1.5));
            arduino.write('5');
          } else if (rectx==700) {
            pontuacao =  int(pontuacao + (1283 * 3.5));
            arduino.write('5');
          } else if (rectx==900) {
            pontuacao =  int(pontuacao + (1283 * 6));
            arduino.write('5');
          }
          counter=0;
          arduino.write('0');
        }

        // 5 pergunta
        if (numeropainel == 6) {
          if (rectx==240) {
            multiplicadorLoica = 27;
            arduino.write('5');
          } else if (rectx==450) {
            multiplicadorLoica = 15;
            arduino.write('5');
          }
          counter=0;
          arduino.write('0');
        }

        // 6 pergunta
        if (numeropainel == 7) {
          if (rectx==240) {
            pontuacao = int(pontuacao+((1*multiplicadorLoica)/7));
            arduino.write('5');
          } else if (rectx==450) {
            pontuacao = int(pontuacao+((2.5*multiplicadorLoica)/7));
            arduino.write('5');
          } else if (rectx==700) {
            pontuacao = int(pontuacao+((4*multiplicadorLoica)/7));
            arduino.write('5');
          }
          counter=0;
          arduino.write('0');
        }

        // 7 pergunta
        if (numeropainel == 8) {
          if (rectx==240) {
            multiplicadorRoupa = 25;
            arduino.write('5');
          } else if (rectx==450) {
            multiplicadorRoupa = 41;
            arduino.write('5');
          }
          counter=0;
          arduino.write('0');
        }

        // 8 pergunta
        if (numeropainel == 9) {
          if (rectx==240) {
            pontuacao =  int(pontuacao+((1*multiplicadorRoupa)/7));
            arduino.write('5');
          } else if (rectx==450) {
            pontuacao =  int(pontuacao+((2.5*multiplicadorRoupa)/7));
            arduino.write('5');
          } else if (rectx==700) {
            pontuacao =  int(pontuacao+((4*multiplicadorRoupa)/7));
            arduino.write('5');
          }
          counter=0;
          arduino.write('0');
        }

        numeropainel++;
        print(pontuacao);
        if (numeropainel==10) {
          arduino.write('6');
          if (numeropainel!=10) {
            arduino.write('0');
          }
        }
      }

      if (rectx != rectxPrevious) {
        contadorFor++;
        if (buttons.length==contadorFor) {
          counter=0;
        }
      }
    }
    rectxPrevious = rectx;

    contadorFor=0;
  }



  // implementação botões
  if (arduino.available() > 0) {
    // 1 botão

    String message = arduino.readStringUntil('\n');
    if (message != null) {
      print(message + "\n");
      message = message.trim();
      // 1 botao
      if (message.equals("1")) {
        numeropainel=2;
      }
      // 2 botao
      if (message.equals("2") && numeropainel>0) {
        numeropainel=numeropainel-1;
      }
      // 3 botao
      if (message.equals("3") && numeropainel==10) {
        numeropainel=1;
      }
    }
  }
}


void EcraPrincipal() {
  primeiropainel.resize(1080, 700);
  image(primeiropainel, 0, 0);
  if (frameCount % 40 < 15) {
    fill(#E67334);
  } else {
    fill(#E67334);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("Clica no botão 1!", width/2, height-70);
  }
}

void PrimeiraQuestao() {
  background(255);
  fill(#E67334);
  textSize(30);
  textAlign(CENTER);
  text("1. Quantas pessoas habitam na tua casa?", width/2, height/4);
  setQuestionImages(1);
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].draw();
  }
}

void SegundaQuestao() {
  createButtons(4, 70, 80, width/4, height/2);
  background(255);
  fill(#E67334);
  textSize(30);
  textAlign(CENTER);
  text("2. Quantas vezes tomas duche por semana?", width/2, height/4);
  setQuestionImages(2);
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].draw();
  }
}

void TerceiraQuestao() {
  createButtons(4, 70, 80, width/4, height/2);
  background(255);
  fill(#E67334);
  textSize(30);
  textAlign(CENTER);
  text("3. Geralmente quanto tempo demoras a tomar duche", width/2, height/4);
  setQuestionImages(3);
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].draw();
  }
}

void QuartaQuestao() {
  createButtons(4, 70, 80, width/4, height/2);
  background(255);
  fill(#E67334);
  textSize(30);
  textAlign(CENTER);
  text("4. Quantas vezes comes carne por semana?", width/2, height/4);
  setQuestionImages(4);
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].draw();
  }
}

void QuintaQuestao() {
  createButtons(2, 70, 180, width/3, height/2);
  background(255);
  fill(#E67334);
  textSize(30);
  textAlign(CENTER);
  text("5. Como se lava a loiça em tua casa?", width/2, height/4);
  setQuestionImages(5);
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].draw();
  }
}
void SextaQuestao() {
  createButtons(3, 70, 150, width/4, height/2);
  background(255);
  fill(#E67334);
  textSize(30);
  textAlign(CENTER);
  text("6. Quantas vezes por semana?", width/2, height/4);
  setQuestionImages(6);
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].draw();
  }
}
void SetimaQuestao() {
  createButtons(3, 70, 150, width/3, height/2);
  background(255);
  fill(#E67334);
  textSize(30);
  textAlign(CENTER);
  text("7. Como se lava a roupa em tua casa?", width/2, height/4);
  setQuestionImages(7);
  for (int i = 0; i < buttons.length-1; i++) {
    buttons[i].draw();
  }
}
void OitavaQuestao() {
  createButtons(4, 70, 150, width/4, height/2); //-1
  background(255);
  fill(#E67334);
  textSize(30);
  textAlign(CENTER);
  text("8. Quantas vezes por semana?", width/2, height/4);
  setQuestionImages(8);
  for (int i = 0; i < buttons.length-1; i++) {
    buttons[i].draw();
  }
}

void Resultado() {
  resultadofinal.resize(1080, 700);
  image(resultadofinal, width/2, height/2); // Display the image
  textSize(15);
  textAlign(CENTER);
  String myText = "O teu consumo pessoal de água é de: \n \n" + pontuacao + " litros por dia";
  String myText2 = "Se todos os membro da tua casa \n se comportarem como tu, \n a vossa pegada hídrica é de: \n \n" + int(pontuacao*multiplicadorPessoas) + " litros por dia";
  if (multiplicadorPessoas > 1) {
    fill(#A3DBF7);
    rect(2.5*width/5, height/4, 450, 300, 40);
    fill(255);
    text(myText, 3.5*width/5, 1.4*height/4);
    text(myText2, 3.5*width/5, height/2);
  } else {
    fill(#A3DBF7);
    rect(2.5*width/5, 1.6*height/4, 450, 150, 40);
    fill(255);
    text(myText, 3.5*width/5, 2*height/4);
  }
}




void createButtons(int numButtons, int buttonSize, int spacing, int startX, int y) {
  buttons = new myButton[numButtons];
  spacing=150;
  startX=140;

  // numButtons

  for (int i = 0; i < numButtons; i++) {

    int x = startX + (buttonSize + spacing) * i;

    buttons[i] = new myButton(x, 370, buttonSize*2, buttonSize);
  }
}

void setQuestionImages(int painel) {
  if (painel == 1) {
    buttons[0].setImage(loadImage("p1_op1.jpeg"));
    buttons[1].setImage(loadImage("p1_op2.jpeg"));
    buttons[2].setImage(loadImage("p1_op3.jpeg"));
    buttons[3].setImage(loadImage("p1_op4.jpeg"));
  } else if (painel == 2) {
    buttons[0].setImage(loadImage("p2_op1.jpeg"));
    buttons[1].setImage(loadImage("p2_op2.jpeg"));
    buttons[2].setImage(loadImage("p2_op3.jpeg"));
    buttons[3].setImage(loadImage("p2_op4.jpeg"));
  } else if (painel == 3) {
    buttons[0].setImage(loadImage("p3_op1.jpeg"));
    buttons[1].setImage(loadImage("p3_op2.jpeg"));
    buttons[2].setImage(loadImage("p3_op3.jpeg"));
    buttons[3].setImage(loadImage("p3_op4.jpeg"));
  } else if (painel == 4) {
    buttons[0].setImage(loadImage("p4_op1.jpeg"));
    buttons[1].setImage(loadImage("p4_op2.jpeg"));
    buttons[2].setImage(loadImage("p4_op3.jpeg"));
    buttons[3].setImage(loadImage("p4_op4.jpeg"));
  } else if (painel == 5) {
    buttons[0].setImage(loadImage("p5_op1.jpeg"));
    buttons[1].setImage(loadImage("p5_op2.jpeg"));
  } else if (painel == 6) {
    buttons[0].setImage(loadImage("p6_op1.jpeg"));
    buttons[1].setImage(loadImage("p6_op2.jpeg"));
    buttons[2].setImage(loadImage("p6_op3.jpeg"));
  } else if (painel == 7) {
    buttons[0].setImage(loadImage("p7_op1.jpeg"));
    buttons[1].setImage(loadImage("p7_op2.jpeg"));
  } else if (painel == 8) {
    buttons[0].setImage(loadImage("p8_op1.jpeg"));
    buttons[1].setImage(loadImage("p8_op2.jpeg"));
    buttons[2].setImage(loadImage("p8_op3.jpeg"));
  }
}
