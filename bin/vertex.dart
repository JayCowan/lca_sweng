class Vertex<T> {
  Set<Vertex<T>> children = <Vertex<T>>{};
  final T value;
  Vertex({required this.value});

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
