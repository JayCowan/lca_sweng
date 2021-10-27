import 'node.dart';

class BinaryTree<T extends Comparable<T>> {
  late final Node<T> root;

  BinaryTree({required T rootValue}) {
    root = Node(value: rootValue);
  }

  void insert(T input) {
    root.insert(input);
  }

  Node<T>? find(T item) {
    return root.find(item);
  }

  Node<T>? lca(T item1, T item2) {
    return root.lca(item1, item2, root);
  }
}
