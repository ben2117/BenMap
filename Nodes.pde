public class Node {
  String content = "";
  Node parent;
  ArrayList<Node> children = new ArrayList<Node>();
  Location location;

  public Node(String content, float x, float y) {
    this.content = content;
    this.location = new Location(x, y);
  }

  public Node(Node parent) {
    this.parent = parent;
    this.location = new Location(parent.location.ex+50, parent.location.ey+50);
  }

  public void drawMe() {
   if (parent != null) {
      line(parent.location.ex, parent.location.ey, this.location.x, this.location.y);
      stroke(126);
    }
    ellipse(location.x, location.y, 10, 10);
    ellipse(location.ex, location.ey, 10, 10);
    textSize(12);
    text(content, location.x, location.y); 
    fill(0, 102, 153);
  }
  
  public void drawMe(float x, float y) {
   if (parent != null) {
      line(parent.location.ex, parent.location.ey, x, y);
      stroke(126);
    }
    ellipse(x, y, 10, 10);
    ellipse(x + location.dx, y + location.dy, 10, 10);
    textSize(12);
    text(content, x, y); 
    fill(0, 102, 153);
  }

  public void addText(char k) {
    content += k;
    location.ex += 5.8;
  }
  public void increaseEY(char x){
    content += x;
    location.ey += 15;
    location.ex = location.x;
  }

  public void deleteText() {
    content = content.substring( 0, content.length()-1 );
  }

  public void subNode(String type) {
    if(type == "topic"){
      Node nde = new TopicNode(this);
      nodes.add(nde);
      activeNode = nodes.get(nodes.size()-1 );
      
    }
    if(type == "main"){
      Node node = new Node(this);
      nodes.add(node);
      activeNode = nodes.get(nodes.size()-1 );
    }
    //activeNode = this;
  }
}
