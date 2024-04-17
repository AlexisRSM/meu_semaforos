//o circulo ou ta a apago e fica cinzento.
// ou entao, se tiver aceso tem a cor correspondente.
class light {
 float x;
 float y;
 float diameter;
 color c;
 
 int timeTurnedOn;
 int onDuration;
 boolean on; 
// String state;
   
 
light(float x, float y, float diameter, int c, int onDuration)
{
  this.x = x; //o this é referenciacao daquilo q ta a ser "marcado" ou seja neste caso é o x que ta guardado no obj q tou a criar passa a ter o x que recebi.
  this.y = y;
  this.diameter = diameter;
  this.c = c;
  this.onDuration = onDuration;
  this.on = false;
}

  void turnOn()
  {
    this.on =true;
    this.timeTurnedOn = millis();
    
    
    
  }

void update()
{
    int elapsedTime;
    if(this.on)
    {
      elapsedTime = millis() - this.timeTurnedOn;
      if (elapsedTime >= this.onDuration*1000)
      {
        this.on = false;
      }
    }    
  
}



void draw()
{
  if(this.on)
  {
    fill(this.c);
  }
  else
  {
    fill(DARKGREY);
  }
  circle(this.x,this.y,this.diameter);

}

}
