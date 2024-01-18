int rangePallindromeCount(int start, int end) {
  int count = 0;
  for (int i = start; i <= end; i++) {
    int temp = i;
    int revNum = 0;
    while (temp != 0) {
      revNum = temp * 10 + temp % 10;
      temp = temp ~/ 10;
    }
    if (revNum == i) {
      count++;
    }
  }
  return count;
}
