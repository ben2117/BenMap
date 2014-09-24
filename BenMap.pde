boolean view = true;
int rectWidth;
Node activeNode;
FlashCard flash;

void setup() {
  size(800, 800); 
  rectWidth = width/4;
}

ArrayList<Node> nodes = new ArrayList<Node>();

void draw() {
  background(255);
  if (view) {
    for (Node n : nodes) {
      n.drawMe();
    }
  } else {
      
    flash.drawMe();
  }
}

void mouseClicked() {
  Node node = new Node("hi", mouseX, mouseY);
  nodes.add(node);
  activeNode = nodes.get(nodes.size()-1 );

}

void keyPressed() {

  if(keyCode == TAB){
    if(!view) {
      view = true; 
    }
     else{
       flash = new FlashCard(activeNode); 
       delay(100);
       view = false;
   }
  }

  if (view) { //it is in mind map mode
    if (keyCode == RIGHT) {
      print("right");
        Node ph = activeNode;
        activeNode.subNode();
        ph.children.add(activeNode);
    } else if (keyCode == LEFT) {
      print("left");
      if(activeNode.parent != null){
        activeNode = activeNode.parent;
      }
    }
    else if (keyCode == DOWN){
      activeNode = activeNode.children.get(activeNode.children.size()-1);
    
    } else if (keyCode == ENTER || keyCode == RETURN) {
        print("Enter"); 
        char x = key;
        activeNode.increaseEY(x);
    } else if (keyCode == 8) {
        print("d");
        activeNode.deleteText();
    } else {
        char x = key;
        print(key);
        activeNode.addText(x);
    }
  } else { //flash card mode
      if (keyCode == RIGHT) {
        print("right");
        flash = new FlashCard(activeNode); 
    } else if (keyCode == LEFT) {
        print("left");
      if(activeNode.parent != null){
        activeNode = activeNode.parent;
        flash = new FlashCard(activeNode);
      }
    }
     else if (keyCode == DOWN){
      activeNode = activeNode.children.get(activeNode.children.size()-1);
       flash = new FlashCard(activeNode);  
    } 
  }
}


void delay(int delay)
{
  int time = millis();
  while(millis() - time <= delay);
}
