class Carro
{
  //Desenho do Carro
  float x;
  float y;
  float size;
  float carroMaxVelocity;
  float speed;
  color c;
  TrafficLight semaforo;
  float angle;
  float direcao;
  
  Carro(float x, float y,float size,float carroMaxVelocity,float speed,color c, TrafficLight semaforo,float angle,float direcao)
  {
    this.x=x;
    this.y=y;
    this.size=size;
    this.carroMaxVelocity=carroMaxVelocity;
    this.speed=speed;
    this.c=c;
    this.semaforo=semaforo;
    this.angle=angle;
    this.direcao=direcao;
  
  }
  
  void draw()
  {
    pushMatrix(); 
    translate(x, y); 
    rotate(radians(angle)); 
    fill(c);
    rect(-size, -size/2, size*2, size,20); 
    //windshield
    fill(color(#79CAF5));
    //                       ,largura rect,  
    //Luzes
    rect(size*0.7, size/4, size*0.2, size/6,33);
    rect(size*0.7, -size/3, size*0.2, size/6,33);
    //Back Windshield
    rect(-size*1/2, -size*1/2, -size*1/2, size,23);
    //Front Windshield
    rect(size*0.55, -size*0.46, -size*0.5, size*0.95,13);
    fill(BLACK);   //y roda
    rect(-size*3/4, -size*0.66, size/2, size/6,10); // Rear left wheel
    rect(-size*3/4, size/2, size/2, size/6,10); // Rear right wheel
    rect(size/4, -size*0.66, size/2, size/6,10); // Front left wheel
    rect(size/4, size/2, size/2, size/6,10); // Front right wheel
    rect(x + size*5/4, y + size, size/2, size/4); // Front right wheel
    popMatrix(); 
  }

 void update()
{
  float dx = speed * cos(radians(direcao)); // horizontal movement
  float dy = speed * sin(radians(direcao)); // vertical movement
  x += dx;
  y += dy;

  if (direcao == 0) { // moving from left to right
    if (x > width + size) {
      x = -size; // restart at the beginning of the road
      c=color(random(255),random(255),random(255));
      speed=random(carroMaxVelocity);
    }
  } else if (direcao == 180) { // moving from right to left
    if (x < -size) {
      x = width + size; // restart at the end of the road
      c=color(random(255),random(255),random(255));
      speed=random(carroMaxVelocity);
    }
  } else if (direcao == 90) { // moving from top to bottom
    if (y > height + size) {
      y = -size; // restart at the beginning of the road
      c=color(random(255),random(255),random(255));
      speed=random(carroMaxVelocity);
    }
  } else if (direcao == 270) { // moving from bottom to top
    if (y < -size) {
      y = height + size; // restart at the end of the road
      c=color(random(255),random(255),random(255));
      speed=random(carroMaxVelocity);
    }
  }

  // Check if car is ond the end
  if (direcao == 0 || direcao == 180) { // horizontal movement
    if (x > width + size || x < -size) {
      x = constrain(x, -size, width + size);
      direcao += 180; // reverse the direction of the car
    }
  } else if (direcao == 90 || direcao == 270) { // vertical movement
    if (y > height + size || y < -size) {
      y = constrain(y, -size, height + size);
      direcao += 180; // reverse the direction of the car
    }
  }
  // Get the current light index from the TrafficLight object
  int currentLightIndex = semaforo.getCurrentLightIndex();

// Check if the current light index is 2 (red light) or 1 (yellow light)
if (currentLightIndex == 2 || currentLightIndex == 1)
{
  // Se o carro nao passou o semaforo parar o carro
  if(direcao == 90 || direcao == 270)
  {
    if ((y == semaforo.y && dy > 0) || (y == semaforo.y && dy < 0)) // ver se o carro esta no semaforo
    {
      speed = 0;
    }
    // Se o carro ja passou o semaforo permitir continuar ate ele
    else if ((dy > 0 && y < semaforo.y) || (dy < 0 && y > semaforo.y))
    {
      float distanceToLight = abs(semaforo.y - y); // calcular distancia ao semaforo
      float deceleration = (carroMaxVelocity * carroMaxVelocity) / (2 * distanceToLight); // calculate deaceleration
      speed = lerp(speed, 0, deceleration / carroMaxVelocity); // Decelerate using the lerp function
    }
  }
  else if(direcao == 0 || direcao == 180)
  {
    if ((x == semaforo.x && dx > 0) || (x == semaforo.x && dx < 0)) // Check if the car is at the traffic light
    {
      speed = 0;
    }
    //Se o carro ja passou o semaforo permitir continuar ate ele
    else if ((dx > 0 && x < semaforo.x) || (dx < 0 && x > semaforo.x))
    {
      float distanceToLight = abs(semaforo.x - x); //calcluar distancia ao semaforo
      float deceleration = (carroMaxVelocity * carroMaxVelocity) / (2 * distanceToLight); // calculate deaceleration 
      speed = lerp(speed, 0, deceleration / carroMaxVelocity); // Decelerate using the lerp function
    }
  }
}
else // If the current light index is not 2 or 1 alllow the car to move at maximum velocity
{
  if (speed < carroMaxVelocity)
  {
    speed+=0.5;
  }


  
  }
}
}
