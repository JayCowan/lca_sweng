import 'package:test/test.dart';
import '../bin/dag.dart';
import '../bin/vertex.dart';

main() {
  test("Test creation of a DAG without root -- should be false", () {
    DirectedAcyclicGraph<Object>? dag;
    expect(dag is DirectedAcyclicGraph<Object>, false);
  });
  test("create DAG with a vertex", () {
    var dag = DirectedAcyclicGraph<Object>();
    dag.addVertex(1);
    expect(dag.graph.first is Vertex, true);
  });
  // TODO: Refactor to take into account non, repeated values
  test("create DAG with string values", () {
    var dag = DirectedAcyclicGraph<String>();
    dag.addVertex("H");
    dag.addVertex("e");
    dag.addVertex("l");
    dag.addVertex("l");
    dag.addVertex("o");
    dag.addVertex(" ");
    dag.addVertex("W");
    dag.addVertex("o");
    dag.addVertex("r");
    dag.addVertex("l");
    dag.addVertex("d");
    dag.addVertex("!");
    for (var char in "Hello World!".split("")) {
      expect(dag.find(char) is Vertex, true);
    }
  });
}
