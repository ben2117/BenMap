public class FlashCard {
  Node drawnode;

  public FlashCard(Node n) {
    drawnode = n;
  }

  public void drawMe() {
    int y = 200;
    text(drawnode.content, 100, 100);
    for (Node child : drawnode.children) {
      text(child.content, 100, y);
      y += 100;
    }
  }
}
