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
    return nodes.firstWhere((element) => element.value == value);
  }

  bool addEdge(T from, T to) {
    var toVertex = find(to);
    return find(from)!.children!.add(toVertex!);
  }

  bool addVertex(T value) {
    return nodes.add(Vertex<T>(value: value));
  }

  Set<Vertex<T>> getAncestors(T value) {
    throw UnimplementedError();
  }

  Set<Vertex<T>>? getDescendants(T value) {
    return find(value)?.getDescendants();
  }
}
