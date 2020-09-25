String formatMovieRuntime(int runtime){
  Duration movieDuration = Duration(minutes: runtime);
  return "${movieDuration.inHours}h ${movieDuration.inMinutes.remainder(60)} min";
}