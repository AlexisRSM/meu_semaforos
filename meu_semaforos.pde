final color BLACK=color(0,0,0);
final color GREY=color(100,100,100);
final color DARKGREY=color(118,118,118);
final color WHITE=color(255,255,255);
final color GREEN=color(0,255,0);
final color YELLOW=color(255,255,0);
final color  RED=color(255,0,0);
final color DARKGREEN=color(29,90,5);
final color DARKBLUE=color(0,86,131);

//Medidas Ecra
final int W_HEIGHT = 1080;
final int W_WIDTH = 1920;
//############################Estradas#################################################################################################
Lane L1= new Lane(1920, 250, #6A6565, 0, 375,0); //  cumprimento largura  posicao do x e posicao do y
Lane L2=new Lane(1920,250,#6A6565,0,375,90);
//###################################################Semaforos
//esquerda
TrafficLight T1=new TrafficLight(770, 640, 30, 0, 10, 0, 4, 3, 5,90);
//direita
TrafficLight T2=new TrafficLight(1150, 340, 30, 0, 10, 0, 4, 3, 5,270);
//cima  //preciso de fazer a push matrix
TrafficLight T3=new TrafficLight(810,300, 30, 0, 10, 2, 4, 3, 5,180);
//baixo
TrafficLight T4=new TrafficLight(1110, 680, 30, 0, 10, 2, 4, 3, 5,0);


//################################Carros##########################################
Carro c1=new Carro(0,585,50,30,5,DARKGREEN,T1,0,0);
Carro c2=new Carro(1920,415,50,30,5,RED,T2,180,180);
Carro c3=new Carro(876,0,51,30,5,DARKBLUE,T3,90,90);

Carro c4=new Carro(1045,1090,50,30,5,YELLOW,T4,270,270);

PImage bg;

void setup()
{
size(1920,1080);
bg=loadImage("grass.jpg");
}

void update()
{
  T1.update();  
  T2.update();
  T3.update();
  T4.update();
  c1.update();
  c2.update();
  c3.update();
  c4.update();
}

void draw()
{
background(bg);
update();
L1.draw();
L2.draw();
T1.draw();
T2.draw();
T3.draw();
T4.draw();
c1.draw();
c2.draw();
c3.draw();
c4.draw();

}
