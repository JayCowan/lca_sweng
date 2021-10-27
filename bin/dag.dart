import 'dart:collection';
import 'vertex.dart';

class DirectedAcyclicGraph<T> {
  HashSet<Vertex<T>> graph = HashSet<Vertex<T>>();

  DirectedAcyclicGraph();

  Vertex<T>? find(T value) {
    return graph.where((element) => element.value == value).single;
  }

  bool addEdge(T from, T to) {
    var toVertex = find(to);
    var fromVertex = find(from);
    if (!toVertex!.getDescendants().contains(fromVertex)) {
      return fromVertex!.children.add(toVertex);
    } else {
      return false;
    }
  }

  bool addVertex(T value) {
    return graph.add(Vertex<T>(value: value));
  }

  Set<Vertex<T>> getAncestors(T value) {
    var traversal = <Vertex<T>>{};
    return traversal;
  }

  Set<Vertex<T>>? getDescendants(T value) {
    return find(value)?.getDescendants();
  }
}
