import 'dart:convert';
/// status : 1
/// message : "News Details"
/// response : {"details":{"id":749,"news_unique_id":"NW00749","title":"Victoria Azarenka knocked out Jessica Pegula in the quarter-final round of Australian Open 2023.","image":"https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/D385/production/_128394145_azarenka.jpg","posted":"1 months ago","sports_name":"Tennis","sports_slug":"tennis","tournament":[{"tour_id":8,"name":"General","slug":"general-3"}],"likes":0,"views":9,"news_slug":"victoria-azarenka-knocked-out-jessica-pegula-in-the-quarter-final-round-of-australian-open-2023","short_description":"Belarusian, seeded 24th, Victoria Azarenka comfortably made her way into semi-final round after eliminating American third seed Jessica Pegula in the quarter-finals of ongoing Australian Open 2023.","long_description":"<p>Belarusian, seeded 24th, Victoria Azarenka comfortably made her way into semi-final round after eliminating American third seed&nbsp;Jessica Pegula in the quarter-finals of ongoing Australian Open 2023.</p>\r\n<p>Victoria Azarenka made a good start and stunned Jessica Pegula and finally claimed straight sets victory by 6-4 6-1 at Melbourne Park.</p>\r\n<p>On the other hand, Wimbledon champion Elena Rybakina stormed into the semi-finals after defeating Jelena Ostapenko by 6-2 6-4 in the quarter-final round.</p>\r\n<p>In the semi-final clash, Wimbledon champion Elena Rybakina will face Belarusian, seeded 24th, Victoria Azarenka.</p>","image_type":"External","external_link":"https://www.bbc.com/sport/tennis/64382348s","facebook_feeds":"","twitter_feeds":""},"you_may_also_like":[{"newsid":746,"news_unique_id":"NW00746","title":"Wimbledon 2022: Rafael Nadal gears up into the semi-finals.","image":"https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/5AA1/production/_125810232_gettyimages-1407149085.jpg","posted":"7 months ago","sports_name":"Tennis","sports_slug":"tennis","tournament":[{"tour_id":8,"name":"General","slug":"general-3"}],"likes":1,"views":7,"news_slug":"wimbledon-2022-rafael-nadal-gears-up-into-the-semi-finals","short_description":"In the quarter-finals Rafael Nadal faced in-form Taylor Fritz.\r\n\r\nRafael Nadal fought back without concerning his injury and beat Taylor Fritz by 3-6, 7-5, 3-6, 7-5, 7-6 (10/4) in a very back-breaking contest.","image_type":"External"}],"sport_slug_data":"cricket"}

NewsDetailsApiResModel newsDetailsApiResModelFromJson(String str) => NewsDetailsApiResModel.fromJson(json.decode(str));
String newsDetailsApiResModelToJson(NewsDetailsApiResModel data) => json.encode(data.toJson());
class NewsDetailsApiResModel {
  NewsDetailsApiResModel({
      dynamic status,
      String? message,
      Response? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  NewsDetailsApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  dynamic _status;
  String? _message;
  Response? _response;
NewsDetailsApiResModel copyWith({  dynamic status,
  String? message,
  Response? response,
}) => NewsDetailsApiResModel(  status: status ?? _status,
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

/// details : {"id":749,"news_unique_id":"NW00749","title":"Victoria Azarenka knocked out Jessica Pegula in the quarter-final round of Australian Open 2023.","image":"https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/D385/production/_128394145_azarenka.jpg","posted":"1 months ago","sports_name":"Tennis","sports_slug":"tennis","tournament":[{"tour_id":8,"name":"General","slug":"general-3"}],"likes":0,"views":9,"news_slug":"victoria-azarenka-knocked-out-jessica-pegula-in-the-quarter-final-round-of-australian-open-2023","short_description":"Belarusian, seeded 24th, Victoria Azarenka comfortably made her way into semi-final round after eliminating American third seed Jessica Pegula in the quarter-finals of ongoing Australian Open 2023.","long_description":"<p>Belarusian, seeded 24th, Victoria Azarenka comfortably made her way into semi-final round after eliminating American third seed&nbsp;Jessica Pegula in the quarter-finals of ongoing Australian Open 2023.</p>\r\n<p>Victoria Azarenka made a good start and stunned Jessica Pegula and finally claimed straight sets victory by 6-4 6-1 at Melbourne Park.</p>\r\n<p>On the other hand, Wimbledon champion Elena Rybakina stormed into the semi-finals after defeating Jelena Ostapenko by 6-2 6-4 in the quarter-final round.</p>\r\n<p>In the semi-final clash, Wimbledon champion Elena Rybakina will face Belarusian, seeded 24th, Victoria Azarenka.</p>","image_type":"External","external_link":"https://www.bbc.com/sport/tennis/64382348s","facebook_feeds":"","twitter_feeds":""}
/// you_may_also_like : [{"newsid":746,"news_unique_id":"NW00746","title":"Wimbledon 2022: Rafael Nadal gears up into the semi-finals.","image":"https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/5AA1/production/_125810232_gettyimages-1407149085.jpg","posted":"7 months ago","sports_name":"Tennis","sports_slug":"tennis","tournament":[{"tour_id":8,"name":"General","slug":"general-3"}],"likes":1,"views":7,"news_slug":"wimbledon-2022-rafael-nadal-gears-up-into-the-semi-finals","short_description":"In the quarter-finals Rafael Nadal faced in-form Taylor Fritz.\r\n\r\nRafael Nadal fought back without concerning his injury and beat Taylor Fritz by 3-6, 7-5, 3-6, 7-5, 7-6 (10/4) in a very back-breaking contest.","image_type":"External"}]
/// sport_slug_data : "cricket"

Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
      Details? details,
      List<YouMayAlsoLike>? youMayAlsoLike,
      String? sportSlugData,}){
    _details = details;
    _youMayAlsoLike = youMayAlsoLike;
    _sportSlugData = sportSlugData;
}

  Response.fromJson(dynamic json) {
    _details = json['details'] != null ? Details.fromJson(json['details']) : null;
    if (json['you_may_also_like'] != null) {
      _youMayAlsoLike = [];
      json['you_may_also_like'].forEach((v) {
        _youMayAlsoLike?.add(YouMayAlsoLike.fromJson(v));
      });
    }
    _sportSlugData = json['sport_slug_data'];
  }
  Details? _details;
  List<YouMayAlsoLike>? _youMayAlsoLike;
  String? _sportSlugData;
Response copyWith({  Details? details,
  List<YouMayAlsoLike>? youMayAlsoLike,
  String? sportSlugData,
}) => Response(  details: details ?? _details,
  youMayAlsoLike: youMayAlsoLike ?? _youMayAlsoLike,
  sportSlugData: sportSlugData ?? _sportSlugData,
);
  Details? get details => _details;
  List<YouMayAlsoLike>? get youMayAlsoLike => _youMayAlsoLike;
  String? get sportSlugData => _sportSlugData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_details != null) {
      map['details'] = _details?.toJson();
    }
    if (_youMayAlsoLike != null) {
      map['you_may_also_like'] = _youMayAlsoLike?.map((v) => v.toJson()).toList();
    }
    map['sport_slug_data'] = _sportSlugData;
    return map;
  }

}

/// newsid : 746
/// news_unique_id : "NW00746"
/// title : "Wimbledon 2022: Rafael Nadal gears up into the semi-finals."
/// image : "https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/5AA1/production/_125810232_gettyimages-1407149085.jpg"
/// posted : "7 months ago"
/// sports_name : "Tennis"
/// sports_slug : "tennis"
/// tournament : [{"tour_id":8,"name":"General","slug":"general-3"}]
/// likes : 1
/// views : 7
/// news_slug : "wimbledon-2022-rafael-nadal-gears-up-into-the-semi-finals"
/// short_description : "In the quarter-finals Rafael Nadal faced in-form Taylor Fritz.\r\n\r\nRafael Nadal fought back without concerning his injury and beat Taylor Fritz by 3-6, 7-5, 3-6, 7-5, 7-6 (10/4) in a very back-breaking contest."
/// image_type : "External"

YouMayAlsoLike youMayAlsoLikeFromJson(String str) => YouMayAlsoLike.fromJson(json.decode(str));
String youMayAlsoLikeToJson(YouMayAlsoLike data) => json.encode(data.toJson());
class YouMayAlsoLike {
  YouMayAlsoLike({
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

  YouMayAlsoLike.fromJson(dynamic json) {
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
YouMayAlsoLike copyWith({  dynamic newsid,
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
}) => YouMayAlsoLike(  newsid: newsid ?? _newsid,
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

/// id : 749
/// news_unique_id : "NW00749"
/// title : "Victoria Azarenka knocked out Jessica Pegula in the quarter-final round of Australian Open 2023."
/// image : "https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/D385/production/_128394145_azarenka.jpg"
/// posted : "1 months ago"
/// sports_name : "Tennis"
/// sports_slug : "tennis"
/// tournament : [{"tour_id":8,"name":"General","slug":"general-3"}]
/// likes : 0
/// views : 9
/// news_slug : "victoria-azarenka-knocked-out-jessica-pegula-in-the-quarter-final-round-of-australian-open-2023"
/// short_description : "Belarusian, seeded 24th, Victoria Azarenka comfortably made her way into semi-final round after eliminating American third seed Jessica Pegula in the quarter-finals of ongoing Australian Open 2023."
/// long_description : "<p>Belarusian, seeded 24th, Victoria Azarenka comfortably made her way into semi-final round after eliminating American third seed&nbsp;Jessica Pegula in the quarter-finals of ongoing Australian Open 2023.</p>\r\n<p>Victoria Azarenka made a good start and stunned Jessica Pegula and finally claimed straight sets victory by 6-4 6-1 at Melbourne Park.</p>\r\n<p>On the other hand, Wimbledon champion Elena Rybakina stormed into the semi-finals after defeating Jelena Ostapenko by 6-2 6-4 in the quarter-final round.</p>\r\n<p>In the semi-final clash, Wimbledon champion Elena Rybakina will face Belarusian, seeded 24th, Victoria Azarenka.</p>"
/// image_type : "External"
/// external_link : "https://www.bbc.com/sport/tennis/64382348s"
/// facebook_feeds : ""
/// twitter_feeds : ""

Details detailsFromJson(String str) => Details.fromJson(json.decode(str));
String detailsToJson(Details data) => json.encode(data.toJson());
class Details {
  Details({
      dynamic id,
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
      String? longDescription,
      String? imageType,
      String? externalLink,
      String? facebookFeeds,
      String? twitterFeeds,}){
    _id = id;
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
    _longDescription = longDescription;
    _imageType = imageType;
    _externalLink = externalLink;
    _facebookFeeds = facebookFeeds;
    _twitterFeeds = twitterFeeds;
}

  Details.fromJson(dynamic json) {
    _id = json['id'];
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
    _longDescription = json['long_description'];
    _imageType = json['image_type'];
    _externalLink = json['external_link'];
    _facebookFeeds = json['facebook_feeds'];
    _twitterFeeds = json['twitter_feeds'];
  }
  dynamic _id;
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
  String? _longDescription;
  String? _imageType;
  String? _externalLink;
  String? _facebookFeeds;
  String? _twitterFeeds;
Details copyWith({  dynamic id,
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
  String? longDescription,
  String? imageType,
  String? externalLink,
  String? facebookFeeds,
  String? twitterFeeds,
}) => Details(  id: id ?? _id,
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
  longDescription: longDescription ?? _longDescription,
  imageType: imageType ?? _imageType,
  externalLink: externalLink ?? _externalLink,
  facebookFeeds: facebookFeeds ?? _facebookFeeds,
  twitterFeeds: twitterFeeds ?? _twitterFeeds,
);
  dynamic get id => _id;
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
  String? get longDescription => _longDescription;
  String? get imageType => _imageType;
  String? get externalLink => _externalLink;
  String? get facebookFeeds => _facebookFeeds;
  String? get twitterFeeds => _twitterFeeds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
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
    map['long_description'] = _longDescription;
    map['image_type'] = _imageType;
    map['external_link'] = _externalLink;
    map['facebook_feeds'] = _facebookFeeds;
    map['twitter_feeds'] = _twitterFeeds;
    return map;
  }

}
