extension DateTimeX on DateTime {
  bool isSameDayAs(DateTime other) {
    return rounded == other.rounded;
  }

  DateTime get rounded => DateTime(year, month, day);

  bool isBeforeOrSameAs(DateTime other) {
    return rounded.isBefore(other) || isSameDayAs(other);
  }

  bool isAfterOrSameAs(DateTime other) {
    return rounded.isAfter(other) || isSameDayAs(other);
  }
}
