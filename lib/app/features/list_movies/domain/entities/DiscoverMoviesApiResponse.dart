import 'MovieResults.dart';

class DiscoverMoviesApiResponse {
  int page;
  int totalResults;
  int totalPages;
  List<MovieResults> results;

  DiscoverMoviesApiResponse(
      {this.page, this.totalResults, this.totalPages, this.results});

  DiscoverMoviesApiResponse.fromJson(Map<dynamic, dynamic> json) {
    page = json['page'];
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = new List<MovieResults>();
      json['results'].forEach((v) {
        results.add(new MovieResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
