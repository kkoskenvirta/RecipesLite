createScaling(double scrollPosition) {
  double scale = 0;
  if (scrollPosition == 0) {
    scale = 1.1;
  } else if (scrollPosition > 0) {
    scale = 1.1 - (scrollPosition.floor() / 4000);
  } else if (scrollPosition < 0) {
    scale = 1.1 - (scrollPosition.floor() / 400);
  }
  return scale;
}
