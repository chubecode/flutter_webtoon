import 'package:flutter_webtoon/common/utils.dart';

extension IntNullUtils on int? {
  int defaultZero() => defaultIfNull(0);
  int defaultIfNull(int defaultNumber) => this ?? defaultNumber;
  String format() => formatNumber(this.defaultZero());
}

extension DoubleNullUtils on double? {
  double defaultZero() => defaultIfNull(0.0);
  double defaultIfNull(double defaultNumber) => this ?? defaultNumber;
  String format() => formatNumberDouble(this.defaultZero());
}

