class Vertex<T> {
  Set<Vertex<T>>? children = <Vertex<T>>{};
  final T value;
  Vertex({required this.value});

  Vertex<T>? find(T value) {
    if (this.value == value) {
      return this;
    } else {
      if (children is Set) {
        for (var child in children!) {
          return child.find(value);
        }
      }
    }
  }

  Set<Vertex<T>> getAncestors(T value) {
    throw UnimplementedError();
  }

  Set<Vertex<T>> getDescendants(T value) {
    throw UnimplementedError();
  }
}
