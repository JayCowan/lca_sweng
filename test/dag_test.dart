import 'package:test/test.dart';
import '../bin/dag.dart';

main() {
  test("Test creation of a DAG", () {
    late DirectedAcyclicGraph dag;
    expect(() => dag = DirectedAcyclicGraph(), (dag is DirectedAcyclicGraph));
  });
  test("create DAG with a root", () {
    late DirectedAcyclicGraph dag;
    
  });
}
