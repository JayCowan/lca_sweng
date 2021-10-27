class Vertex<T> {
  Set<Vertex<T>>? children = <Vertex<T>>{};
  final T value;
  Vertex({required this.value});

  Vertex<T> find(T value) {
    throw UnimplementedError();
  }

  void addEdge(T to) {
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
