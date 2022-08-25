enum FontSize {
  verySmall,
  small,
  smallPlus,
  medium,
  mediumPlus,
  large,
  veryLarge;
}

smallTextFontSize(FontSize fontSize) {
  switch (fontSize) {
    case FontSize.verySmall:
      return 10;
    case FontSize.small:
      return 12;
    case FontSize.smallPlus:
      return 14;
    case FontSize.medium:
      return 16;
    case FontSize.mediumPlus:
      return 18;
    case FontSize.large:
      return 20;
    case FontSize.veryLarge:
      return 26;
    default:
      return 16;
  }
}

largeTextFontSize(FontSize fontSize) {
  switch (fontSize) {
    case FontSize.verySmall:
      return 10;
    case FontSize.small:
      return 12;
    case FontSize.smallPlus:
      return 14;
    case FontSize.medium:
      return 16;
    case FontSize.mediumPlus:
      return 19;
    case FontSize.large:
      return 20;
    case FontSize.veryLarge:
      return 26;
    default:
      return 16;
  }
}
