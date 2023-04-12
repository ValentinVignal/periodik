/// Extension on [Iterable].
extension IterableExtension<T> on Iterable<T> {
  /// Puts [separator] between every element.
  ///
  /// Example:
  ///
  /// ```dart
  /// final list1 = <int>[].separated(2); // [];
  /// final list2 = [0].separated(2); // [0];
  /// final list3 = [0, 0].separated(2); // [0, 2, 0];
  /// ```
  Iterable<T> separated(T separator) sync* {
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      yield iterator.current;
      while (iterator.moveNext()) {
        yield separator;
        yield iterator.current;
      }
    }
  }
}
