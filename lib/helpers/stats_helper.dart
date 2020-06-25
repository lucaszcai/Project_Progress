class StatsHelper {
  List<String> monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  List<int> monthDays = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];

  int dateToInt(DateTime givenDate) {
    return monthDays[givenDate.month - 1] +
        givenDate.day +
        (givenDate.year - 2018) * 365;
  }

  String intToDateString(int givenInt) {
    int year = givenInt ~/ 365;
    givenInt %= 365;
    print(givenInt);
    int month = 1;
    for (; monthDays[month] < givenInt; month++) {}
    month -= 1;
    int day = givenInt - monthDays[month];
    return monthNames[month] + ' ' + day.toString();
  }

  String dateTimeToDateString(DateTime date) {
    return monthNames[date.month - 1] +
        ' ' +
        date.day.toString() +
        ' ' +
        date.year.toString();
  }
}
