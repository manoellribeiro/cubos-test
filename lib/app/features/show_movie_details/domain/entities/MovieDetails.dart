import 'Credits.dart';
import 'Genre.dart';
import 'ProductionCompany.dart';

class MovieDetails {
  int id;
  int budget;
  List<Genre> genres;
  String originalTitle;
  String overview;
  double popularity;
  List<ProductionCompany> productionCompanies;
  String releaseDate;
  int revenue;
  int runtime;
  String title;
  double voteAverage;
  Credits credits;

  MovieDetails({
    this.id,
    this.credits,
    this.budget,
    this.genres,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.productionCompanies,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.title,
    this.voteAverage,
  });

  MovieDetails.fromJson(Map<dynamic, dynamic> json) {
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = new List<Genre>();
      json['genres'].forEach((v) {
        genres.add(new Genre.fromJson(v));
      });
    }
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    if (json['production_companies'] != null) {
      productionCompanies = new List<ProductionCompany>();
      json['production_companies'].forEach((v) {
        productionCompanies.add(new ProductionCompany.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    id = json['id'];
    runtime = json['runtime'];
    title = json['title'];
    voteAverage = json['vote_average'];
    credits =
        json['credits'] != null ? new Credits.fromJson(json['credits']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['budget'] = this.budget;
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    if (this.productionCompanies != null) {
      data['production_companies'] =
          this.productionCompanies.map((v) => v.toJson()).toList();
    }
    data['release_date'] = this.releaseDate;
    data['revenue'] = this.revenue;
    data['id'] = this.id;
    data['runtime'] = this.runtime;
    data['title'] = this.title;
    data['vote_average'] = this.voteAverage;
    if (this.credits != null) {
      data['credits'] = this.credits.toJson();
    }
    return data;
  }
}
