public class FlashCard {
  Node drawnode;

  public FlashCard(Node n) {
    drawnode = n;
  }

  public void drawMe() {
    text(drawnode.content, 100, 100);
  }
}
