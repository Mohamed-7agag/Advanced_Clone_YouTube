String refactNumber(String? text) {
  if (text != null) {
    int number = int.parse(text);
    double a = 0, b = 0;
    if (number >= 1000000) {
      a = number / 1000000;
      b = number % 1000000;
      b.toString().substring(1);
      return "${a.toInt()}.${b.toString().substring(0,1)}M";
    } else if (number >= 1000) {
      a = number / 1000;
      b = number % 1000;
      return "${a.toInt()}.${b.toString().substring(0,1)}K";
    }
  }
  return "0";
}
