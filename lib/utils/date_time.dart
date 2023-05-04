extension DateTimeX on DateTime {
  bool isSameDayAs(DateTime other) {
    return rounded == other.rounded;
  }

  DateTime get rounded => DateTime(year, month, day);
}
