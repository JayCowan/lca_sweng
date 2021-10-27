// ignore_for_file: unnecessary_cast


import 'package:test/test.dart';
import '../bin/binary_tree.dart';

void main() {
  test('Insert One Value', () {
    var tree = BinaryTree<num>(rootValue: 15);
    tree.insert(12);
    expect(tree.root.left?.value, 12);
  });
  test('Insert Several Values', () {
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
    // Check left hand side of tree
    expect(tree.root.left?.value, 200);
    expect(tree.root.left?.left?.value, 100);
    expect(tree.root.left?.right?.value, 225);
    expect(tree.root.left?.left?.left?.value, 50);
    expect(tree.root.left?.left?.right?.value, 175);
    expect(tree.root.left?.left?.right?.right?.value, 190);
    // Check right hand side of tree
    expect(tree.root.right?.value, 300);
    expect(tree.root.right?.left?.value, 275);
    expect(tree.root.right?.right?.value, 350);
    expect(tree.root.right?.left?.left?.value, 270);
  });
  test('Test Insert Signed', () {
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
    // Test left side of tree
    expect(tree.root.left?.value, -10);
    expect(tree.root.left?.left?.value, -180);
    expect(tree.root.left?.right?.value, 12);
    expect(tree.root.left?.left?.left?.value, -200);
    expect(tree.root.left?.left?.right?.value, -70);
    expect(tree.root.left?.right?.right?.value, 13);
    expect(tree.root.left?.left?.right?.right?.value, -50);
    // Test right side of tree
    expect(tree.root.right?.value, 50);
    expect(tree.root.right?.left?.value, 35);
    expect(tree.root.right?.right?.value, 57);
    expect(tree.root.right?.right?.left?.value, 52);
  });
  test('Test Insert with Float and Int type casting', () {
    var tree = BinaryTree<num>(rootValue: 10.5);
    tree.insert(6 as int);
    tree.insert(12.7);
    tree.insert(-2.1);
    tree.insert(7.2);
    tree.insert(11 as int);
    tree.insert(368.9);
    tree.insert(-16.7);
    tree.insert(-1 as int);

    // Check left side of tree
    expect(tree.root.left?.value is int, 6 is int);
    expect(tree.root.left?.value, 6);
    expect(tree.root.left?.left?.value is double, -2.1 is double);
    expect(tree.root.left?.left?.value, -2.1);
    expect(tree.root.left?.right?.value is double, 7.2 is double);
    expect(tree.root.left?.right?.value, 7.2);
    expect(tree.root.left?.left?.left?.value is double, -16.7 is double);
    expect(tree.root.left?.left?.left?.value, -16.7);
    expect(tree.root.left?.left?.right?.value is int, -1 is int);
    expect(tree.root.left?.left?.right?.value, -1);
    // Check right hand side of tree
    expect(tree.root.right?.value is double, 12.7 is double);
    expect(tree.root.right?.value, 12.7);
    expect(tree.root.right?.left?.value is int, 11 is int);
    expect(tree.root.right?.left?.value, 11);
    expect(tree.root.right?.right?.value is double, 368.9 is double);
    expect(tree.root.right?.right?.value, 368.9);
  });
}
