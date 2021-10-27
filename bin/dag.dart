import 'dart:collection';
import 'vertex.dart';

class DirectedAcyclicGraph<T> {
  late final Vertex<T> root;
  HashSet<Vertex<T>> nodes = HashSet<Vertex<T>>();

  DirectedAcyclicGraph({required T rootValue}) {
    root = Vertex(value: rootValue);
    nodes.add(root);
  }

  Vertex<T>? find(T value) {
    for (var element in nodes) {
      if (element.value == value) {
        return element;
      }
    }
  }

  void addEdge(T from, T to) {
    throw UnimplementedError();
  }

  Vertex<T>? addVertex(T value) {
    throw UnimplementedError();
  }

  Set<Vertex<T>> getAncestors(T value) {
    throw UnimplementedError();
  }

  Set<Vertex<T>> getDescendants(T value) {
    throw UnimplementedError();
  }
}
