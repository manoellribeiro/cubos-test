String getYearFromReleaseDate(String releaseDate) {
  return DateTime.parse(releaseDate).year.toString();
}
