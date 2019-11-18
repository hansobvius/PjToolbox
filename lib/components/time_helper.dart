//Formata objeto Duration para string no formato HH:MM:SS
String TimeFormater(Duration duration) {
  String twoDigitMinutes = _twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = _twoDigits(duration.inSeconds.remainder(60));
  return "${_twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}

String _twoDigits(int n) {
  if (n >= 10) return "$n";
  return "0$n";
}

//Converte segundos para string no formato HH:MM:SS
String secondsToTime(secs) {
  var hours = (secs / (60 * 60)).floor();
  var divisorForMinutes = secs % (60 * 60);
  var minutes = (divisorForMinutes / 60).floor();
  var divisorForSeconds = divisorForMinutes % 60;
  var seconds = (divisorForSeconds).round();

  String strHours = (hours < 10) ? "0" + hours.toString() : hours.toString();
  String strMinutes =
      minutes = (minutes < 10) ? "0" + minutes.toString() : minutes.toString();
  String strSeconds =
      seconds = (seconds < 10) ? "0" + seconds.toString() : seconds.toString();

  return strHours + ":" + strMinutes + ":" + strSeconds;
}
