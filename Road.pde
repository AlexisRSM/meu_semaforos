class Lane {
  float cumprimento;
  float largura;
  color cor;
  float posx;
  float posy;
  float angle;
  //Inserir carro aqui?
  //Carro car;

  Lane(float cumprimento, float largura, color cor,float posx, float posy,float angle) {
    this.cumprimento = cumprimento;
    this.largura = largura;
    this.cor = cor;
    this.posx=posx;
    this.posy=posy;
    this.angle=angle;
 // this.car = new Carro(posx + cumprimento/2,posy + largura/2,50,100,5,GREEN);;
  }
  
   void draw() {
  noStroke();
  fill(this.cor);
  pushMatrix();
  translate(this.posx + this.cumprimento/2, this.posy + this.largura/2); // translate to center of lane
  rotate(radians(this.angle));
  translate(-this.cumprimento/2, -this.largura/2); // translate back by half the length of the lane
  rect(0, 0, this.cumprimento, this.largura);
/*
  // Draw white lines with spaces
  fill(255);
float cLinha = 10;
float cEspaco = 10;
float numSegmentos = this.cumprimento / (cLinha + cEspaco);
float startX = -(this.cumprimento - (numSegmentos * cLinha + (numSegmentos - 1) * cEspaco)) / 2 + cLinha/2; // shift the start by half the width of each segment
for (int i = 0; i < numSegmentos; i++) {
  rect(startX + (i * (cLinha + cEspaco)), 0, cLinha, cLinha);
}
// draw a second line of rectangles below the first line
float startY = this.largura;  // set the y-coordinate of the second line
for (int i = 0; i < numSegmentos; i++) {
  rect(startX + (i * (cLinha + cEspaco)), startY, cLinha, cLinha);
}
*/
  popMatrix();
}


}
