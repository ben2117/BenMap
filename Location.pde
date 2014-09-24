public class Location{
  float x;
  float y;
  float ex;
  float ey;
  float dx;
  float dy;
  
  public Location(float x, float y){
    this.x = x;
    this.y = y;
    this.ex = x + 50;
    this.ey = y + 25; 
  }
  
  public void difference(){
    dx = ex - x;
    dy = ey - y;
  }
  
  
}
