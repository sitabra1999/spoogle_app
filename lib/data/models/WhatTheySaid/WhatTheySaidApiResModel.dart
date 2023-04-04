import 'dart:convert';
/// status : 1
/// message : "What They Said"
/// response : [{"id":158,"title":"Display Of Very Poor Cricket By Both Sides | Weak Captaincy | Shoaib Akhtar | SP1N","poster":"https://img.youtube.com/vi/qAgeB9FyNqA/hqdefault.jpg","slug":"display-of-very-poor-cricket-by-both-sides-weak-captaincy-shoaib-akhtar-sp1n","likes":1,"views":11}]

WhatTheySaidApiResModel whatTheySaidApiResModelFromJson(String str) => WhatTheySaidApiResModel.fromJson(json.decode(str));
String whatTheySaidApiResModelToJson(WhatTheySaidApiResModel data) => json.encode(data.toJson());
class WhatTheySaidApiResModel {
  WhatTheySaidApiResModel({
      dynamic status, 
      String? message, 
      List<Response>? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  WhatTheySaidApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['response'] != null) {
      _response = [];
      json['response'].forEach((v) {
        _response?.add(Response.fromJson(v));
      });
    }
  }
  dynamic _status;
  String? _message;
  List<Response>? _response;
WhatTheySaidApiResModel copyWith({  dynamic status,
  String? message,
  List<Response>? response,
}) => WhatTheySaidApiResModel(  status: status ?? _status,
  message: message ?? _message,
  response: response ?? _response,
);
  dynamic get status => _status;
  String? get message => _message;
  List<Response>? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_response != null) {
      map['response'] = _response?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 158
/// title : "Display Of Very Poor Cricket By Both Sides | Weak Captaincy | Shoaib Akhtar | SP1N"
/// poster : "https://img.youtube.com/vi/qAgeB9FyNqA/hqdefault.jpg"
/// slug : "display-of-very-poor-cricket-by-both-sides-weak-captaincy-shoaib-akhtar-sp1n"
/// likes : 1
/// views : 11

Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
      dynamic id, 
      String? title, 
      String? poster, 
      String? slug, 
      dynamic likes, 
      dynamic views,}){
    _id = id;
    _title = title;
    _poster = poster;
    _slug = slug;
    _likes = likes;
    _views = views;
}

  Response.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _poster = json['poster'];
    _slug = json['slug'];
    _likes = json['likes'];
    _views = json['views'];
  }
  dynamic _id;
  String? _title;
  String? _poster;
  String? _slug;
  dynamic _likes;
  dynamic _views;
Response copyWith({  dynamic id,
  String? title,
  String? poster,
  String? slug,
  dynamic likes,
  dynamic views,
}) => Response(  id: id ?? _id,
  title: title ?? _title,
  poster: poster ?? _poster,
  slug: slug ?? _slug,
  likes: likes ?? _likes,
  views: views ?? _views,
);
  dynamic get id => _id;
  String? get title => _title;
  String? get poster => _poster;
  String? get slug => _slug;
  dynamic get likes => _likes;
  dynamic get views => _views;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['poster'] = _poster;
    map['slug'] = _slug;
    map['likes'] = _likes;
    map['views'] = _views;
    return map;
  }

}