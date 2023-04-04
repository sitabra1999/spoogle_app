import 'dart:convert';
/// status : 1
/// message : "Articles List"
/// response : {"all_facts":[{"facts_id":76,"article_unique_id":"FCT00076","title":"Euro 2022: A complete guide to Women's European Championship.","image":"https://images2.minutemediacdn.com/image/upload/c_crop,w_1920,h_1080,x_0,y_0/c_fill,w_1080,ar_16:9,f_auto,q_auto,g_auto/images%2FvoltaxMediaLibrary%2Fmmsport%2F90min_en_international_web%2F01g6acxgdywjcn7vwhjy.jpg","posted":"8 months ago","sports_id":2,"sports_name":"Soccer","sports_slug":"soccer","tournament":[{"tour_id":7,"name":"General","slug":"general-1"}],"likes":1,"views":38,"comments":2,"upvotes":1,"downvotes":1,"articles_slug":"euro-2022-a-complete-guide-to-womens-european-championship","short_description":"This is going to be the 13th edition of the Women's European Championship, which will kick off on 6th July 2022.\r\n\r\nEngland is going to host the tournament for the first time since 2005. They are competing in their ninth European Championship this summer.","image_type":"External","user_id":1,"usertype":"Admin"}],"page_links":{"current_page":1,"per_page":"10","first_page_url":"https://spoogle.in/dev/api/stories?page=1","from":1,"last_page":7,"last_page_url":"https://spoogle.in/dev/api/stories?page=7","next_page_url":"https://spoogle.in/dev/api/stories?page=2","path":"https://spoogle.in/dev/api/stories","prev_page_url":"","to":10,"total":69},"sport":""}

AllStoriesApiResModel allStoriesApiResModelFromJson(String str) => AllStoriesApiResModel.fromJson(json.decode(str));
String allStoriesApiResModelToJson(AllStoriesApiResModel data) => json.encode(data.toJson());
class AllStoriesApiResModel {
  AllStoriesApiResModel({
      dynamic status, 
      String? message, 
      Response? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  AllStoriesApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  dynamic _status;
  String? _message;
  Response? _response;
AllStoriesApiResModel copyWith({  dynamic status,
  String? message,
  Response? response,
}) => AllStoriesApiResModel(  status: status ?? _status,
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

/// all_facts : [{"facts_id":76,"article_unique_id":"FCT00076","title":"Euro 2022: A complete guide to Women's European Championship.","image":"https://images2.minutemediacdn.com/image/upload/c_crop,w_1920,h_1080,x_0,y_0/c_fill,w_1080,ar_16:9,f_auto,q_auto,g_auto/images%2FvoltaxMediaLibrary%2Fmmsport%2F90min_en_international_web%2F01g6acxgdywjcn7vwhjy.jpg","posted":"8 months ago","sports_id":2,"sports_name":"Soccer","sports_slug":"soccer","tournament":[{"tour_id":7,"name":"General","slug":"general-1"}],"likes":1,"views":38,"comments":2,"upvotes":1,"downvotes":1,"articles_slug":"euro-2022-a-complete-guide-to-womens-european-championship","short_description":"This is going to be the 13th edition of the Women's European Championship, which will kick off on 6th July 2022.\r\n\r\nEngland is going to host the tournament for the first time since 2005. They are competing in their ninth European Championship this summer.","image_type":"External","user_id":1,"usertype":"Admin"}]
/// page_links : {"current_page":1,"per_page":"10","first_page_url":"https://spoogle.in/dev/api/stories?page=1","from":1,"last_page":7,"last_page_url":"https://spoogle.in/dev/api/stories?page=7","next_page_url":"https://spoogle.in/dev/api/stories?page=2","path":"https://spoogle.in/dev/api/stories","prev_page_url":"","to":10,"total":69}
/// sport : ""

Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
      List<AllFacts>? allFacts, 
      PageLinks? pageLinks, 
      String? sport,}){
    _allFacts = allFacts;
    _pageLinks = pageLinks;
    _sport = sport;
}

  Response.fromJson(dynamic json) {
    if (json['all_facts'] != null) {
      _allFacts = [];
      json['all_facts'].forEach((v) {
        _allFacts?.add(AllFacts.fromJson(v));
      });
    }
    _pageLinks = json['page_links'] != null ? PageLinks.fromJson(json['page_links']) : null;
    _sport = json['sport'];
  }
  List<AllFacts>? _allFacts;
  PageLinks? _pageLinks;
  String? _sport;
Response copyWith({  List<AllFacts>? allFacts,
  PageLinks? pageLinks,
  String? sport,
}) => Response(  allFacts: allFacts ?? _allFacts,
  pageLinks: pageLinks ?? _pageLinks,
  sport: sport ?? _sport,
);
  List<AllFacts>? get allFacts => _allFacts;
  PageLinks? get pageLinks => _pageLinks;
  String? get sport => _sport;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_allFacts != null) {
      map['all_facts'] = _allFacts?.map((v) => v.toJson()).toList();
    }
    if (_pageLinks != null) {
      map['page_links'] = _pageLinks?.toJson();
    }
    map['sport'] = _sport;
    return map;
  }

}

/// current_page : 1
/// per_page : "10"
/// first_page_url : "https://spoogle.in/dev/api/stories?page=1"
/// from : 1
/// last_page : 7
/// last_page_url : "https://spoogle.in/dev/api/stories?page=7"
/// next_page_url : "https://spoogle.in/dev/api/stories?page=2"
/// path : "https://spoogle.in/dev/api/stories"
/// prev_page_url : ""
/// to : 10
/// total : 69

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

/// facts_id : 76
/// article_unique_id : "FCT00076"
/// title : "Euro 2022: A complete guide to Women's European Championship."
/// image : "https://images2.minutemediacdn.com/image/upload/c_crop,w_1920,h_1080,x_0,y_0/c_fill,w_1080,ar_16:9,f_auto,q_auto,g_auto/images%2FvoltaxMediaLibrary%2Fmmsport%2F90min_en_international_web%2F01g6acxgdywjcn7vwhjy.jpg"
/// posted : "8 months ago"
/// sports_id : 2
/// sports_name : "Soccer"
/// sports_slug : "soccer"
/// tournament : [{"tour_id":7,"name":"General","slug":"general-1"}]
/// likes : 1
/// views : 38
/// comments : 2
/// upvotes : 1
/// downvotes : 1
/// articles_slug : "euro-2022-a-complete-guide-to-womens-european-championship"
/// short_description : "This is going to be the 13th edition of the Women's European Championship, which will kick off on 6th July 2022.\r\n\r\nEngland is going to host the tournament for the first time since 2005. They are competing in their ninth European Championship this summer."
/// image_type : "External"
/// user_id : 1
/// usertype : "Admin"

AllFacts allFactsFromJson(String str) => AllFacts.fromJson(json.decode(str));
String allFactsToJson(AllFacts data) => json.encode(data.toJson());
class AllFacts {
  AllFacts({
      dynamic factsId, 
      String? articleUniqueId, 
      String? title, 
      String? image, 
      String? posted, 
      dynamic sportsId, 
      String? sportsName, 
      String? sportsSlug, 
      List<Tournament>? tournament, 
      dynamic likes, 
      dynamic views, 
      dynamic comments, 
      dynamic upvotes, 
      dynamic downvotes, 
      String? articlesSlug, 
      String? shortDescription, 
      String? imageType, 
      dynamic userId, 
      String? usertype,}){
    _factsId = factsId;
    _articleUniqueId = articleUniqueId;
    _title = title;
    _image = image;
    _posted = posted;
    _sportsId = sportsId;
    _sportsName = sportsName;
    _sportsSlug = sportsSlug;
    _tournament = tournament;
    _likes = likes;
    _views = views;
    _comments = comments;
    _upvotes = upvotes;
    _downvotes = downvotes;
    _articlesSlug = articlesSlug;
    _shortDescription = shortDescription;
    _imageType = imageType;
    _userId = userId;
    _usertype = usertype;
}

  AllFacts.fromJson(dynamic json) {
    _factsId = json['facts_id'];
    _articleUniqueId = json['article_unique_id'];
    _title = json['title'];
    _image = json['image'];
    _posted = json['posted'];
    _sportsId = json['sports_id'];
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
    _comments = json['comments'];
    _upvotes = json['upvotes'];
    _downvotes = json['downvotes'];
    _articlesSlug = json['articles_slug'];
    _shortDescription = json['short_description'];
    _imageType = json['image_type'];
    _userId = json['user_id'];
    _usertype = json['usertype'];
  }
  dynamic _factsId;
  String? _articleUniqueId;
  String? _title;
  String? _image;
  String? _posted;
  dynamic _sportsId;
  String? _sportsName;
  String? _sportsSlug;
  List<Tournament>? _tournament;
  dynamic _likes;
  dynamic _views;
  dynamic _comments;
  dynamic _upvotes;
  dynamic _downvotes;
  String? _articlesSlug;
  String? _shortDescription;
  String? _imageType;
  dynamic _userId;
  String? _usertype;
AllFacts copyWith({  dynamic factsId,
  String? articleUniqueId,
  String? title,
  String? image,
  String? posted,
  dynamic sportsId,
  String? sportsName,
  String? sportsSlug,
  List<Tournament>? tournament,
  dynamic likes,
  dynamic views,
  dynamic comments,
  dynamic upvotes,
  dynamic downvotes,
  String? articlesSlug,
  String? shortDescription,
  String? imageType,
  dynamic userId,
  String? usertype,
}) => AllFacts(  factsId: factsId ?? _factsId,
  articleUniqueId: articleUniqueId ?? _articleUniqueId,
  title: title ?? _title,
  image: image ?? _image,
  posted: posted ?? _posted,
  sportsId: sportsId ?? _sportsId,
  sportsName: sportsName ?? _sportsName,
  sportsSlug: sportsSlug ?? _sportsSlug,
  tournament: tournament ?? _tournament,
  likes: likes ?? _likes,
  views: views ?? _views,
  comments: comments ?? _comments,
  upvotes: upvotes ?? _upvotes,
  downvotes: downvotes ?? _downvotes,
  articlesSlug: articlesSlug ?? _articlesSlug,
  shortDescription: shortDescription ?? _shortDescription,
  imageType: imageType ?? _imageType,
  userId: userId ?? _userId,
  usertype: usertype ?? _usertype,
);
  dynamic get factsId => _factsId;
  String? get articleUniqueId => _articleUniqueId;
  String? get title => _title;
  String? get image => _image;
  String? get posted => _posted;
  dynamic get sportsId => _sportsId;
  String? get sportsName => _sportsName;
  String? get sportsSlug => _sportsSlug;
  List<Tournament>? get tournament => _tournament;
  dynamic get likes => _likes;
  dynamic get views => _views;
  dynamic get comments => _comments;
  dynamic get upvotes => _upvotes;
  dynamic get downvotes => _downvotes;
  String? get articlesSlug => _articlesSlug;
  String? get shortDescription => _shortDescription;
  String? get imageType => _imageType;
  dynamic get userId => _userId;
  String? get usertype => _usertype;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['facts_id'] = _factsId;
    map['article_unique_id'] = _articleUniqueId;
    map['title'] = _title;
    map['image'] = _image;
    map['posted'] = _posted;
    map['sports_id'] = _sportsId;
    map['sports_name'] = _sportsName;
    map['sports_slug'] = _sportsSlug;
    if (_tournament != null) {
      map['tournament'] = _tournament?.map((v) => v.toJson()).toList();
    }
    map['likes'] = _likes;
    map['views'] = _views;
    map['comments'] = _comments;
    map['upvotes'] = _upvotes;
    map['downvotes'] = _downvotes;
    map['articles_slug'] = _articlesSlug;
    map['short_description'] = _shortDescription;
    map['image_type'] = _imageType;
    map['user_id'] = _userId;
    map['usertype'] = _usertype;
    return map;
  }

}

/// tour_id : 7
/// name : "General"
/// slug : "general-1"

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