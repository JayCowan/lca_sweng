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
}
