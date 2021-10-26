import 'graph_node.dart';

class DirectedAcyclicGraph<T> {
  final GraphNode<T> root;
  DirectedAcyclicGraph(this.root);

  GraphNode<T> find(T value) {
    throw UnimplementedError();
  }

  void addEdge(T from, T to) {
    throw UnimplementedError();
  }

  GraphNode<T>? addVertex(T value, T from) {
    throw UnimplementedError();
  }

  Set<GraphNode<T>> getAncestors(T value) {
    throw UnimplementedError();
  }

  Set<GraphNode<T>> getDescendants(T value) {
    throw UnimplementedError();
  }
}
