import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import '../bin/dag.dart';

main() {
  test("Test LCA one degree above", () {
    var dag = DirectedAcyclicGraph<int>();
    for (var i = 1; i < 7; i++) {
      dag.addVertex(i);
    }
    dag.addEdge(1, 2);
    dag.addEdge(2, 3);
    dag.addEdge(2, 6);
    dag.addEdge(3, 4);
    dag.addEdge(3, 5);
    dag.addEdge(4, 5);
    expect(dag.lca(6, 3), dag.find(2));
  });
  test("Test LCA of itself", () {
    var dag = DirectedAcyclicGraph<int>();
    for (var i = 1; i < 7; i++) {
      dag.addVertex(i);
    }
    dag.addEdge(1, 2);
    dag.addEdge(2, 3);
    dag.addEdge(2, 6);
    dag.addEdge(3, 4);
    dag.addEdge(3, 5);
    dag.addEdge(4, 5);
    expect(dag.lca(4, 5), dag.find(4));
  });
  test("Test LCA further up graph", () {
    var dag = DirectedAcyclicGraph<int>();
    for (var i = 1; i < 7; i++) {
      dag.addVertex(i);
    }
    dag.addEdge(1, 2);
    dag.addEdge(2, 3);
    dag.addEdge(2, 6);
    dag.addEdge(3, 4);
    dag.addEdge(3, 5);
    dag.addEdge(4, 5);
    expect(dag.lca(4, 6), dag.find(2));
  });
  test("Test lca with no common ancestors", () {
    var dag = DirectedAcyclicGraph<String>();
    for (var char in "abcdefg".split("")) {
      dag.addVertex(char);
    }
    dag.addEdge("a", "b");
    dag.addEdge("a", "f");
    dag.addEdge("a", "g");
    dag.addEdge("b", "c");
    dag.addEdge("c", "e");
    dag.addEdge("d", "f");
    // Note that "d" has no ancestors
    // This should throw a stack overflow exception
    expect(() => dag.lca("e", "d"), throwsArgumentError);
    expect(() => dag.lca("b", "b"), throwsArgumentError);
  });
}
