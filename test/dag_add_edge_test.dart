import 'package:test/test.dart';
import '../bin/dag.dart';

main() {
  test("Add edges to int DAG", () {
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
    // Check that correct elements are children in the graph
    expect(
        dag.find(1)?.children.containsAll({dag.find(2)!, dag.find(3)!}), true);
    expect(dag.find(2)?.children.containsAll({dag.find(3)!}), true);
    expect(
        dag.find(3)?.children.containsAll({dag.find(4)!, dag.find(5)!}), true);
    expect(dag.find(4)?.children.isEmpty, true);
    expect(dag.find(5)?.children.containsAll({dag.find(6)!}), true);
    expect(dag.find(6)?.children.containsAll({dag.find(7)!}), true);
    expect(
        dag.find(7)?.children.containsAll({dag.find(8)!, dag.find(9)!}), true);
    expect(dag.find(8)?.children.containsAll({dag.find(9)!}), true);
    expect(dag.find(9)?.children.isEmpty, true);
    // Check that vertecies contain correct number of children
    expect(dag.find(1)?.children.length, 2);
    expect(dag.find(2)?.children.length, 1);
    expect(dag.find(3)?.children.length, 2);
    expect(dag.find(4)?.children.length, 0);
    expect(dag.find(5)?.children.length, 1);
    expect(dag.find(6)?.children.length, 1);
    expect(dag.find(7)?.children.length, 2);
    expect(dag.find(8)?.children.length, 1);
    expect(dag.find(9)?.children.length, 0);
  });
  test("Add edges to string verticies in DAG", () {
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
    // Check that it contains the children
    expect(
        dag.find("a")?.children.containsAll({dag.find("b")!, dag.find("c")!}),
        true);
    expect(dag.find("b")?.children.containsAll({dag.find("c")!}), true);
    expect(dag.find("c")?.children.containsAll({dag.find("d")!}), true);
    expect(dag.find("d")?.children.containsAll({dag.find("e")!}), true);
    expect(
        dag
            .find("e")
            ?.children
            .containsAll({dag.find("f")!, dag.find("g")!, dag.find("h")}),
        true);
    expect(dag.find("f")?.children.isEmpty, true);
    expect(dag.find("g")?.children.isEmpty, true);
    expect(dag.find("h")?.children.containsAll({dag.find("i")!}), true);
    expect(
        dag.find("i")?.children.containsAll({dag.find("j")!, dag.find("k")!}),
        true);
    expect(dag.find("j")?.children.containsAll({dag.find("k")!}), true);
    expect(dag.find("k")?.children.isEmpty, true);

    // Check the total number of children matches expected
    //  empty ones were checked previously and not included here
    expect(dag.find("a")?.children.length, 2);
    expect(dag.find("b")?.children.length, 1);
    expect(dag.find("c")?.children.length, 1);
    expect(dag.find("d")?.children.length, 1);
    expect(dag.find("e")?.children.length, 3);
    expect(dag.find("h")?.children.length, 1);
    expect(dag.find("i")?.children.length, 2);
    expect(dag.find("j")?.children.length, 1);
  });

  test("Test to prevent cyclic graphs from being created", () {
    var dag = DirectedAcyclicGraph<int>();
    dag.addVertex(1);
    dag.addVertex(2);
    dag.addVertex(3);
    dag.addEdge(1, 2);
    dag.addEdge(2, 3);
    expect(dag.addEdge(3, 1), false);
    expect(dag.find(3)?.children.where((element) => element.value == 1).isEmpty,
        true);
  });
}
