import 'package:test/test.dart';
import '../bin/dag.dart';
import '../bin/vertex.dart';

main() {
  test("Test creation of a DAG without root -- should be false", () {
    DirectedAcyclicGraph<Object>? dag;
    expect(dag is DirectedAcyclicGraph<Object>, false);
  });
  test("create DAG with a root", () {
    var dag = DirectedAcyclicGraph<Object>(rootValue: 0);
    expect(dag.root is Vertex, true);
  });
}
