boolean view = true;
int rectWidth;
Node activeNode;


void setup(){
 size(800, 800); 
 rectWidth = width/4;
}

ArrayList<Node> nodes = new ArrayList<Node>();

void draw() {
  background(255);
  if(view){
    for (Node n : nodes){
      n.drawMe();
    }
  }
}

void mouseClicked() {
  Node node = new Node("hi", mouseX, mouseY);
  nodes.add(node);
  activeNode = nodes.get(nodes.size()-1 );
}

void keyPressed() {
  
  if(keyCode == RIGHT){
    print("right");
    activeNode.subNode();
  }
  else if(keyCode == LEFT){
    print("left");
    activeNode = activeNode.parent;
  }
  else if(keyCode == 8){
    print("d");
    activeNode.deleteText();
  }
  else{
    char x = key;
    activeNode.addText(x);
  }
}
