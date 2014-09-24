boolean view = true;
boolean clicked = false;
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
    if(movingNode != null){
      movingNode.drawMe(mouseX, mouseY);
        
    }
  } else {
    flash.drawMe();
  }
}


Node movingNode;
boolean locked = false;

void mouseClicked() {
  
  boolean overn = false;


  if(locked == true){
    movingNode.location.x = mouseX;
    movingNode.location.y = mouseY;
    movingNode.location.ex = mouseX + movingNode.location.dx;
    movingNode.location.ey = mouseY + movingNode.location.dy;
    
    movingNode = null;
    locked = false;
    overn = true;
  }
  
  for (Node n : nodes) {
    if(mouseX > n.location.x && mouseX < n.location.ex &&
     mouseY > n.location.y && mouseY < n.location.ey){
         print("gotanode");
         movingNode = n; 
         activeNode = n;
         overn = true;
         locked = true;
         n.location.difference();
     } 
  }
  if(!overn && locked == false){
    Node node = new Node("hi", mouseX, mouseY);
    nodes.add(node);
    activeNode = nodes.get(nodes.size()-1 );
  }
  

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
