import 'package:test/test.dart';
import '../bin/dag.dart';
import '../bin/vertex.dart';

main() {
  test("Get descendants of an int DAG", () {
    var dag = DirectedAcyclicGraph<int>();
    dag.addVertex(1);
    dag.addVertex(2);
    dag.addVertex(3);
    dag.addVertex(4);
    dag.addVertex(5);
    dag.addVertex(6);
    dag.addVertex(7);
    dag.addVertex(8);
    dag.addVertex(9);
    dag.addEdge(1, 2);
    dag.addEdge(1, 3);
    dag.addEdge(2, 3);
    dag.addEdge(3, 4);
    dag.addEdge(3, 5);
    dag.addEdge(5, 6);
    dag.addEdge(6, 7);
    dag.addEdge(7, 8);
    dag.addEdge(7, 9);
    dag.addEdge(8, 9);
    expect(dag.getDescendants(1), <Vertex<int>>{
      dag.find(2)!,
      dag.find(3)!,
      dag.find(4)!,
      dag.find(5)!,
      dag.find(6)!,
      dag.find(7)!,
      dag.find(8)!,
      dag.find(9)!
    });
    expect(dag.getDescendants(2), <Vertex<int>>{
      dag.find(3)!,
      dag.find(4)!,
      dag.find(5)!,
      dag.find(6)!,
      dag.find(7)!,
      dag.find(8)!,
      dag.find(9)!
    });
    expect(dag.getDescendants(3), <Vertex<int>>{
      dag.find(4)!,
      dag.find(5)!,
      dag.find(6)!,
      dag.find(7)!,
      dag.find(8)!,
      dag.find(9)!
    });
    expect(dag.getDescendants(4), <Vertex<int>>{});
    expect(dag.getDescendants(5),
        <Vertex<int>>{dag.find(6)!, dag.find(7)!, dag.find(8)!, dag.find(9)!});
    expect(dag.getDescendants(6),
        <Vertex<int>>{dag.find(7)!, dag.find(8)!, dag.find(9)!});
    expect(dag.getDescendants(7), <Vertex<int>>{dag.find(8)!, dag.find(9)!});
    expect(dag.getDescendants(8), <Vertex<int>>{dag.find(9)!});
    expect(dag.getDescendants(9), <Vertex<int>>{});
  });
  test("Get descendants of String DAG", () {
    var dag = DirectedAcyclicGraph<String>();
    dag.addVertex("a");
    dag.addVertex("b");
    dag.addVertex("c");
    dag.addVertex("d");
    dag.addVertex("e");
    dag.addVertex("f");
    dag.addVertex("g");
    dag.addVertex("h");
    dag.addVertex("i");
    dag.addVertex("j");
    dag.addVertex("k");
    dag.addEdge("a", "b");
    dag.addEdge("a", "c");
    dag.addEdge("b", "c");
    dag.addEdge("c", "d");
    dag.addEdge("d", "e");
    dag.addEdge("e", "f");
    dag.addEdge("e", "g");
    dag.addEdge("e", "h");
    dag.addEdge("h", "i");
    dag.addEdge("i", "j");
    dag.addEdge("i", "k");
    dag.addEdge("j", "k");
    expect(dag.getDescendants("a"), <Vertex<String>>{
      dag.find("b")!,
      dag.find("c")!,
      dag.find("d")!,
      dag.find("e")!,
      dag.find("f")!,
      dag.find("g")!,
      dag.find("h")!,
      dag.find("i")!,
      dag.find("j")!,
      dag.find("k")!
    });
    expect(dag.getDescendants("b"), <Vertex<String>>{
      dag.find("c")!,
      dag.find("d")!,
      dag.find("e")!,
      dag.find("f")!,
      dag.find("g")!,
      dag.find("h")!,
      dag.find("i")!,
      dag.find("j")!,
      dag.find("k")!
    });
    expect(dag.getDescendants("c"), <Vertex<String>>{
      dag.find("d")!,
      dag.find("e")!,
      dag.find("f")!,
      dag.find("g")!,
      dag.find("h")!,
      dag.find("i")!,
      dag.find("j")!,
      dag.find("k")!
    });
    expect(dag.getDescendants("d"), <Vertex<String>>{
      dag.find("e")!,
      dag.find("f")!,
      dag.find("g")!,
      dag.find("h")!,
      dag.find("i")!,
      dag.find("j")!,
      dag.find("k")!
    });
    expect(dag.getDescendants("e"), <Vertex<String>>{
      dag.find("f")!,
      dag.find("g")!,
      dag.find("h")!,
      dag.find("i")!,
      dag.find("j")!,
      dag.find("k")!
    });
    expect(dag.getDescendants("f"), <Vertex<String>>{});
    expect(dag.getDescendants("g"), <Vertex<String>>{});
    expect(dag.getDescendants("h"),
        <Vertex<String>>{dag.find("i")!, dag.find("j")!, dag.find("k")!});
    expect(dag.getDescendants("i"),
        <Vertex<String>>{dag.find("j")!, dag.find("k")!});
    expect(dag.getDescendants("j"), <Vertex<String>>{dag.find("k")!});
    expect(dag.getDescendants("k"), <Vertex<String>>{});
  });
}
