import 'bt_node.dart';

class BinaryTree<T extends Comparable<T>> {
  late final BTNode<T> root;

  BinaryTree({required T rootValue}) {
    root = BTNode(value: rootValue);
  }

  void insert(T input) {
    root.insert(input);
  }

  BTNode<T>? find(T item) {
    return root.find(item);
  }

  BTNode<T>? lca(T item1, T item2) {
    return root.lca(item1, item2, root);
  }
}
