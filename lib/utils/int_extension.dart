extension IntExtension on int {
  parseToTimeString() {
    final int hour = this ~/ 60;
    final int minutes = this % 60;

    if (hour == 0) {
      return '${minutes.toString().padLeft(1, "0")}min';
    } else {
      return '${hour.toString()}:${minutes.toString().padLeft(2, "0")} h';
    }
  }
}
