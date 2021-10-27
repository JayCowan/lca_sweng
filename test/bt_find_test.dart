// ignore_for_file: unnecessary_cast

import 'package:test/test.dart';
import '../bin/binary_tree.dart';

main() {
  test('Find Single Value', () {
    var tree = BinaryTree<num>(rootValue: 15);
    expect(tree.find(15), tree.root);
  });
  test('Find Positive Integer', () {
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
    // find value on left
    expect(tree.find(200), tree.root.left);
    //find value deep in left
    expect(tree.find(190), tree.root.left?.left?.right?.right);
    //find value deep in right
    expect(tree.find(270), tree.root.right?.left?.left);
  });

  test('Test Find with Signed and Unsigned', () {
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

    // Find value on left
    expect(tree.find(-10), tree.root.left);
    // Find value deep in left
    expect(tree.find(-50), tree.root.left?.left?.right?.right);
    // Find value on right
    expect(tree.find(50), tree.root.right);
    // Find value deep in right
    expect(tree.find(52), tree.root.right?.right?.left);
  });
  test('Test Find with Int and Double', () {
    var tree = BinaryTree<num>(rootValue: 10.5);
    tree.insert(6 as int);
    tree.insert(12.7);
    tree.insert(-2.1);
    tree.insert(7.2);
    tree.insert(11 as int);
    tree.insert(368.9);
    tree.insert(-16.7);
    tree.insert(-1 as int);

    // Find value on left
    expect(tree.find(6), tree.root.left);
    // Find value deep in left
    expect(tree.find(-16.7), tree.root.left?.left?.left);
    // Find value on right
    expect(tree.find(12.7), tree.root.right);
    // Find value deep on right
    expect(tree.find(11), tree.root.right?.left);
  });
}
