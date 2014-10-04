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

String interfaceString = "Node Type: MAIN, topic, data, point";

void draw() {
  background(255);
  text(interfaceString, 50, 50);
  if (view) {
    for (Node n : nodes) {
      if(movingNode != n){
        n.drawMe();
      }
    }
    if(movingNode != null){
      movingNode.drawMe(mouseX, mouseY);
        
    }
  } else {
    flash.drawMe();
  }
  //print(interfaceString);
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
    if(mouseY > 70){
      Node node = new MainNode("hi", mouseX, mouseY);
      nodes.add(node);
      activeNode = nodes.get(nodes.size()-1 );
    }
  }
  
  if(mouseX > 159 && mouseX < 188 && mouseY > 38 && mouseY < 53){
    interfaceString = "Node Type: main, TOPIC, data, point";
  }
  else if(mouseX > 120 && mouseX < 147 && mouseY > 38 && mouseY < 53){
    interfaceString = "Node Type: MAIN, topic, data, point";
  }
  else if(mouseX > 198 && mouseX < 221 && mouseY > 38 && mouseY < 53){
    interfaceString = "Node Type: main, topic, DATA, point";
  }
  else if(mouseX > 231 && mouseX < 264 && mouseY > 38 && mouseY < 53){
    interfaceString = "Node Type: main, topic, data, POINT";
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
      String input = "";
        if(interfaceString == "Node Type: main, TOPIC, data, point"){
         input = "topic";
        }
        if(interfaceString == "Node Type: MAIN, topic, data, point"){
         input = "main";
        }
         Node ph = activeNode;
         activeNode.subNode(input);
         ph.children.add(activeNode);
    } else if (keyCode == LEFT) {
      print("left");
      if(activeNode.parent != null){
        activeNode = activeNode.parent;
      }
    }
    else if (keyCode == DOWN){
      activeNode = activeNode.children.get(activeNode.children.size()-1);
    
    } 
  } 
  else { //flash card mode
      
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
  
  ///Typing stuff
  if (keyCode == ENTER || keyCode == RETURN) {
        print("Enter"); 
        char x = key;
        activeNode.increaseEY(x);
    } else if (keyCode == 8) {
        if(locked == true){
         int i = 0;
         for (Node n : nodes) {
           
           if( n == movingNode){
             nodes.remove(i);
             movingNode = null;
             locked = false;
             break;
           }
           i++;
         }
        }
        print("d");
        activeNode.deleteText();
    } else {
        char x = key;
        print(key);
        activeNode.addText(x);
    }
}


void delay(int delay)
{
  int time = millis();
  while(millis() - time <= delay);
}
