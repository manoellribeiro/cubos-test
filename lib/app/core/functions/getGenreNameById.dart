import '../utils/genres_list.dart';

String getGenreNameById(int genreId) {
  return GENRE_LIST.where((genre) => genre['id'] == genreId).first['name'];
}
