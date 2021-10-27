import 'package:test/test.dart';
import '../bin/dag.dart';
import '../bin/vertex.dart';

main() {
  test("Get ancestors of an int DAG", () {
    var dag = DirectedAcyclicGraph<int>(rootValue: 1);
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
    expect(dag.getAncestors(1), <Vertex<int>>{});
    expect(dag.getAncestors(2), <Vertex<int>>{dag.find(1)!});
    expect(dag.getAncestors(3), <Vertex<int>>{dag.find(1)!, dag.find(2)!});
    expect(dag.getAncestors(4),
        <Vertex<int>>{dag.find(1)!, dag.find(2)!, dag.find(3)!});
    expect(dag.getAncestors(5),
        <Vertex<int>>{dag.find(1)!, dag.find(2)!, dag.find(3)!});
    expect(dag.getAncestors(6),
        <Vertex<int>>{dag.find(1)!, dag.find(2)!, dag.find(3)!, dag.find(5)!});
    expect(dag.getAncestors(7), <Vertex<int>>{
      dag.find(1)!,
      dag.find(2)!,
      dag.find(3)!,
      dag.find(5)!,
      dag.find(6)!
    });
    expect(dag.getAncestors(8), <Vertex<int>>{
      dag.find(1)!,
      dag.find(2)!,
      dag.find(3)!,
      dag.find(5)!,
      dag.find(6)!,
      dag.find(7)!
    });
    expect(dag.getAncestors(9), <Vertex<int>>{
      dag.find(1)!,
      dag.find(2)!,
      dag.find(3)!,
      dag.find(5)!,
      dag.find(6)!,
      dag.find(7)!,
      dag.find(8)!
    });
  });
  test("Get ancestors of a String DAG", () {
    var dag = DirectedAcyclicGraph<String>(rootValue: "a");
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
    expect(dag.getAncestors("k"), <Vertex<String>>{
      dag.find("a")!,
      dag.find("b")!,
      dag.find("c")!,
      dag.find("d")!,
      dag.find("e")!,
      dag.find("h")!,
      dag.find("i")!,
      dag.find("j")!
    });
    expect(dag.getAncestors("j"), <Vertex<String>>{
      dag.find("a")!,
      dag.find("b")!,
      dag.find("c")!,
      dag.find("d")!,
      dag.find("e")!,
      dag.find("h")!,
      dag.find("i")!,
    });
    expect(dag.getAncestors("i"), <Vertex<String>>{
      dag.find("a")!,
      dag.find("b")!,
      dag.find("c")!,
      dag.find("d")!,
      dag.find("e")!,
      dag.find("h")!
    });
    expect(dag.getAncestors("h"), <Vertex<String>>{
      dag.find("a")!,
      dag.find("b")!,
      dag.find("c")!,
      dag.find("d")!,
      dag.find("e")!
    });
    expect(dag.getAncestors("g"), <Vertex<String>>{
      dag.find("a")!,
      dag.find("b")!,
      dag.find("c")!,
      dag.find("d")!,
      dag.find("e")!
    });
    expect(dag.getAncestors("f"), <Vertex<String>>{
      dag.find("a")!,
      dag.find("b")!,
      dag.find("c")!,
      dag.find("d")!,
      dag.find("e")!
    });
    expect(dag.getAncestors("e"), <Vertex<String>>{
      dag.find("a")!,
      dag.find("b")!,
      dag.find("c")!,
      dag.find("d")!
    });
    expect(dag.getAncestors("d"),
        <Vertex<String>>{dag.find("a")!, dag.find("b")!, dag.find("c")!});
    expect(dag.getAncestors("c"),
        <Vertex<String>>{dag.find("a")!, dag.find("b")!});
    expect(dag.getAncestors("b"), <Vertex<String>>{dag.find("a")!});
    expect(dag.getAncestors("a"), <Vertex<String>>{});
  });
}
