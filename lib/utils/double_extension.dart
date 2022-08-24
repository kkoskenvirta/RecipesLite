extension DoubleExtension on double {
  String doubleToPrettyString() => this.toStringAsFixed(2).replaceFirst(RegExp(r'\.?0*$'), '');
}
