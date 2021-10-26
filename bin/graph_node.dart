class GraphNode<T> {
  Set<GraphNode<T>>? children = <GraphNode<T>>{};
  final T value;
  GraphNode({required this.value});

  GraphNode<T> find(T value) {
    throw UnimplementedError();
  }

  void addEdge(T to) {
    throw UnimplementedError();
  }

  GraphNode<T>? addVertex(T value) {
    throw UnimplementedError();
  }

  Set<GraphNode<T>> getAncestors(T value) {
    throw UnimplementedError();
  }

  Set<GraphNode<T>> getDescendants(T value) {
    throw UnimplementedError();
  }
}
