// ignore_for_file: unnecessary_cast

import 'package:test/test.dart';
import '../bin/binary_tree.dart';

main() {
  test('LCA Single Element -- Should Throw Error', () {
    var tree = BinaryTree<num>(rootValue: 15);
    expect(() => tree.lca(15, 15), throwsFormatException);
  });
  test('LCA Integer Elements', () {
    var tree = BinaryTree<num>(rootValue: 250);
    tree.insert(200);
    tree.insert(300);
    tree.insert(100);
    tree.insert(225);
    tree.insert(275);
    tree.insert(350);
    tree.insert(50);
    tree.insert(175);
    tree.insert(270);
    tree.insert(190);

    // Find lca on left
    expect(tree.lca(50, 225), tree.root.left);
    // Find lca on right
    expect(tree.lca(270, 350), tree.root.right);
    // Find lca on both sides
    expect(tree.lca(190, 270), tree.root);
    // Flip some values from above
    expect(tree.lca(225, 50), tree.root.left);
    // Again flip the right
    expect(tree.lca(350, 270), tree.root.right);
    // LCA of itself
    expect(tree.lca(175, 190), tree.root.left?.left?.right);
  });
  test('LCA with Signed Integers', () {
    var tree = BinaryTree<num>(rootValue: 30);
    tree.insert(-10);
    tree.insert(50);
    tree.insert(-180);
    tree.insert(12);
    tree.insert(35);
    tree.insert(57);
    tree.insert(-200);
    tree.insert(-70);
    tree.insert(13);
    tree.insert(52);
    tree.insert(-50);

    // LCA on left
    expect(tree.lca(-200, -50), tree.root.left?.left);
    // Flip above values
    expect(tree.lca(-50, -200), tree.root.left?.left);
    // LCA on right
    expect(tree.lca(52, 35), tree.root.right);
    // Flip above values
    expect(tree.lca(35, 52), tree.root.right);
    // Test either side of tree
    expect(tree.lca(-70, 57), tree.root);
    // Flip above value
    expect(tree.lca(57, -70), tree.root);
    // LCA of itself
    expect(tree.lca(13, 12), tree.root.left?.right);
  });
  test('LCA with Double and Int', () {
    var tree = BinaryTree<num>(rootValue: 10.5);
    tree.insert(6 as int);
    tree.insert(12.7);
    tree.insert(-2.1);
    tree.insert(7.2);
    tree.insert(11 as int);
    tree.insert(368.9);
    tree.insert(-16.7);
    tree.insert(-1 as int);

    // Find lca on left
    expect(tree.lca(-2.1, 7.2), tree.root.left);
    // Flip above values
    expect(tree.lca(7.2, -2.1), tree.root.left);
    // Find lca on right
    expect(tree.lca(368.9, 11), tree.root.right);
    // Flip above values
    expect(tree.lca(11, 368.9), tree.root.right);
    // Find lca on either side of the tree
    expect(tree.lca(-1, 11), tree.root);
    // Flip above values
    expect(tree.lca(11, -1), tree.root);
  });
}
