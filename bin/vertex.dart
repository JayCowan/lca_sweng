import 'package:test/scaffolding.dart';

class Vertex<T> {
  Set<Vertex<T>> children = <Vertex<T>>{};
  final T value;
  Vertex({required this.value});

  /* Vertex<T>? find(T value) {
    if (this.value == value) {
      return this;
    } else {
      if (children is Set) {
        for (var child in children!) {
          return child.find(value);
        }
      }
    }
  } */

  Set<Vertex<T>> getAncestors(T value) {
    throw UnimplementedError();
  }

  Set<Vertex<T>> getDescendants() {
    var descendants = <Vertex<T>>{};
    for (var element in children) {
      descendants.add(element);
      descendants.addAll(element.getDescendants());
    }
    return descendants;
  }
}
