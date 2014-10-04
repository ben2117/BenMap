class MainNode extends Node {
   MainNode(String content, float x, float y) {
    super("Main Node", x, y);
  }
}

class TopicNode extends Node {
   TopicNode(Node parent) {
    super(parent);
    super.content = "Topic Node";
  }
}

class DataNode extends Node {
   DataNode(Node parent) {
    super(parent);
  }
}

class PointNode extends Node {
   PointNode(Node parent) {
    super(parent);
  }
}
