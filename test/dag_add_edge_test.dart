import 'dart:math';

import 'package:test/test.dart';
import '../bin/dag.dart';
import '../bin/vertex.dart';

main() {
  test("Add edges to int DAG", () {
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
    // Check that correct elements are children in the graph
    expect(dag.find(1)?.children!.where((element) => element.value == 2), true);
    expect(dag.find(1)?.children!.where((element) => element.value == 3), true);
    expect(dag.find(2)?.children!.where((element) => element.value == 3), true);
    expect(dag.find(3)?.children!.where((element) => element.value == 4), true);
    expect(dag.find(3)?.children!.where((element) => element.value == 5), true);
    expect(dag.find(4)?.children!.isEmpty, true);
    expect(dag.find(5)?.children!.where((element) => element.value == 6), true);
    expect(dag.find(6)?.children!.where((element) => element.value == 7), true);
    expect(dag.find(7)?.children!.where((element) => element.value == 8), true);
    expect(dag.find(7)?.children!.where((element) => element.value == 9), true);
    expect(dag.find(8)?.children!.where((element) => element.value == 9), true);
    expect(dag.find(9)?.children!.isEmpty, true);
    // Check that vertecies contain correct number of children
    expect(dag.find(1)?.children!.length, 2);
    expect(dag.find(2)?.children!.length, 1);
    expect(dag.find(3)?.children!.length, 2);
    expect(dag.find(4)?.children!.length, 0);
    expect(dag.find(5)?.children!.length, 1);
    expect(dag.find(6)?.children!.length, 1);
    expect(dag.find(7)?.children!.length, 2);
    expect(dag.find(8)?.children!.length, 1);
    expect(dag.find(9)?.children!.length, 0);
  });
  test("Add edges to string verticies in DAG", () {
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
    // Check that it contains the children
    expect(dag.find("a")?.children!.where((element) => element.value == "b"),
        true);
    expect(dag.find("a")?.children!.where((element) => element.value == "c"),
        true);
    expect(dag.find("b")?.children!.where((element) => element.value == "c"),
        true);
    expect(dag.find("c")?.children!.where((element) => element.value == "d"),
        true);
    expect(dag.find("d")?.children!.where((element) => element.value == "e"),
        true);
    expect(dag.find("e")?.children!.where((element) => element.value == "f"),
        true);
    expect(dag.find("e")?.children!.where((element) => element.value == "g"),
        true);
    expect(dag.find("e")?.children!.where((element) => element.value == "h"),
        true);
    expect(dag.find("f")?.children!.isEmpty, true);
    expect(dag.find("g")?.children!.isEmpty, true);
    expect(dag.find("h")?.children!.where((element) => element.value == "i"),
        true);
    expect(dag.find("i")?.children!.where((element) => element.value == "j"),
        true);
    expect(dag.find("i")?.children!.where((element) => element.value == "k"),
        true);
    expect(dag.find("j")?.children!.where((element) => element.value == "k"),
        true);
    expect(dag.find("k")?.children!.isEmpty, true);

    // Check the total number of children matches expected
    //  empty ones were checked previously and not included here
    expect(dag.find("a")?.children!.length, 2);
    expect(dag.find("b")?.children!.length, 1);
    expect(dag.find("c")?.children!.length, 1);
    expect(dag.find("d")?.children!.length, 1);
    expect(dag.find("e")?.children!.length, 3);
    expect(dag.find("h")?.children!.length, 1);
    expect(dag.find("i")?.children!.length, 2);
    expect(dag.find("j")?.children!.length, 1);
  });
}