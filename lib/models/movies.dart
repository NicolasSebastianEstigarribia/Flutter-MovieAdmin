
class Movies {
  Movies({
    this.search,
    this.totalResults,
    this.response,
  });
   List<Search>? search;
   String? totalResults;
   String? response;
  
  Movies.fromJson(dynamic json){
    search = List.from(json['Search']).map((e)=>Search.fromJson(e)).toList();
    totalResults = json['totalResults'];
    response = json['Response'];
  }


  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Search'] = search!.map((e)=>e.toJson()).toList();
    data['totalResults'] = totalResults;
    data['Response'] = response;
    return data;
  }
}

class Search {
  Search({
    this.title,
    this.year,
    this.imdbID,
    this.type,
    this.poster,
  });
  String? title;
  String? year;
  String? imdbID;
  String? type;
  String? poster;
  
  Search.fromJson(Map<String, dynamic> json){
    title = json['Title'];
    year = json['Year'];
    imdbID = json['imdbID'];
    type = json['Type'];
    poster = json['Poster'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Title'] = title;
    data['Year'] = year;
    data['imdbID'] = imdbID;
    data['Type'] = type;
    data['Poster'] = poster;
    return data;
  }
}
