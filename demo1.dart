import 'dart:io';

import 'demo2.dart';

void main() {
  print("Enter Range:");
  int start = int.parse(stdin.readLineSync()!);
  int end = int.parse(stdin.readLineSync()!);

  print("Total Count of Pallindrome Number : ");
  int count = rangePallindromeCount(start, end);
  print(count);
}
