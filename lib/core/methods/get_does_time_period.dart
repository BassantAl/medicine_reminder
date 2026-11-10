
enum DoseTimePeriod { morning, afternoon, evening, night }
DoseTimePeriod getDoseTimePeriod(String doseTime) {
  final hour = int.parse(doseTime.split(':')[0]);

  if (hour >= 5 && hour < 12) {
    return DoseTimePeriod.morning;
  } else if (hour >= 12 && hour < 17) {
    return DoseTimePeriod.afternoon;
  } else if (hour >= 17 && hour < 21) {
    return DoseTimePeriod.evening;
  } else {
    return DoseTimePeriod.night;
  }
}
