class Node<T extends Comparable<T>> {
  final T value;
  Node<T>? left, right;
  Node({required this.value});

  void insert(T input) {
    if (value.compareTo(input) >= 0) {
      if (right is Node) {
        right!.insert(input);
      } else {
        right = Node(value: input);
      }
    } else {
      if (left is Node) {
        left!.insert(input);
      } else {
        left = Node(value: input);
      }
    }
  }

  Node<T>? find(T item) {
    if (value.compareTo(item) == 0) {
      return this;
    } else if (value.compareTo(item) > 0) {
      return right?.find(item);
    } else {
      return left?.find(item);
    }
  }

  Node<T>? lca(T item1, T item2, Node<T> lca) {
    if (lca.left?.find(item1) is Node) {
      if (lca.left!.find(item2) is Node) {
        return lca.left!.lca(item1, item2, lca.left!);
      } else {
        return lca;
      }
    } else if (lca.left?.find(item2) is Node) {
      if (lca.left!.find(item1) is Node) {
        return lca.left!.lca(item1, item2, lca.left!);
      } else {
        return lca;
      }
    } else if (lca.right?.find(item1) is Node) {
      if (lca.right!.find(item2) is Node) {
        return lca.right!.lca(item1, item2, lca.right!);
      } else {
        return lca;
      }
    } else if (lca.right?.find(item2) is Node) {
      if (lca.right!.find(item1) is Node) {
        return lca.right!.lca(item1, item2, lca.right!);
      } else {
        return lca;
      }
    } else {
      throw FormatException("could not find either $item1 or $item2");
    }
  }

  @override
  String toString() {
    return 'Node with value: $value, right-hand value: ${right?.value} and left-hand value: ${left?.value}';
  }
}
