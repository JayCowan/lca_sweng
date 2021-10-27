import 'package:test/test.dart';
import '../bin/dag.dart';
import '../bin/vertex.dart';

main() {
  test("Create int vertecies for DAG", () {
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
    for (int i = 1; i < 10; i++) {
      expect(dag.find(i) is Vertex, true);
    }
  });
  test("Add string verticies to DAG", () {
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
    for (var char in "abcdefghijk".split("")) {
      expect(dag.find(char) is Vertex, true);
    }
  });
  test("Test addVertex to prevent repeat values.", () {
    var dag = DirectedAcyclicGraph<String>();
    for (var char in "Hello World!".split("")) {
      dag.addVertex(char);
    }
    expect(() => dag.graph.where((element) => element.value == "l").single,
        throwsStateError);
    expect(() => dag.graph.where((element) => element.value == "o").single,
        throwsStateError);
  });
}
