extension ListNullUtils <T> on List<T>? {
  List<T> defaultEmpty() => defaultIfNull(List.empty());
  List<T> defaultIfNull(List<T> defaultValue) => this ?? defaultValue;
}
