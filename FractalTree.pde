private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
public boolean[] keys = new boolean[6];
public void setup() 
{   
	size(700,700); 
	for (int i =0; i < keys.length; i++)
	{
		keys[i] = false;
	}   
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(350,700,350,500);   
	drawBranches(350, 500, 100, Math.PI*3/2);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle, angle2 = angle - branchAngle;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	line(x, y, endX1, endY1);
	line(x,y, endX2, endY2);
	if (branchLength > smallestBranch)
	{
		drawBranches(endX1, endY1, branchLength * fractionLength, angle1);
		drawBranches(endX2, endY2, branchLength * fractionLength, angle2);
	}
} 	
public void keyPressed()
{
	if (key == 'q')
		keys[0] = true;;
	if (key == 'a')
		keys[1] = true;
	if (key == 'w')
		keys[2] = true;
	if (key== 's')
		keys[3] = true;
	if (key == 'e')
		keys[4] = true;
	if (key == 'd')
		keys[5] = true;
	if (keys[0] && smallestBranch > 5)
	{
		smallestBranch--;
		redraw();
	}
	if (keys[1] && smallestBranch < 100)
	{
		smallestBranch++;
		redraw();
	}
	if (keys[2])
	{
		branchAngle+= 0.01;
		redraw();
	}
	if (keys[3])
	{
		branchAngle-=0.01;
		redraw();
	}
	if (keys[4] && fractionLength < .9)
	{
		fractionLength +=.1;
		redraw();
	}
	if (keys[5] && fractionLength > .2)
	{
		fractionLength-=.1;
		redraw();
	}
}
public void keyReleased()
{
	if (key == 'q')
		keys[0] = false;;
	if (key == 'a')
		keys[1] = false;
	if (key == 'w')
		keys[2] = false;
	if (key== 's')
		keys[3] = false;
	if (key == 'e')
		keys[4] = false;
	if (key == 'd')
		keys[5] = false;
}