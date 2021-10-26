class BTNode<T extends Comparable<T>> {
  final T value;
  BTNode<T>? left, right;
  BTNode({required this.value});

  void insert(T input) {
    if (value.compareTo(input) < 0) {
      if (right is BTNode) {
        right!.insert(input);
      } else {
        right = BTNode(value: input);
      }
    } else if (value.compareTo(input) > 0) {
      if (left is BTNode) {
        left!.insert(input);
      } else {
        left = BTNode(value: input);
      }
    } else {
      return;
    }
  }

  BTNode<T>? find(T item) {
    if (value.compareTo(item) == 0) {
      return this;
    } else if (value.compareTo(item) < 0) {
      return right?.find(item);
    } else {
      return left?.find(item);
    }
  }

  BTNode<T>? lca(T item1, T item2, BTNode<T> lca) {
    if (lca.left?.find(item1) is BTNode) {
      if (lca.left!.find(item2) is BTNode) {
        return lca.left!.lca(item1, item2, lca.left!);
      } else {
        return lca;
      }
    } else if (lca.left?.find(item2) is BTNode) {
      if (lca.left!.find(item1) is BTNode) {
        return lca.left!.lca(item1, item2, lca.left!);
      } else {
        return lca;
      }
    } else if (lca.right?.find(item1) is BTNode) {
      if (lca.right!.find(item2) is BTNode) {
        return lca.right!.lca(item1, item2, lca.right!);
      } else {
        return lca;
      }
    } else if (lca.right?.find(item2) is BTNode) {
      if (lca.right!.find(item1) is BTNode) {
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
    return 'Node with value: $value, left-hand value: ${left?.value} and right-hand value: ${right?.value}';
  }
}
