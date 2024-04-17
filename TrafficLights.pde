class TrafficLight
{
 float x;
 float y;
 float size; 
 //Mover luzes em conjunto
 float offsetX;
 float offsetY;
 //Rodar semaforo
 float angle;
 light green;
 light red;
 light yellow;
 light lights[];
 
 int currentLightIndex; //diz me num determinado monento qual das luzaes do semaforo ta aberto
 
 TrafficLight(float x, float y, float size,float offsetX,float offsetY, int initialLight, int greenDuration, int yellowDuration, int redDuration,float angle)
 {
  this.x = x;
    this.y = y;
    this.size = size;
    this.offsetX = offsetX;
    this.offsetY = offsetY;
    this.angle=angle;
    this.red = new light(x + offsetX, y + offsetY - 40, size, RED, redDuration);
    this.yellow = new light(x + offsetX, y + offsetY, size, YELLOW, yellowDuration);
    this.green = new light(x + offsetX, y + offsetY + 40, size, GREEN, greenDuration);
    this.currentLightIndex = initialLight;
    this.lights = new light[3];
    this.lights[0] = this.green;
    this.lights[1] = this.yellow;
    this.lights[2] = this.red;
    this.lights[currentLightIndex].turnOn();
  }
 
void update()
 {
   
   for(int i = 0; i< this.lights.length; i++)
   {
     this.lights[i].update();
   }
   light currentLight;
   currentLight = this.lights[this.currentLightIndex];
   if (!currentLight.on) 
   {
     this.currentLightIndex = (this.currentLightIndex+1)%3; //assim vai circular o array indefinidamente
     this.lights[this.currentLightIndex].turnOn(); //atualizo o index da luz atual e mando acender.
   }
 }
 
void draw() {
  pushMatrix(); 
  translate(this.x + this.offsetX, this.y + this.offsetY); 
  rotate(radians(this.angle));
  translate(-this.x - this.offsetX, -this.y - this.offsetY); 
  fill(BLACK);
  rect(this.x + this.offsetX - 25, this.y + this.offsetY - 65, 50, 125, 55); 
  rect(this.x + this.offsetX - 10, this.y + this.offsetY + 20, 20, 80, 10);
  this.red.draw();
  this.yellow.draw();
  this.green.draw();
  popMatrix(); 
}
  int getCurrentLightIndex()
  {
    return currentLightIndex;
  }
}
