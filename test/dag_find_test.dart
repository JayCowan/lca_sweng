import 'package:test/test.dart';
import '../bin/dag.dart';

main() {
  test("Find vertecies from int DAG", () {
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
      expect(
          dag.find(i), dag.graph.where((element) => element.value == i).single);
    }
  });
  test("Find vertecies from String DAG", () {
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
      expect(dag.find(char),
          dag.graph.where((element) => element.value == char).single);
    }
  });
}
