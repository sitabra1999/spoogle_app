import 'dart:convert';
/// status : 1
/// message : "Stories Details"
/// response : {"details":{"facts_id":76,"article_unique_id":"FCT00076","title":"Euro 2022: A complete guide to Women's European Championship.","image":"https://images2.minutemediacdn.com/image/upload/c_crop,w_1920,h_1080,x_0,y_0/c_fill,w_1080,ar_16:9,f_auto,q_auto,g_auto/images%2FvoltaxMediaLibrary%2Fmmsport%2F90min_en_international_web%2F01g6acxgdywjcn7vwhjy.jpg","posted":"8 months ago","sports_id":2,"sports_name":"Soccer","sports_slug":"soccer","tournament":[{"tour_id":7,"name":"General","slug":"general-1"}],"likes":1,"views":39,"comments":[{"id":6,"facts_id":76,"parent_id":0,"name":"Alamgir Alam","image":"","comment":"Good Stories","posttime":"5 days ago","children":[{"id":7,"facts_id":76,"parent_id":6,"name":"Alamgir Alam","image":"","comment":"Yes","posttime":"5 days ago"}]}],"total_comments":2,"upvotes":1,"downvotes":1,"articles_slug":"euro-2022-a-complete-guide-to-womens-european-championship","short_description":"This is going to be the 13th edition of the Women's European Championship, which will kick off on 6th July 2022.\r\n\r\nEngland is going to host the tournament for the first time since 2005. They are competing in their ninth European Championship this summer.","long_description":"<p>This is going to be the 13th edition of the Women's European Championship, which will kick off on 6th July 2022.</p><p><span style=\"font-size: 0.875rem;\">England is going to host the tournament for the first time since 2005. They are competing in their ninth European Championship this summer.</span><br></p><p><span style=\"font-size: 0.875rem;\">Netherlands are the defending champions, who will face Europe's elite oppositions and will try their best to retain their crown.</span><br></p><p><span style=\"font-size: 0.875rem;\">There are 16 teams competing in this summer's Euro 2022 in England.</span><br></p><div><br></div>","image_type":"External","user_id":1,"usertype":"Admin","external_link":"https://www.bbc.com/sport/football/61954163","poster":""},"other_facts":[{"facts_id":75,"article_unique_id":"FCT00075","title":"Few Premier League youngsters expecting for a giant season ahead.","image":"https://i0.wp.com/ichef.bbci.co.uk/live-experience/cps/624/cpsprodpb/A4BE/production/_125547124_hi076382824.jpg?w=640&resize=640&ssl=1","posted":"8 months ago","sports_id":2,"sports_name":"Soccer","sports_slug":"soccer","tournament":[{"tour_id":7,"name":"General","slug":"general-1"}],"likes":1,"views":19,"comments":0,"upvotes":1,"downvotes":1,"articles_slug":"few-premier-league-youngsters-expecting-for-a-giant-season-ahead","short_description":"The Premier League is popular all over the world for housing some of the best footballers in the world.\r\nSince the clubs have huge financial strength, it allows them to purchase top talent which makes the league heavily competitive.","image_type":"External","user_id":1,"usertype":"Admin"}],"sport_slug_data":"cricket"}

StoriesDetailsApiResModel storiesDetailsApiResModelFromJson(String str) => StoriesDetailsApiResModel.fromJson(json.decode(str));
String storiesDetailsApiResModelToJson(StoriesDetailsApiResModel data) => json.encode(data.toJson());
class StoriesDetailsApiResModel {
  StoriesDetailsApiResModel({
      num? status, 
      String? message, 
      Response? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  StoriesDetailsApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  num? _status;
  String? _message;
  Response? _response;
StoriesDetailsApiResModel copyWith({  num? status,
  String? message,
  Response? response,
}) => StoriesDetailsApiResModel(  status: status ?? _status,
  message: message ?? _message,
  response: response ?? _response,
);
  num? get status => _status;
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

/// details : {"facts_id":76,"article_unique_id":"FCT00076","title":"Euro 2022: A complete guide to Women's European Championship.","image":"https://images2.minutemediacdn.com/image/upload/c_crop,w_1920,h_1080,x_0,y_0/c_fill,w_1080,ar_16:9,f_auto,q_auto,g_auto/images%2FvoltaxMediaLibrary%2Fmmsport%2F90min_en_international_web%2F01g6acxgdywjcn7vwhjy.jpg","posted":"8 months ago","sports_id":2,"sports_name":"Soccer","sports_slug":"soccer","tournament":[{"tour_id":7,"name":"General","slug":"general-1"}],"likes":1,"views":39,"comments":[{"id":6,"facts_id":76,"parent_id":0,"name":"Alamgir Alam","image":"","comment":"Good Stories","posttime":"5 days ago","children":[{"id":7,"facts_id":76,"parent_id":6,"name":"Alamgir Alam","image":"","comment":"Yes","posttime":"5 days ago"}]}],"total_comments":2,"upvotes":1,"downvotes":1,"articles_slug":"euro-2022-a-complete-guide-to-womens-european-championship","short_description":"This is going to be the 13th edition of the Women's European Championship, which will kick off on 6th July 2022.\r\n\r\nEngland is going to host the tournament for the first time since 2005. They are competing in their ninth European Championship this summer.","long_description":"<p>This is going to be the 13th edition of the Women's European Championship, which will kick off on 6th July 2022.</p><p><span style=\"font-size: 0.875rem;\">England is going to host the tournament for the first time since 2005. They are competing in their ninth European Championship this summer.</span><br></p><p><span style=\"font-size: 0.875rem;\">Netherlands are the defending champions, who will face Europe's elite oppositions and will try their best to retain their crown.</span><br></p><p><span style=\"font-size: 0.875rem;\">There are 16 teams competing in this summer's Euro 2022 in England.</span><br></p><div><br></div>","image_type":"External","user_id":1,"usertype":"Admin","external_link":"https://www.bbc.com/sport/football/61954163","poster":""}
/// other_facts : [{"facts_id":75,"article_unique_id":"FCT00075","title":"Few Premier League youngsters expecting for a giant season ahead.","image":"https://i0.wp.com/ichef.bbci.co.uk/live-experience/cps/624/cpsprodpb/A4BE/production/_125547124_hi076382824.jpg?w=640&resize=640&ssl=1","posted":"8 months ago","sports_id":2,"sports_name":"Soccer","sports_slug":"soccer","tournament":[{"tour_id":7,"name":"General","slug":"general-1"}],"likes":1,"views":19,"comments":0,"upvotes":1,"downvotes":1,"articles_slug":"few-premier-league-youngsters-expecting-for-a-giant-season-ahead","short_description":"The Premier League is popular all over the world for housing some of the best footballers in the world.\r\nSince the clubs have huge financial strength, it allows them to purchase top talent which makes the league heavily competitive.","image_type":"External","user_id":1,"usertype":"Admin"}]
/// sport_slug_data : "cricket"

Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
      Details? details, 
      List<OtherFacts>? otherFacts, 
      String? sportSlugData,}){
    _details = details;
    _otherFacts = otherFacts;
    _sportSlugData = sportSlugData;
}

  Response.fromJson(dynamic json) {
    _details = json['details'] != null ? Details.fromJson(json['details']) : null;
    if (json['other_facts'] != null) {
      _otherFacts = [];
      json['other_facts'].forEach((v) {
        _otherFacts?.add(OtherFacts.fromJson(v));
      });
    }
    _sportSlugData = json['sport_slug_data'];
  }
  Details? _details;
  List<OtherFacts>? _otherFacts;
  String? _sportSlugData;
Response copyWith({  Details? details,
  List<OtherFacts>? otherFacts,
  String? sportSlugData,
}) => Response(  details: details ?? _details,
  otherFacts: otherFacts ?? _otherFacts,
  sportSlugData: sportSlugData ?? _sportSlugData,
);
  Details? get details => _details;
  List<OtherFacts>? get otherFacts => _otherFacts;
  String? get sportSlugData => _sportSlugData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_details != null) {
      map['details'] = _details?.toJson();
    }
    if (_otherFacts != null) {
      map['other_facts'] = _otherFacts?.map((v) => v.toJson()).toList();
    }
    map['sport_slug_data'] = _sportSlugData;
    return map;
  }

}

/// facts_id : 75
/// article_unique_id : "FCT00075"
/// title : "Few Premier League youngsters expecting for a giant season ahead."
/// image : "https://i0.wp.com/ichef.bbci.co.uk/live-experience/cps/624/cpsprodpb/A4BE/production/_125547124_hi076382824.jpg?w=640&resize=640&ssl=1"
/// posted : "8 months ago"
/// sports_id : 2
/// sports_name : "Soccer"
/// sports_slug : "soccer"
/// tournament : [{"tour_id":7,"name":"General","slug":"general-1"}]
/// likes : 1
/// views : 19
/// comments : 0
/// upvotes : 1
/// downvotes : 1
/// articles_slug : "few-premier-league-youngsters-expecting-for-a-giant-season-ahead"
/// short_description : "The Premier League is popular all over the world for housing some of the best footballers in the world.\r\nSince the clubs have huge financial strength, it allows them to purchase top talent which makes the league heavily competitive."
/// image_type : "External"
/// user_id : 1
/// usertype : "Admin"

OtherFacts otherFactsFromJson(String str) => OtherFacts.fromJson(json.decode(str));
String otherFactsToJson(OtherFacts data) => json.encode(data.toJson());
class OtherFacts {
  OtherFacts({
      num? factsId, 
      String? articleUniqueId, 
      String? title, 
      String? image, 
      String? posted, 
      num? sportsId, 
      String? sportsName, 
      String? sportsSlug, 
      List<Tournament>? tournament, 
      num? likes, 
      num? views, 
      num? comments, 
      num? upvotes, 
      num? downvotes, 
      String? articlesSlug, 
      String? shortDescription, 
      String? imageType, 
      num? userId, 
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

  OtherFacts.fromJson(dynamic json) {
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
  num? _factsId;
  String? _articleUniqueId;
  String? _title;
  String? _image;
  String? _posted;
  num? _sportsId;
  String? _sportsName;
  String? _sportsSlug;
  List<Tournament>? _tournament;
  num? _likes;
  num? _views;
  num? _comments;
  num? _upvotes;
  num? _downvotes;
  String? _articlesSlug;
  String? _shortDescription;
  String? _imageType;
  num? _userId;
  String? _usertype;
OtherFacts copyWith({  num? factsId,
  String? articleUniqueId,
  String? title,
  String? image,
  String? posted,
  num? sportsId,
  String? sportsName,
  String? sportsSlug,
  List<Tournament>? tournament,
  num? likes,
  num? views,
  num? comments,
  num? upvotes,
  num? downvotes,
  String? articlesSlug,
  String? shortDescription,
  String? imageType,
  num? userId,
  String? usertype,
}) => OtherFacts(  factsId: factsId ?? _factsId,
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
  num? get factsId => _factsId;
  String? get articleUniqueId => _articleUniqueId;
  String? get title => _title;
  String? get image => _image;
  String? get posted => _posted;
  num? get sportsId => _sportsId;
  String? get sportsName => _sportsName;
  String? get sportsSlug => _sportsSlug;
  List<Tournament>? get tournament => _tournament;
  num? get likes => _likes;
  num? get views => _views;
  num? get comments => _comments;
  num? get upvotes => _upvotes;
  num? get downvotes => _downvotes;
  String? get articlesSlug => _articlesSlug;
  String? get shortDescription => _shortDescription;
  String? get imageType => _imageType;
  num? get userId => _userId;
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
/// views : 39
/// comments : [{"id":6,"facts_id":76,"parent_id":0,"name":"Alamgir Alam","image":"","comment":"Good Stories","posttime":"5 days ago","children":[{"id":7,"facts_id":76,"parent_id":6,"name":"Alamgir Alam","image":"","comment":"Yes","posttime":"5 days ago"}]}]
/// total_comments : 2
/// upvotes : 1
/// downvotes : 1
/// articles_slug : "euro-2022-a-complete-guide-to-womens-european-championship"
/// short_description : "This is going to be the 13th edition of the Women's European Championship, which will kick off on 6th July 2022.\r\n\r\nEngland is going to host the tournament for the first time since 2005. They are competing in their ninth European Championship this summer."
/// long_description : "<p>This is going to be the 13th edition of the Women's European Championship, which will kick off on 6th July 2022.</p><p><span style=\"font-size: 0.875rem;\">England is going to host the tournament for the first time since 2005. They are competing in their ninth European Championship this summer.</span><br></p><p><span style=\"font-size: 0.875rem;\">Netherlands are the defending champions, who will face Europe's elite oppositions and will try their best to retain their crown.</span><br></p><p><span style=\"font-size: 0.875rem;\">There are 16 teams competing in this summer's Euro 2022 in England.</span><br></p><div><br></div>"
/// image_type : "External"
/// user_id : 1
/// usertype : "Admin"
/// external_link : "https://www.bbc.com/sport/football/61954163"
/// poster : ""

Details detailsFromJson(String str) => Details.fromJson(json.decode(str));
String detailsToJson(Details data) => json.encode(data.toJson());
class Details {
  Details({
      num? factsId, 
      String? articleUniqueId, 
      String? title, 
      String? image, 
      String? posted, 
      num? sportsId, 
      String? sportsName, 
      String? sportsSlug, 
      List<Tournament>? tournament, 
      num? likes, 
      num? views, 
      List<Comments>? comments, 
      num? totalComments, 
      num? upvotes, 
      num? downvotes, 
      String? articlesSlug, 
      String? shortDescription, 
      String? longDescription, 
      String? imageType, 
      num? userId, 
      String? usertype, 
      String? externalLink, 
      String? poster,}){
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
    _totalComments = totalComments;
    _upvotes = upvotes;
    _downvotes = downvotes;
    _articlesSlug = articlesSlug;
    _shortDescription = shortDescription;
    _longDescription = longDescription;
    _imageType = imageType;
    _userId = userId;
    _usertype = usertype;
    _externalLink = externalLink;
    _poster = poster;
}

  Details.fromJson(dynamic json) {
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
    if (json['comments'] != null) {
      _comments = [];
      json['comments'].forEach((v) {
        _comments?.add(Comments.fromJson(v));
      });
    }
    _totalComments = json['total_comments'];
    _upvotes = json['upvotes'];
    _downvotes = json['downvotes'];
    _articlesSlug = json['articles_slug'];
    _shortDescription = json['short_description'];
    _longDescription = json['long_description'];
    _imageType = json['image_type'];
    _userId = json['user_id'];
    _usertype = json['usertype'];
    _externalLink = json['external_link'];
    _poster = json['poster'];
  }
  num? _factsId;
  String? _articleUniqueId;
  String? _title;
  String? _image;
  String? _posted;
  num? _sportsId;
  String? _sportsName;
  String? _sportsSlug;
  List<Tournament>? _tournament;
  num? _likes;
  num? _views;
  List<Comments>? _comments;
  num? _totalComments;
  num? _upvotes;
  num? _downvotes;
  String? _articlesSlug;
  String? _shortDescription;
  String? _longDescription;
  String? _imageType;
  num? _userId;
  String? _usertype;
  String? _externalLink;
  String? _poster;
Details copyWith({  num? factsId,
  String? articleUniqueId,
  String? title,
  String? image,
  String? posted,
  num? sportsId,
  String? sportsName,
  String? sportsSlug,
  List<Tournament>? tournament,
  num? likes,
  num? views,
  List<Comments>? comments,
  num? totalComments,
  num? upvotes,
  num? downvotes,
  String? articlesSlug,
  String? shortDescription,
  String? longDescription,
  String? imageType,
  num? userId,
  String? usertype,
  String? externalLink,
  String? poster,
}) => Details(  factsId: factsId ?? _factsId,
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
  totalComments: totalComments ?? _totalComments,
  upvotes: upvotes ?? _upvotes,
  downvotes: downvotes ?? _downvotes,
  articlesSlug: articlesSlug ?? _articlesSlug,
  shortDescription: shortDescription ?? _shortDescription,
  longDescription: longDescription ?? _longDescription,
  imageType: imageType ?? _imageType,
  userId: userId ?? _userId,
  usertype: usertype ?? _usertype,
  externalLink: externalLink ?? _externalLink,
  poster: poster ?? _poster,
);
  num? get factsId => _factsId;
  String? get articleUniqueId => _articleUniqueId;
  String? get title => _title;
  String? get image => _image;
  String? get posted => _posted;
  num? get sportsId => _sportsId;
  String? get sportsName => _sportsName;
  String? get sportsSlug => _sportsSlug;
  List<Tournament>? get tournament => _tournament;
  num? get likes => _likes;
  num? get views => _views;
  List<Comments>? get comments => _comments;
  num? get totalComments => _totalComments;
  num? get upvotes => _upvotes;
  num? get downvotes => _downvotes;
  String? get articlesSlug => _articlesSlug;
  String? get shortDescription => _shortDescription;
  String? get longDescription => _longDescription;
  String? get imageType => _imageType;
  num? get userId => _userId;
  String? get usertype => _usertype;
  String? get externalLink => _externalLink;
  String? get poster => _poster;

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
    if (_comments != null) {
      map['comments'] = _comments?.map((v) => v.toJson()).toList();
    }
    map['total_comments'] = _totalComments;
    map['upvotes'] = _upvotes;
    map['downvotes'] = _downvotes;
    map['articles_slug'] = _articlesSlug;
    map['short_description'] = _shortDescription;
    map['long_description'] = _longDescription;
    map['image_type'] = _imageType;
    map['user_id'] = _userId;
    map['usertype'] = _usertype;
    map['external_link'] = _externalLink;
    map['poster'] = _poster;
    return map;
  }

}

/// id : 6
/// facts_id : 76
/// parent_id : 0
/// name : "Alamgir Alam"
/// image : ""
/// comment : "Good Stories"
/// posttime : "5 days ago"
/// children : [{"id":7,"facts_id":76,"parent_id":6,"name":"Alamgir Alam","image":"","comment":"Yes","posttime":"5 days ago"}]

Comments commentsFromJson(String str) => Comments.fromJson(json.decode(str));
String commentsToJson(Comments data) => json.encode(data.toJson());
class Comments {
  Comments({
      num? id, 
      num? factsId, 
      num? parentId, 
      String? name, 
      String? image, 
      String? comment, 
      String? posttime, 
      List<Children>? children,}){
    _id = id;
    _factsId = factsId;
    _parentId = parentId;
    _name = name;
    _image = image;
    _comment = comment;
    _posttime = posttime;
    _children = children;
}

  Comments.fromJson(dynamic json) {
    _id = json['id'];
    _factsId = json['facts_id'];
    _parentId = json['parent_id'];
    _name = json['name'];
    _image = json['image'];
    _comment = json['comment'];
    _posttime = json['posttime'];
    if (json['children'] != null) {
      _children = [];
      json['children'].forEach((v) {
        _children?.add(Children.fromJson(v));
      });
    }
  }
  num? _id;
  num? _factsId;
  num? _parentId;
  String? _name;
  String? _image;
  String? _comment;
  String? _posttime;
  List<Children>? _children;
Comments copyWith({  num? id,
  num? factsId,
  num? parentId,
  String? name,
  String? image,
  String? comment,
  String? posttime,
  List<Children>? children,
}) => Comments(  id: id ?? _id,
  factsId: factsId ?? _factsId,
  parentId: parentId ?? _parentId,
  name: name ?? _name,
  image: image ?? _image,
  comment: comment ?? _comment,
  posttime: posttime ?? _posttime,
  children: children ?? _children,
);
  num? get id => _id;
  num? get factsId => _factsId;
  num? get parentId => _parentId;
  String? get name => _name;
  String? get image => _image;
  String? get comment => _comment;
  String? get posttime => _posttime;
  List<Children>? get children => _children;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['facts_id'] = _factsId;
    map['parent_id'] = _parentId;
    map['name'] = _name;
    map['image'] = _image;
    map['comment'] = _comment;
    map['posttime'] = _posttime;
    if (_children != null) {
      map['children'] = _children?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 7
/// facts_id : 76
/// parent_id : 6
/// name : "Alamgir Alam"
/// image : ""
/// comment : "Yes"
/// posttime : "5 days ago"

Children childrenFromJson(String str) => Children.fromJson(json.decode(str));
String childrenToJson(Children data) => json.encode(data.toJson());
class Children {
  Children({
      num? id, 
      num? factsId, 
      num? parentId, 
      String? name, 
      String? image, 
      String? comment, 
      String? posttime,}){
    _id = id;
    _factsId = factsId;
    _parentId = parentId;
    _name = name;
    _image = image;
    _comment = comment;
    _posttime = posttime;
}

  Children.fromJson(dynamic json) {
    _id = json['id'];
    _factsId = json['facts_id'];
    _parentId = json['parent_id'];
    _name = json['name'];
    _image = json['image'];
    _comment = json['comment'];
    _posttime = json['posttime'];
  }
  num? _id;
  num? _factsId;
  num? _parentId;
  String? _name;
  String? _image;
  String? _comment;
  String? _posttime;
Children copyWith({  num? id,
  num? factsId,
  num? parentId,
  String? name,
  String? image,
  String? comment,
  String? posttime,
}) => Children(  id: id ?? _id,
  factsId: factsId ?? _factsId,
  parentId: parentId ?? _parentId,
  name: name ?? _name,
  image: image ?? _image,
  comment: comment ?? _comment,
  posttime: posttime ?? _posttime,
);
  num? get id => _id;
  num? get factsId => _factsId;
  num? get parentId => _parentId;
  String? get name => _name;
  String? get image => _image;
  String? get comment => _comment;
  String? get posttime => _posttime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['facts_id'] = _factsId;
    map['parent_id'] = _parentId;
    map['name'] = _name;
    map['image'] = _image;
    map['comment'] = _comment;
    map['posttime'] = _posttime;
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
      num? tourId, 
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
  num? _tourId;
  String? _name;
  String? _slug;
Tournament copyWith({  num? tourId,
  String? name,
  String? slug,
}) => Tournament(  tourId: tourId ?? _tourId,
  name: name ?? _name,
  slug: slug ?? _slug,
);
  num? get tourId => _tourId;
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