// The Flyweight pattern is a design pattern used in software development to
// optimize memory usage by sharing common and immutable objects among multiple instances,
// rather than creating a new object for each instance. This pattern is particularly useful
// when you have a large number of objects that share the same properties, and it can help reduce
// memory consumption and improve performance.

// Imagine you're developing a mobile game in Dart where you have to represent
// a large number of trees in a forest. Each tree has properties like its type (e.g., oak, pine),
// color, and position. Without the Flyweight pattern, you might create a separate object
// for each tree, even if many of them share the same properties. This can be inefficient
// in terms of memory usage.

// In this example, we have a Tree class to represent a tree with properties
// like type and color. The TreeFactory class is responsible for creating and
// caching tree objects. When you request a tree from the factory,
// it checks if a tree with the same properties already exists in the cache.
// If it does, it returns the existing tree; otherwise, it creates a new one and caches it.
// This way, we ensure that only a limited number of tree objects are created and
// shared among instances, saving memory and improving efficiency.

class Tree {
  final String type;
  final String color;
  Tree(this.type, this.color);
}

class TreeFactory {
  final Map<String, Tree> _treeCache = {};

  Tree getTree(String type, String color) {
    final key = '$type-$color';
    if (_treeCache.containsKey(key)) {
      return _treeCache[key]!;
    } else {
      final tree = Tree(type, color);
      _treeCache[key] = tree;
      return tree;
    }
  }
}

void main() {
  final TreeFactory treeFactory = TreeFactory();

  // Create a forest of trees
  final Tree oakTree1 = treeFactory.getTree("oak", "green");
  final Tree oakTree2 = treeFactory.getTree("oak", "green");
  final Tree pineTree1 = treeFactory.getTree("pine", "green");
  final Tree pineTree2 = treeFactory.getTree("pine", "green");

  // Check if the same objects are shared
  print(oakTree1 == oakTree2); // true
  print(pineTree1 == pineTree2); // true

  // Even though we created 4 trees, only 2 distinct tree objects are created
}
