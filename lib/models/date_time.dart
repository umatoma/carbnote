enum DateTimeUnit {
  day,
  week,
  month,
  year,
}

extension ExDateTime on DateTime {
  DateTime startOfDay() {
    return DateTime(year, month, day);
  }

  DateTime endOfDay() {
    return DateTime(year, month, day, 23, 59, 59, 999);
  }

  DateTime startOfWeek() {
    switch (weekday) {
      case DateTime.monday:
        return subtract(const Duration(days: 0)).startOfDay();
      case DateTime.tuesday:
        return subtract(const Duration(days: 1)).startOfDay();
      case DateTime.wednesday:
        return subtract(const Duration(days: 2)).startOfDay();
      case DateTime.thursday:
        return subtract(const Duration(days: 3)).startOfDay();
      case DateTime.friday:
        return subtract(const Duration(days: 4)).startOfDay();
      case DateTime.saturday:
        return subtract(const Duration(days: 5)).startOfDay();
      case DateTime.sunday:
        return subtract(const Duration(days: 6)).startOfDay();
      default:
        throw UnimplementedError('$weekdayの処理がありません');
    }
  }

  DateTime startOfMonth() {
    return DateTime(year, month, 1);
  }
}
