class MovieResults {
	String posterPath;
	List<int> genreIds;
	String title;

	MovieResults({this.posterPath, this.genreIds, this.title});

	MovieResults.fromJson(Map<dynamic, dynamic> json) {
		posterPath = json['poster_path'];
		genreIds = json['genre_ids'].cast<int>();
		title = json['title'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['poster_path'] = this.posterPath;
		data['genre_ids'] = this.genreIds;
		data['title'] = this.title;
		return data;
	}
}
