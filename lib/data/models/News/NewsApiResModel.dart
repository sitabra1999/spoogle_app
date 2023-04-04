import 'dart:convert';
/// status : 1
/// message : "News List"
/// response : {"all_news":[{"newsid":749,"news_unique_id":"NW00749","title":"Victoria Azarenka knocked out Jessica Pegula in the quarter-final round of Australian Open 2023.","image":"https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/D385/production/_128394145_azarenka.jpg","posted":"7 hours ago","sports_name":"Tennis","sport_id":3,"tournament":[{"tour_id":8,"name":"General","slug":"general-3"}],"likes":1,"views":13,"news_slug":"victoria-azarenka-knocked-out-jessica-pegula-in-the-quarter-final-round-of-australian-open-2023","short_description":"Belarusian, seeded 24th, Victoria Azarenka comfortably made her way into semi-final round after eliminating American third seed Jessica Pegula in the quarter-finals of ongoing Australian Open 2023.","image_type":"External"}],"all_pinned_news":[{"newsid":748,"news_unique_id":"NW00748","title":"Brentford striker Marcus Forss all set for move to Middlesbrough.","image":"https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/D351/production/_126079045_shutterstock_editorial_12894243fu.jpg","posted":"3 days ago","sports_name":"Soccer","sports_slug":"soccer","tournament":[{"tour_id":8,"name":"General","slug":"general-3"}],"likes":4,"views":20,"news_slug":"brentford-striker-marcus-forss-all-set-for-move-to-middlesbrough","short_description":"Middlesbrough's officials delighted to announce the join of Brentford's experienced striker Marcus Forss.\r\n\r\nMarcus Forss all set for the move to the Middlesbrough and signed a four-year deal with the club for an undisclosed fee.","image_type":"External"}],"page_links":{"current_page":1,"per_page":"1","first_page_url":"https://spoogle.in/dev/api/news?page=1","from":1,"last_page":8,"last_page_url":"https://spoogle.in/dev/api/news?page=8","next_page_url":"https://spoogle.in/dev/api/news?page=2","path":"https://spoogle.in/dev/api/news","prev_page_url":"","to":1,"total":8},"sport":""}

NewsApiResModel newsApiResModelFromJson(String str) => NewsApiResModel.fromJson(json.decode(str));
String newsApiResModelToJson(NewsApiResModel data) => json.encode(data.toJson());
class NewsApiResModel {
  NewsApiResModel({
      dynamic status, 
      String? message, 
      Response? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  NewsApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  dynamic _status;
  String? _message;
  Response? _response;
NewsApiResModel copyWith({  dynamic status,
  String? message,
  Response? response,
}) => NewsApiResModel(  status: status ?? _status,
  message: message ?? _message,
  response: response ?? _response,
);
  dynamic get status => _status;
  String? get message => _message;
  Response? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_response != null) {
      map['response'] = _response?.toJson();
    }
    return map;
  }

}

/// all_news : [{"newsid":749,"news_unique_id":"NW00749","title":"Victoria Azarenka knocked out Jessica Pegula in the quarter-final round of Australian Open 2023.","image":"https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/D385/production/_128394145_azarenka.jpg","posted":"7 hours ago","sports_name":"Tennis","sport_id":3,"tournament":[{"tour_id":8,"name":"General","slug":"general-3"}],"likes":1,"views":13,"news_slug":"victoria-azarenka-knocked-out-jessica-pegula-in-the-quarter-final-round-of-australian-open-2023","short_description":"Belarusian, seeded 24th, Victoria Azarenka comfortably made her way into semi-final round after eliminating American third seed Jessica Pegula in the quarter-finals of ongoing Australian Open 2023.","image_type":"External"}]
/// all_pinned_news : [{"newsid":748,"news_unique_id":"NW00748","title":"Brentford striker Marcus Forss all set for move to Middlesbrough.","image":"https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/D351/production/_126079045_shutterstock_editorial_12894243fu.jpg","posted":"3 days ago","sports_name":"Soccer","sports_slug":"soccer","tournament":[{"tour_id":8,"name":"General","slug":"general-3"}],"likes":4,"views":20,"news_slug":"brentford-striker-marcus-forss-all-set-for-move-to-middlesbrough","short_description":"Middlesbrough's officials delighted to announce the join of Brentford's experienced striker Marcus Forss.\r\n\r\nMarcus Forss all set for the move to the Middlesbrough and signed a four-year deal with the club for an undisclosed fee.","image_type":"External"}]
/// page_links : {"current_page":1,"per_page":"1","first_page_url":"https://spoogle.in/dev/api/news?page=1","from":1,"last_page":8,"last_page_url":"https://spoogle.in/dev/api/news?page=8","next_page_url":"https://spoogle.in/dev/api/news?page=2","path":"https://spoogle.in/dev/api/news","prev_page_url":"","to":1,"total":8}
/// sport : ""

Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
      List<AllNews>? allNews, 
      List<AllPinnedNews>? allPinnedNews, 
      PageLinks? pageLinks, 
      String? sport,}){
    _allNews = allNews;
    _allPinnedNews = allPinnedNews;
    _pageLinks = pageLinks;
    _sport = sport;
}

  Response.fromJson(dynamic json) {
    if (json['all_news'] != null) {
      _allNews = [];
      json['all_news'].forEach((v) {
        _allNews?.add(AllNews.fromJson(v));
      });
    }
    if (json['all_pinned_news'] != null) {
      _allPinnedNews = [];
      json['all_pinned_news'].forEach((v) {
        _allPinnedNews?.add(AllPinnedNews.fromJson(v));
      });
    }
    _pageLinks = json['page_links'] != null ? PageLinks.fromJson(json['page_links']) : null;
    _sport = json['sport'];
  }
  List<AllNews>? _allNews;
  List<AllPinnedNews>? _allPinnedNews;
  PageLinks? _pageLinks;
  String? _sport;
Response copyWith({  List<AllNews>? allNews,
  List<AllPinnedNews>? allPinnedNews,
  PageLinks? pageLinks,
  String? sport,
}) => Response(  allNews: allNews ?? _allNews,
  allPinnedNews: allPinnedNews ?? _allPinnedNews,
  pageLinks: pageLinks ?? _pageLinks,
  sport: sport ?? _sport,
);
  List<AllNews>? get allNews => _allNews;
  List<AllPinnedNews>? get allPinnedNews => _allPinnedNews;
  PageLinks? get pageLinks => _pageLinks;
  String? get sport => _sport;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_allNews != null) {
      map['all_news'] = _allNews?.map((v) => v.toJson()).toList();
    }
    if (_allPinnedNews != null) {
      map['all_pinned_news'] = _allPinnedNews?.map((v) => v.toJson()).toList();
    }
    if (_pageLinks != null) {
      map['page_links'] = _pageLinks?.toJson();
    }
    map['sport'] = _sport;
    return map;
  }

}

/// current_page : 1
/// per_page : "1"
/// first_page_url : "https://spoogle.in/dev/api/news?page=1"
/// from : 1
/// last_page : 8
/// last_page_url : "https://spoogle.in/dev/api/news?page=8"
/// next_page_url : "https://spoogle.in/dev/api/news?page=2"
/// path : "https://spoogle.in/dev/api/news"
/// prev_page_url : ""
/// to : 1
/// total : 8

PageLinks pageLinksFromJson(String str) => PageLinks.fromJson(json.decode(str));
String pageLinksToJson(PageLinks data) => json.encode(data.toJson());
class PageLinks {
  PageLinks({
      dynamic currentPage, 
      String? perPage, 
      String? firstPageUrl, 
      dynamic from, 
      dynamic lastPage, 
      String? lastPageUrl, 
      String? nextPageUrl, 
      String? path, 
      String? prevPageUrl, 
      dynamic to, 
      dynamic total,}){
    _currentPage = currentPage;
    _perPage = perPage;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
}

  PageLinks.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    _perPage = json['per_page'];
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }
  dynamic _currentPage;
  String? _perPage;
  String? _firstPageUrl;
  dynamic _from;
  dynamic _lastPage;
  String? _lastPageUrl;
  String? _nextPageUrl;
  String? _path;
  String? _prevPageUrl;
  dynamic _to;
  dynamic _total;
PageLinks copyWith({  dynamic currentPage,
  String? perPage,
  String? firstPageUrl,
  dynamic from,
  dynamic lastPage,
  String? lastPageUrl,
  String? nextPageUrl,
  String? path,
  String? prevPageUrl,
  dynamic to,
  dynamic total,
}) => PageLinks(  currentPage: currentPage ?? _currentPage,
  perPage: perPage ?? _perPage,
  firstPageUrl: firstPageUrl ?? _firstPageUrl,
  from: from ?? _from,
  lastPage: lastPage ?? _lastPage,
  lastPageUrl: lastPageUrl ?? _lastPageUrl,
  nextPageUrl: nextPageUrl ?? _nextPageUrl,
  path: path ?? _path,
  prevPageUrl: prevPageUrl ?? _prevPageUrl,
  to: to ?? _to,
  total: total ?? _total,
);
  dynamic get currentPage => _currentPage;
  String? get perPage => _perPage;
  String? get firstPageUrl => _firstPageUrl;
  dynamic get from => _from;
  dynamic get lastPage => _lastPage;
  String? get lastPageUrl => _lastPageUrl;
  String? get nextPageUrl => _nextPageUrl;
  String? get path => _path;
  String? get prevPageUrl => _prevPageUrl;
  dynamic get to => _to;
  dynamic get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    map['per_page'] = _perPage;
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }

}

/// newsid : 748
/// news_unique_id : "NW00748"
/// title : "Brentford striker Marcus Forss all set for move to Middlesbrough."
/// image : "https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/D351/production/_126079045_shutterstock_editorial_12894243fu.jpg"
/// posted : "3 days ago"
/// sports_name : "Soccer"
/// sports_slug : "soccer"
/// tournament : [{"tour_id":8,"name":"General","slug":"general-3"}]
/// likes : 4
/// views : 20
/// news_slug : "brentford-striker-marcus-forss-all-set-for-move-to-middlesbrough"
/// short_description : "Middlesbrough's officials delighted to announce the join of Brentford's experienced striker Marcus Forss.\r\n\r\nMarcus Forss all set for the move to the Middlesbrough and signed a four-year deal with the club for an undisclosed fee."
/// image_type : "External"

AllPinnedNews allPinnedNewsFromJson(String str) => AllPinnedNews.fromJson(json.decode(str));
String allPinnedNewsToJson(AllPinnedNews data) => json.encode(data.toJson());
class AllPinnedNews {
  AllPinnedNews({
      dynamic newsid, 
      String? newsUniqueId, 
      String? title, 
      String? image, 
      String? posted, 
      String? sportsName, 
      String? sportsSlug, 
      List<Tournament>? tournament, 
      dynamic likes, 
      dynamic views, 
      String? newsSlug, 
      String? shortDescription, 
      String? imageType,}){
    _newsid = newsid;
    _newsUniqueId = newsUniqueId;
    _title = title;
    _image = image;
    _posted = posted;
    _sportsName = sportsName;
    _sportsSlug = sportsSlug;
    _tournament = tournament;
    _likes = likes;
    _views = views;
    _newsSlug = newsSlug;
    _shortDescription = shortDescription;
    _imageType = imageType;
}

  AllPinnedNews.fromJson(dynamic json) {
    _newsid = json['newsid'];
    _newsUniqueId = json['news_unique_id'];
    _title = json['title'];
    _image = json['image'];
    _posted = json['posted'];
    _sportsName = json['sports_name'];
    _sportsSlug = json['sports_slug'];
    if (json['tournament'] != null) {
      _tournament = [];
      json['tournament'].forEach((v) {
        _tournament?.add(Tournament.fromJson(v));
      });
    }
    _likes = json['likes'];
    _views = json['views'];
    _newsSlug = json['news_slug'];
    _shortDescription = json['short_description'];
    _imageType = json['image_type'];
  }
  dynamic _newsid;
  String? _newsUniqueId;
  String? _title;
  String? _image;
  String? _posted;
  String? _sportsName;
  String? _sportsSlug;
  List<Tournament>? _tournament;
  dynamic _likes;
  dynamic _views;
  String? _newsSlug;
  String? _shortDescription;
  String? _imageType;
AllPinnedNews copyWith({  dynamic newsid,
  String? newsUniqueId,
  String? title,
  String? image,
  String? posted,
  String? sportsName,
  String? sportsSlug,
  List<Tournament>? tournament,
  dynamic likes,
  dynamic views,
  String? newsSlug,
  String? shortDescription,
  String? imageType,
}) => AllPinnedNews(  newsid: newsid ?? _newsid,
  newsUniqueId: newsUniqueId ?? _newsUniqueId,
  title: title ?? _title,
  image: image ?? _image,
  posted: posted ?? _posted,
  sportsName: sportsName ?? _sportsName,
  sportsSlug: sportsSlug ?? _sportsSlug,
  tournament: tournament ?? _tournament,
  likes: likes ?? _likes,
  views: views ?? _views,
  newsSlug: newsSlug ?? _newsSlug,
  shortDescription: shortDescription ?? _shortDescription,
  imageType: imageType ?? _imageType,
);
  dynamic get newsid => _newsid;
  String? get newsUniqueId => _newsUniqueId;
  String? get title => _title;
  String? get image => _image;
  String? get posted => _posted;
  String? get sportsName => _sportsName;
  String? get sportsSlug => _sportsSlug;
  List<Tournament>? get tournament => _tournament;
  dynamic get likes => _likes;
  dynamic get views => _views;
  String? get newsSlug => _newsSlug;
  String? get shortDescription => _shortDescription;
  String? get imageType => _imageType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['newsid'] = _newsid;
    map['news_unique_id'] = _newsUniqueId;
    map['title'] = _title;
    map['image'] = _image;
    map['posted'] = _posted;
    map['sports_name'] = _sportsName;
    map['sports_slug'] = _sportsSlug;
    if (_tournament != null) {
      map['tournament'] = _tournament?.map((v) => v.toJson()).toList();
    }
    map['likes'] = _likes;
    map['views'] = _views;
    map['news_slug'] = _newsSlug;
    map['short_description'] = _shortDescription;
    map['image_type'] = _imageType;
    return map;
  }

}

/// tour_id : 8
/// name : "General"
/// slug : "general-3"

Tournament tournamentFromJson(String str) => Tournament.fromJson(json.decode(str));
String tournamentToJson(Tournament data) => json.encode(data.toJson());
class Tournament {
  Tournament({
      dynamic tourId, 
      String? name, 
      String? slug,}){
    _tourId = tourId;
    _name = name;
    _slug = slug;
}

  Tournament.fromJson(dynamic json) {
    _tourId = json['tour_id'];
    _name = json['name'];
    _slug = json['slug'];
  }
  dynamic _tourId;
  String? _name;
  String? _slug;
Tournament copyWith({  dynamic tourId,
  String? name,
  String? slug,
}) => Tournament(  tourId: tourId ?? _tourId,
  name: name ?? _name,
  slug: slug ?? _slug,
);
  dynamic get tourId => _tourId;
  String? get name => _name;
  String? get slug => _slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tour_id'] = _tourId;
    map['name'] = _name;
    map['slug'] = _slug;
    return map;
  }

}

/// newsid : 749
/// news_unique_id : "NW00749"
/// title : "Victoria Azarenka knocked out Jessica Pegula in the quarter-final round of Australian Open 2023."
/// image : "https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/D385/production/_128394145_azarenka.jpg"
/// posted : "7 hours ago"
/// sports_name : "Tennis"
/// sport_id : 3
/// tournament : [{"tour_id":8,"name":"General","slug":"general-3"}]
/// likes : 1
/// views : 13
/// news_slug : "victoria-azarenka-knocked-out-jessica-pegula-in-the-quarter-final-round-of-australian-open-2023"
/// short_description : "Belarusian, seeded 24th, Victoria Azarenka comfortably made her way into semi-final round after eliminating American third seed Jessica Pegula in the quarter-finals of ongoing Australian Open 2023."
/// image_type : "External"

AllNews allNewsFromJson(String str) => AllNews.fromJson(json.decode(str));
String allNewsToJson(AllNews data) => json.encode(data.toJson());
class AllNews {
  AllNews({
      dynamic newsid, 
      String? newsUniqueId, 
      String? title, 
      String? image, 
      String? posted, 
      String? sportsName, 
      dynamic sportId, 
      List<Tournament>? tournament, 
      dynamic likes, 
      dynamic views, 
      String? newsSlug, 
      String? shortDescription, 
      String? imageType,}){
    _newsid = newsid;
    _newsUniqueId = newsUniqueId;
    _title = title;
    _image = image;
    _posted = posted;
    _sportsName = sportsName;
    _sportId = sportId;
    _tournament = tournament;
    _likes = likes;
    _views = views;
    _newsSlug = newsSlug;
    _shortDescription = shortDescription;
    _imageType = imageType;
}

  AllNews.fromJson(dynamic json) {
    _newsid = json['newsid'];
    _newsUniqueId = json['news_unique_id'];
    _title = json['title'];
    _image = json['image'];
    _posted = json['posted'];
    _sportsName = json['sports_name'];
    _sportId = json['sport_id'];
    if (json['tournament'] != null) {
      _tournament = [];
      json['tournament'].forEach((v) {
        _tournament?.add(Tournament.fromJson(v));
      });
    }
    _likes = json['likes'];
    _views = json['views'];
    _newsSlug = json['news_slug'];
    _shortDescription = json['short_description'];
    _imageType = json['image_type'];
  }
  dynamic _newsid;
  String? _newsUniqueId;
  String? _title;
  String? _image;
  String? _posted;
  String? _sportsName;
  dynamic _sportId;
  List<Tournament>? _tournament;
  dynamic _likes;
  dynamic _views;
  String? _newsSlug;
  String? _shortDescription;
  String? _imageType;
AllNews copyWith({  dynamic newsid,
  String? newsUniqueId,
  String? title,
  String? image,
  String? posted,
  String? sportsName,
  dynamic sportId,
  List<Tournament>? tournament,
  dynamic likes,
  dynamic views,
  String? newsSlug,
  String? shortDescription,
  String? imageType,
}) => AllNews(  newsid: newsid ?? _newsid,
  newsUniqueId: newsUniqueId ?? _newsUniqueId,
  title: title ?? _title,
  image: image ?? _image,
  posted: posted ?? _posted,
  sportsName: sportsName ?? _sportsName,
  sportId: sportId ?? _sportId,
  tournament: tournament ?? _tournament,
  likes: likes ?? _likes,
  views: views ?? _views,
  newsSlug: newsSlug ?? _newsSlug,
  shortDescription: shortDescription ?? _shortDescription,
  imageType: imageType ?? _imageType,
);
  dynamic get newsid => _newsid;
  String? get newsUniqueId => _newsUniqueId;
  String? get title => _title;
  String? get image => _image;
  String? get posted => _posted;
  String? get sportsName => _sportsName;
  dynamic get sportId => _sportId;
  List<Tournament>? get tournament => _tournament;
  dynamic get likes => _likes;
  dynamic get views => _views;
  String? get newsSlug => _newsSlug;
  String? get shortDescription => _shortDescription;
  String? get imageType => _imageType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['newsid'] = _newsid;
    map['news_unique_id'] = _newsUniqueId;
    map['title'] = _title;
    map['image'] = _image;
    map['posted'] = _posted;
    map['sports_name'] = _sportsName;
    map['sport_id'] = _sportId;
    if (_tournament != null) {
      map['tournament'] = _tournament?.map((v) => v.toJson()).toList();
    }
    map['likes'] = _likes;
    map['views'] = _views;
    map['news_slug'] = _newsSlug;
    map['short_description'] = _shortDescription;
    map['image_type'] = _imageType;
    return map;
  }

}
