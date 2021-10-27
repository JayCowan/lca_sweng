import 'dart:io';

import 'binary_tree.dart';

void main(List<String> arguments) {
  List<num> list = <num>[];
  BinaryTree<num>? tree;
  if (stdin.hasTerminal) {
    print(
        'Enter numbers in order seperated by spaces to be added into a binary tree, type "done" when done');
    while (true) {
      var value = stdin.readLineSync();
      if (value != "done") {
        list.add(num.parse(value!));
      } else {
        break;
      }
    }
    tree = BinaryTree(rootValue: list.first);
    for (num element in list) {
      tree.insert(element);
    }
    print('first element for common ancestor: ');
    num first = num.parse(stdin.readLineSync()!);
    print('second element for common ancestor: ');
    num second = num.parse(stdin.readLineSync()!);
    var node = tree.lca(first, second);
    print('lca is ${node?.value.toString()}');
  } else {
    print('please try this in a terminal window');
  }
}
