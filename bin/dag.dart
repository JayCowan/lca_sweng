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
    var degree = graph.where((element) =>
        element.children.where((element) => element.value == value).isNotEmpty);
    traversal.addAll(degree);
    for (var element in degree) {
      traversal.addAll(getAncestors(element.value));
    }
    return traversal;
  }

  Set<Vertex<T>>? getDescendants(T value) {
    return find(value)?.getDescendants();
  }

  Vertex<T>? lca(
    T val1,
    T val2,
  ) {
    var vert1 = find(val1)!;
    var vert2 = find(val2)!;
    if ((graph.any((element) => element.children.contains(vert1)) &&
            graph.any((element) => element.children.contains(vert2))) ||
        (val1 == val2)) {
      if (vert1.getDescendants().contains(vert2)) {
        return vert1;
      } else if (vert2.getDescendants().contains(vert1)) {
        return vert2;
      } else {
        return lca(
            graph
                .firstWhere((element) => element.children.contains(vert1),
                    orElse: () => vert1)
                .value,
            val2);
      }
    } else {
      throw ArgumentError("Invalid arguments provided");
    }
  }
}
