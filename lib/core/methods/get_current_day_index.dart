
int getCurrentDayIndex() {
  final today = (DateTime.now().weekday+1)%7;
  return today;
}
