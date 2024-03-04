class IndividualChartData {
  final double x; //for position
  final double y; //for amount
  final String day; //for day

  IndividualChartData({required this.x, required this.y, required this.day});

  @override
  String toString() {
    return "No.: $x ,amount: $y ,day: $day";
  }
}
