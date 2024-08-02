class JokesModel {
  int? currentPage;
  int? limit;
  int? nextPage;
  int? previousPage;
  List<Joke>? results;
  String? searchTerm;
  int? status;
  int? totalJokes;
  int? totalPages;

  JokesModel({
    this.currentPage,
    this.limit,
    this.nextPage,
    this.previousPage,
    this.results,
    this.searchTerm,
    this.status,
    this.totalJokes,
    this.totalPages,
  });

  JokesModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    limit = json['limit'];
    nextPage = json['next_page'];
    previousPage = json['previous_page'];
    if (json['results'] != null) {
      results = <Joke>[];
      json['results'].forEach((v) {
        results!.add(Joke.fromJson(v));
      });
    }
    searchTerm = json['search_term'];
    status = json['status'];
    totalJokes = json['total_jokes'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['limit'] = limit;
    data['next_page'] = nextPage;
    data['previous_page'] = previousPage;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['search_term'] = searchTerm;
    data['status'] = status;
    data['total_jokes'] = totalJokes;
    data['total_pages'] = totalPages;
    return data;
  }
}

class Joke {
  String? id;
  String? joke;

  Joke({this.id, this.joke});

  Joke.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    joke = json['joke'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['joke'] = joke;
    return data;
  }
}
