import 'dart:convert';
/// status : 1
/// message : "Media Video Details"
/// response : {"details":{"id":158,"title":"Display Of Very Poor Cricket By Both Sides | Weak Captaincy | Shoaib Akhtar | SP1N","video_type":"youtube","main_video":"https://www.youtube.com/watch?v=qAgeB9FyNqA","poster":"https://img.youtube.com/vi/qAgeB9FyNqA/hqdefault.jpg","posted":"7 months ago","likes":4,"views":23,"total_comments":6,"comments":[{"id":1,"video_id":158,"parent_id":0,"name":"Alamgir Alam","image":"winter_solastice-1678340516.png","comment":"Good","posttime":"17 days ago","children":[{"id":3,"video_id":158,"parent_id":1,"name":"Alamgir Alam","image":"winter_solastice-1678340516.png","comment":"Good Video","posttime":"11 days ago"},{"id":2,"video_id":158,"parent_id":1,"name":"Alamgir Alam","image":"winter_solastice-1678340516.png","comment":"Good Video","posttime":"17 days ago"}]}]},"other_video":[{"videoid":159,"title":"Gujrat Vs Chennai","video_type":"","main_video":"https://cdn.jwplayer.com/previews/eE7y7zos","poster":"https://spoogle.in/dev/public/uploads/no_placeholder_image.png","tournament":[{"tour_id":27,"name":"IPL","slug":"ipl"}],"likes":1,"views":5,"comments":0,"video_slug":"gujrat-vs-chennai"}],"sport_slug_data":""}

VideoDetailsApiResModel videoDetailsApiResModelFromJson(String str) => VideoDetailsApiResModel.fromJson(json.decode(str));
String videoDetailsApiResModelToJson(VideoDetailsApiResModel data) => json.encode(data.toJson());
class VideoDetailsApiResModel {
  VideoDetailsApiResModel({
      dynamic status, 
      String? message, 
      Response? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  VideoDetailsApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  dynamic _status;
  String? _message;
  Response? _response;
VideoDetailsApiResModel copyWith({  dynamic status,
  String? message,
  Response? response,
}) => VideoDetailsApiResModel(  status: status ?? _status,
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

/// details : {"id":158,"title":"Display Of Very Poor Cricket By Both Sides | Weak Captaincy | Shoaib Akhtar | SP1N","video_type":"youtube","main_video":"https://www.youtube.com/watch?v=qAgeB9FyNqA","poster":"https://img.youtube.com/vi/qAgeB9FyNqA/hqdefault.jpg","posted":"7 months ago","likes":4,"views":23,"total_comments":6,"comments":[{"id":1,"video_id":158,"parent_id":0,"name":"Alamgir Alam","image":"winter_solastice-1678340516.png","comment":"Good","posttime":"17 days ago","children":[{"id":3,"video_id":158,"parent_id":1,"name":"Alamgir Alam","image":"winter_solastice-1678340516.png","comment":"Good Video","posttime":"11 days ago"},{"id":2,"video_id":158,"parent_id":1,"name":"Alamgir Alam","image":"winter_solastice-1678340516.png","comment":"Good Video","posttime":"17 days ago"}]}]}
/// other_video : [{"videoid":159,"title":"Gujrat Vs Chennai","video_type":"","main_video":"https://cdn.jwplayer.com/previews/eE7y7zos","poster":"https://spoogle.in/dev/public/uploads/no_placeholder_image.png","tournament":[{"tour_id":27,"name":"IPL","slug":"ipl"}],"likes":1,"views":5,"comments":0,"video_slug":"gujrat-vs-chennai"}]
/// sport_slug_data : ""

Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
      Details? details, 
      List<OtherVideo>? otherVideo, 
      String? sportSlugData,}){
    _details = details;
    _otherVideo = otherVideo;
    _sportSlugData = sportSlugData;
}

  Response.fromJson(dynamic json) {
    _details = json['details'] != null ? Details.fromJson(json['details']) : null;
    if (json['other_video'] != null) {
      _otherVideo = [];
      json['other_video'].forEach((v) {
        _otherVideo?.add(OtherVideo.fromJson(v));
      });
    }
    _sportSlugData = json['sport_slug_data'];
  }
  Details? _details;
  List<OtherVideo>? _otherVideo;
  String? _sportSlugData;
Response copyWith({  Details? details,
  List<OtherVideo>? otherVideo,
  String? sportSlugData,
}) => Response(  details: details ?? _details,
  otherVideo: otherVideo ?? _otherVideo,
  sportSlugData: sportSlugData ?? _sportSlugData,
);
  Details? get details => _details;
  List<OtherVideo>? get otherVideo => _otherVideo;
  String? get sportSlugData => _sportSlugData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_details != null) {
      map['details'] = _details?.toJson();
    }
    if (_otherVideo != null) {
      map['other_video'] = _otherVideo?.map((v) => v.toJson()).toList();
    }
    map['sport_slug_data'] = _sportSlugData;
    return map;
  }

}

/// videoid : 159
/// title : "Gujrat Vs Chennai"
/// video_type : ""
/// main_video : "https://cdn.jwplayer.com/previews/eE7y7zos"
/// poster : "https://spoogle.in/dev/public/uploads/no_placeholder_image.png"
/// tournament : [{"tour_id":27,"name":"IPL","slug":"ipl"}]
/// likes : 1
/// views : 5
/// comments : 0
/// video_slug : "gujrat-vs-chennai"

OtherVideo otherVideoFromJson(String str) => OtherVideo.fromJson(json.decode(str));
String otherVideoToJson(OtherVideo data) => json.encode(data.toJson());
class OtherVideo {
  OtherVideo({
      dynamic videoid, 
      String? title, 
      String? videoType, 
      String? mainVideo, 
      String? poster, 
      List<Tournament>? tournament, 
      dynamic likes, 
      dynamic views, 
      dynamic comments, 
      String? videoSlug,}){
    _videoid = videoid;
    _title = title;
    _videoType = videoType;
    _mainVideo = mainVideo;
    _poster = poster;
    _tournament = tournament;
    _likes = likes;
    _views = views;
    _comments = comments;
    _videoSlug = videoSlug;
}

  OtherVideo.fromJson(dynamic json) {
    _videoid = json['videoid'];
    _title = json['title'];
    _videoType = json['video_type'];
    _mainVideo = json['main_video'];
    _poster = json['poster'];
    if (json['tournament'] != null) {
      _tournament = [];
      json['tournament'].forEach((v) {
        _tournament?.add(Tournament.fromJson(v));
      });
    }
    _likes = json['likes'];
    _views = json['views'];
    _comments = json['comments'];
    _videoSlug = json['video_slug'];
  }
  dynamic _videoid;
  String? _title;
  String? _videoType;
  String? _mainVideo;
  String? _poster;
  List<Tournament>? _tournament;
  dynamic _likes;
  dynamic _views;
  dynamic _comments;
  String? _videoSlug;
OtherVideo copyWith({  dynamic videoid,
  String? title,
  String? videoType,
  String? mainVideo,
  String? poster,
  List<Tournament>? tournament,
  dynamic likes,
  dynamic views,
  dynamic comments,
  String? videoSlug,
}) => OtherVideo(  videoid: videoid ?? _videoid,
  title: title ?? _title,
  videoType: videoType ?? _videoType,
  mainVideo: mainVideo ?? _mainVideo,
  poster: poster ?? _poster,
  tournament: tournament ?? _tournament,
  likes: likes ?? _likes,
  views: views ?? _views,
  comments: comments ?? _comments,
  videoSlug: videoSlug ?? _videoSlug,
);
  dynamic get videoid => _videoid;
  String? get title => _title;
  String? get videoType => _videoType;
  String? get mainVideo => _mainVideo;
  String? get poster => _poster;
  List<Tournament>? get tournament => _tournament;
  dynamic get likes => _likes;
  dynamic get views => _views;
  dynamic get comments => _comments;
  String? get videoSlug => _videoSlug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['videoid'] = _videoid;
    map['title'] = _title;
    map['video_type'] = _videoType;
    map['main_video'] = _mainVideo;
    map['poster'] = _poster;
    if (_tournament != null) {
      map['tournament'] = _tournament?.map((v) => v.toJson()).toList();
    }
    map['likes'] = _likes;
    map['views'] = _views;
    map['comments'] = _comments;
    map['video_slug'] = _videoSlug;
    return map;
  }

}

/// tour_id : 27
/// name : "IPL"
/// slug : "ipl"

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

/// id : 158
/// title : "Display Of Very Poor Cricket By Both Sides | Weak Captaincy | Shoaib Akhtar | SP1N"
/// video_type : "youtube"
/// main_video : "https://www.youtube.com/watch?v=qAgeB9FyNqA"
/// poster : "https://img.youtube.com/vi/qAgeB9FyNqA/hqdefault.jpg"
/// posted : "7 months ago"
/// likes : 4
/// views : 23
/// total_comments : 6
/// comments : [{"id":1,"video_id":158,"parent_id":0,"name":"Alamgir Alam","image":"winter_solastice-1678340516.png","comment":"Good","posttime":"17 days ago","children":[{"id":3,"video_id":158,"parent_id":1,"name":"Alamgir Alam","image":"winter_solastice-1678340516.png","comment":"Good Video","posttime":"11 days ago"},{"id":2,"video_id":158,"parent_id":1,"name":"Alamgir Alam","image":"winter_solastice-1678340516.png","comment":"Good Video","posttime":"17 days ago"}]}]

Details detailsFromJson(String str) => Details.fromJson(json.decode(str));
String detailsToJson(Details data) => json.encode(data.toJson());
class Details {
  Details({
      dynamic id, 
      String? title, 
      String? videoType, 
      String? mainVideo, 
      String? poster, 
      String? posted, 
      dynamic likes, 
      dynamic views, 
      dynamic totalComments, 
      List<Comments>? comments,}){
    _id = id;
    _title = title;
    _videoType = videoType;
    _mainVideo = mainVideo;
    _poster = poster;
    _posted = posted;
    _likes = likes;
    _views = views;
    _totalComments = totalComments;
    _comments = comments;
}

  Details.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _videoType = json['video_type'];
    _mainVideo = json['main_video'];
    _poster = json['poster'];
    _posted = json['posted'];
    _likes = json['likes'];
    _views = json['views'];
    _totalComments = json['total_comments'];
    if (json['comments'] != null) {
      _comments = [];
      json['comments'].forEach((v) {
        _comments?.add(Comments.fromJson(v));
      });
    }
  }
  dynamic _id;
  String? _title;
  String? _videoType;
  String? _mainVideo;
  String? _poster;
  String? _posted;
  dynamic _likes;
  dynamic _views;
  dynamic _totalComments;
  List<Comments>? _comments;
Details copyWith({  dynamic id,
  String? title,
  String? videoType,
  String? mainVideo,
  String? poster,
  String? posted,
  dynamic likes,
  dynamic views,
  dynamic totalComments,
  List<Comments>? comments,
}) => Details(  id: id ?? _id,
  title: title ?? _title,
  videoType: videoType ?? _videoType,
  mainVideo: mainVideo ?? _mainVideo,
  poster: poster ?? _poster,
  posted: posted ?? _posted,
  likes: likes ?? _likes,
  views: views ?? _views,
  totalComments: totalComments ?? _totalComments,
  comments: comments ?? _comments,
);
  dynamic get id => _id;
  String? get title => _title;
  String? get videoType => _videoType;
  String? get mainVideo => _mainVideo;
  String? get poster => _poster;
  String? get posted => _posted;
  dynamic get likes => _likes;
  dynamic get views => _views;
  dynamic get totalComments => _totalComments;
  List<Comments>? get comments => _comments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['video_type'] = _videoType;
    map['main_video'] = _mainVideo;
    map['poster'] = _poster;
    map['posted'] = _posted;
    map['likes'] = _likes;
    map['views'] = _views;
    map['total_comments'] = _totalComments;
    if (_comments != null) {
      map['comments'] = _comments?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// video_id : 158
/// parent_id : 0
/// name : "Alamgir Alam"
/// image : "winter_solastice-1678340516.png"
/// comment : "Good"
/// posttime : "17 days ago"
/// children : [{"id":3,"video_id":158,"parent_id":1,"name":"Alamgir Alam","image":"winter_solastice-1678340516.png","comment":"Good Video","posttime":"11 days ago"},{"id":2,"video_id":158,"parent_id":1,"name":"Alamgir Alam","image":"winter_solastice-1678340516.png","comment":"Good Video","posttime":"17 days ago"}]

Comments commentsFromJson(String str) => Comments.fromJson(json.decode(str));
String commentsToJson(Comments data) => json.encode(data.toJson());
class Comments {
  Comments({
      dynamic id, 
      dynamic videoId, 
      dynamic parentId, 
      String? name, 
      String? image, 
      String? comment, 
      String? posttime, 
      List<Children>? children,}){
    _id = id;
    _videoId = videoId;
    _parentId = parentId;
    _name = name;
    _image = image;
    _comment = comment;
    _posttime = posttime;
    _children = children;
}

  Comments.fromJson(dynamic json) {
    _id = json['id'];
    _videoId = json['video_id'];
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
  dynamic _id;
  dynamic _videoId;
  dynamic _parentId;
  String? _name;
  String? _image;
  String? _comment;
  String? _posttime;
  List<Children>? _children;
Comments copyWith({  dynamic id,
  dynamic videoId,
  dynamic parentId,
  String? name,
  String? image,
  String? comment,
  String? posttime,
  List<Children>? children,
}) => Comments(  id: id ?? _id,
  videoId: videoId ?? _videoId,
  parentId: parentId ?? _parentId,
  name: name ?? _name,
  image: image ?? _image,
  comment: comment ?? _comment,
  posttime: posttime ?? _posttime,
  children: children ?? _children,
);
  dynamic get id => _id;
  dynamic get videoId => _videoId;
  dynamic get parentId => _parentId;
  String? get name => _name;
  String? get image => _image;
  String? get comment => _comment;
  String? get posttime => _posttime;
  List<Children>? get children => _children;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['video_id'] = _videoId;
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

/// id : 3
/// video_id : 158
/// parent_id : 1
/// name : "Alamgir Alam"
/// image : "winter_solastice-1678340516.png"
/// comment : "Good Video"
/// posttime : "11 days ago"

Children childrenFromJson(String str) => Children.fromJson(json.decode(str));
String childrenToJson(Children data) => json.encode(data.toJson());
class Children {
  Children({
      dynamic id, 
      dynamic videoId, 
      dynamic parentId, 
      String? name, 
      String? image, 
      String? comment, 
      String? posttime,}){
    _id = id;
    _videoId = videoId;
    _parentId = parentId;
    _name = name;
    _image = image;
    _comment = comment;
    _posttime = posttime;
}

  Children.fromJson(dynamic json) {
    _id = json['id'];
    _videoId = json['video_id'];
    _parentId = json['parent_id'];
    _name = json['name'];
    _image = json['image'];
    _comment = json['comment'];
    _posttime = json['posttime'];
  }
  dynamic _id;
  dynamic _videoId;
  dynamic _parentId;
  String? _name;
  String? _image;
  String? _comment;
  String? _posttime;
Children copyWith({  dynamic id,
  dynamic videoId,
  dynamic parentId,
  String? name,
  String? image,
  String? comment,
  String? posttime,
}) => Children(  id: id ?? _id,
  videoId: videoId ?? _videoId,
  parentId: parentId ?? _parentId,
  name: name ?? _name,
  image: image ?? _image,
  comment: comment ?? _comment,
  posttime: posttime ?? _posttime,
);
  dynamic get id => _id;
  dynamic get videoId => _videoId;
  dynamic get parentId => _parentId;
  String? get name => _name;
  String? get image => _image;
  String? get comment => _comment;
  String? get posttime => _posttime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['video_id'] = _videoId;
    map['parent_id'] = _parentId;
    map['name'] = _name;
    map['image'] = _image;
    map['comment'] = _comment;
    map['posttime'] = _posttime;
    return map;
  }

}