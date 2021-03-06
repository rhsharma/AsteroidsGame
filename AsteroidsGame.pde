SpaceShip bob = new SpaceShip();
Star sky[] = new Star[310];
ArrayList <Asteroids> ast = new ArrayList <Asteroids>();
ArrayList <Bullet> bullet = new ArrayList <Bullet>();
public boolean zPressed = false;
//Bullet bul = new Bullet(bob);
//Asteroids ast[] = new Asteroids[10];

public void setup() 
{
  background(0);
  size(400, 400);
  for (int i=0; i<sky.length; i++) {
    sky[i] = new Star();
  }
  for (int i = 0; i<12; i++) {
    ast.add(new Asteroids());
  }
}

public void draw() 
{
  background(0);
  for (int i= 0; i <sky.length; i++)
    sky[i].show();

    for (int i = 0; i <bullet.size(); i++) {
        bullet.get(i).move();
        bullet.get(i).show();
    }

  bob.keyPressed();
  for (int i =0; i<ast.size(); i++) {
    ast.get(i).move();
    ast.get(i).show();
  }
  bob.move();
  bob.show();
  if (ast.size() < 10)
    ast.add(new Asteroids());
  for (int i = 0; i <ast.size(); i++) {
    if (dist(bob.getX(), bob.getY(), ast.get(i).getX(), ast.get(i).getY()) < 25)
      ast.remove(i);
  }
  for (int j = 0; j < bullet.size(); j++) {
    for (int i = 0; i <ast.size(); i++) {
      if (dist(bullet.get(j).getX(), bullet.get(j).getY(), ast.get(i).getX(), ast.get(i).getY()) < 15)
        ast.remove(i);
    }
  }
}
  public void keyPressed()
  {
    if (key == ' '){ bullet.add(new Bullet(bob));}
  }

class Bullet extends Floater
{

  public void setX(int x){myCenterX = x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY = y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;}
  public double dRadians;

  public Bullet(SpaceShip theShip) {
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myPointDirection = theShip.getPointDirection();
    dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = (5 * Math.cos(dRadians) + theShip.getDirectionX());
    myDirectionY = (5 * Math.sin(dRadians) + theShip.getDirectionY());
  }

  public void show() {
    stroke(0, 150, 255);
    fill(0, 150, 255);
    ellipse((int)myCenterX, (int)myCenterY, 5, 5);
  }

  public void move() {
      myCenterX += myDirectionX;    
      myCenterY += myDirectionY;
    // bul.setX((int)bob.getX());
    // bul.setY((int)bob.getY());
    // bul.setX((int)myCenterX++);
    // bul.setY((int)myCenterY++);
  }

}



class SpaceShip extends Floater  
{   
  public void setX(int x){myCenterX = x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY = y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;} 
  public int hX, hY, point;


  public SpaceShip()
  {
    corners = 6;
    myCenterX = 0;
    myCenterY = 0;
    int[] aX = {-6,   13,  -6,   0,  -12,   0};
    int[] aY = {-8,    0,   8,   3,    0,  -3};
    xCorners = aX;
    yCorners = aY;
    myColor = 230;
    setX(200);
    setY(200);
    setDirectionX(3); 
    setDirectionY(-3);
    setPointDirection(180);
    hX = ((int)(Math.random()*400));  //Hyperspace X
    hY = ((int)(Math.random()*400));  //Hyperspace Y
    point = (int)(Math.random()*360);
  }

  public void keyPressed()
  {
    if (keyCode == DOWN) {
      bob.setX(bob.hX);
      bob.setY(bob.hY);
      bob.setPointDirection(bob.point);
    } else {
      bob.hX = ((int)(Math.random()*400));
      bob.hY = ((int)(Math.random()*400));
      bob.point = (int)(Math.random()*360);
    }
    if (keyCode == UP) {
      bob.accelerate(0.02);
    }
    if (keyCode == RIGHT) {
      bob.rotate(2);
    }
    if (keyCode == LEFT) {
      bob.rotate(-2);
    }
  }
}

class Star
{
  private int myX, myY, size;
  public Star()
  {
    myX = (int)(Math.random()*400);
    myY = (int)(Math.random()*400);
    size = (int)(Math.random()*2);
  }
  public void show()
  {
    stroke(255);
    fill(255);
    ellipse(myX, myY, size, size);
  }
}


class Asteroids extends Floater
{
  public void setX(int x){myCenterX = x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY = y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;}
  private int rSpeed;

  public Asteroids() 
  {
    myCenterX = 0;
    myCenterY = 0;
    int[] aX = {5,    7,    4,    2,   -4,   -7,   -4};
    int[] aY = {4,    0,   -5,   -6,   -5,    0,    5};
    corners = aX.length;
    xCorners = aX;
    yCorners = aY;
    myColor = 190;
    setX((int)(Math.random()*400));
    setY((int)(Math.random()*400));
    setDirectionX((int)(Math.random()*5-2)); 
    setDirectionY((int)(Math.random()*5-2));
    setPointDirection(1);
    rSpeed = (int)(Math.random()*5-2)*5;
  }

  public void move() {
    if (rSpeed == 0) {
      rSpeed = 2;
    }
      rotate(rSpeed);
      super.move();
  }
}


abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
