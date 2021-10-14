// transformar a duração de minutos para horas
String durationToHours(int minutes) {
  var d = Duration(minutes: minutes);
  List<String> parts = d.toString().split(':');
  return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
}

// calcular uma lista de durações e a retornar em minutos
int calculateTotalDurationToMinutes(List<Duration> durationList) {
  var totalDuration = 0;
  for (var i = 0; i < durationList.length; i++) {
    totalDuration += durationList[i].inMinutes;
  }
  return totalDuration;
}
