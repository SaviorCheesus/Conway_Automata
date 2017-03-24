//The Game of Life

Grid grid;

color living = color(150, 0, 0), dead = color(255);
float lifePercent = 60;
int size = 8;
int[][] cells; 
int[][] cellBuffer; 


void setup()  
{ 
  fullScreen(P3D);

  cells = new int[width/size][height/size]; 
  cellBuffer = new int[width/size][height/size]; 
 
  noSmooth(); 
  noStroke();
  background(0); 
  for (int x = 0; x < width/size; x++)  
  {
    for (int y = 0; y < height/size; y++)  
    {
      float state = (random (100)); 
      if (state > lifePercent)  
      { 
        state = 0; 
      } 
      else { 
        state = 1;
      } 
      cells[x][y] = int(state); 
    } 
  } 
} 


void draw() 
{ 
  for (int x = 0; x < width/size; x++) 
  { 
    for (int y = 0; y < height/size; y++) 
    { 
      if (cells[x][y] == 1) 
      { 
        fill(living); 
      } 
      else 
      { 
        fill(dead); 
      }      
      rect(x * size, y * size, size, size);
    } 
  } 
  check(); 
} 


void check() 
{
  for (int x = 0; x < width/size; x++)  
  { 
    for (int y=0; y<height/size; y++)  
    { 
      cellBuffer[x][y] = cells[x][y];
    } 
  }  

  for (int x = 0; x < width/size; x++) 
  { 
    for (int y = 0; y < height/size; y++) 
    { 
      int seroundingCells = 0;
      
      for (int i = x -1; i <= x +1; i++) 
      { 
        for (int j = y -1; j <= y +1; j++) 
        {   
          if (((i >= 0) && (i < width/size)) && (( j >= 0) && (j < height/size))) 
          { 
            if (!((i == x) && (j == y))) 
            {  
              if (cellBuffer[i][j] == 1)
              { 
                seroundingCells ++; 
              } 
            } 
          } 
        } 
      } 
      if (cellBuffer[x][y] == 1) 
      { 
        if (seroundingCells < 2 || seroundingCells > 3) 
        { 
          cells[x][y] = 0;
        } 
      } 
      else 
      {   
        if (seroundingCells == 3 ) 
        { 
          cells[x][y] = 1;
        } 
      } 
    } 
  } 
} 