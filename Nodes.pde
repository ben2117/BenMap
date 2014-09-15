public class Node {
  String content;
  float[] loc = new float[5];
  Node parent;


  public Node(String content, float x, float y) {
    this.content = content;
    loc[0] = x;
    loc[1] = y;
    loc[2] = x+50;
    loc[3] = y+50;
  }

  public Node(Node parent) {
    this.parent = parent;
    content = "";
    loc[0] = parent.loc[2] ;
    loc[1] = parent.loc[3] ;
    loc[2] = parent.loc[2] + 10;
    loc[3] = parent.loc[3] + 10;
  }

  public void drawMe() {
    if (parent != null) {
      line(parent.loc[0], parent.loc[1], loc[0], loc[1]);
      stroke(126);
    }
    textSize(12);
    text(content, loc[0], loc[1]); 
    fill(0, 102, 153);
  }

  public void addText(char k) {
    content += k;
    loc[2]+=1;
    loc[3]+=1;
  }

  public void deleteText() {
    content = content.substring( 0, content.length()-1 );
  }

  public void subNode() {
    Node node = new Node(this);
    nodes.add(node);
    activeNode = nodes.get(nodes.size()-1 );
  }
}
