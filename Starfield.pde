Particle [] array;//your code here
void setup()
{
size(500,500);
array = new Particle[1000];
for (int i = 0; i<array.length; i++)
{
	
	array[2]= new JumboParticle();
	array[1]= new OddballParticle();
	array[i]= new NormalParticle();
}
}
void draw()
{
background(0,255,100);
for (int i = 0; i <array.length; i++)
{
	array[i].move();
	array[i].show();
}	//your code here
}
class NormalParticle implements Particle
{
	int col;
	double x,y,angle,speed,a,b;
	NormalParticle()
	{
	x = 250;
	y = 250;
	angle = (Math.random()*2*Math.PI);
	speed = (Math.random()*3);
	col = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
	}
	public void move()
	{
	a = Math.cos(angle)*speed;
	b = Math.tan(angle)*speed;
	x = x - a;
	y = y - b;
	if(x>501 || y>501)
	{
		x=250;
		y=250;
	}
	else 
	if (x<0 || y<0) 
	{
		x=250;
		y=250;	
	}
	}
	public void show()
	{
	noStroke();
	fill(col);
	ellipse((float)x,(float)y,10,10);
	}
}
interface Particle
{
public void show();
public void move();
}
class OddballParticle implements Particle//uses an interface
{
	int col,x,y,a,b;
	OddballParticle()
	{
	x = 250;
	y = 250;
	col = color(255,0,0);
	}
	public void show()
	{
	noStroke();
	fill(col);
	ellipse((float)x,(float)y,50,50);
	}
	public void move()
	{
	a = (int)(Math.random()*5)-2;
	b = (int)(Math.random()*5)-2;
	x = x+a;
	y = y+b;
	}	
}
class JumboParticle extends NormalParticle//uses inheritance
{
public void show()
{
	fill(0,0,255);
	ellipse((float)x,(float)y,100,100);

}
}