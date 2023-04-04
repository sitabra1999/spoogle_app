import 'dart:convert';
/// status : 1
/// message : "Thanks for like this stories!"
/// response : {"title":"Success","count":2}

LikeApiResModel likeApiResModelFromJson(String str) => LikeApiResModel.fromJson(json.decode(str));
String likeApiResModelToJson(LikeApiResModel data) => json.encode(data.toJson());
class LikeApiResModel {
  LikeApiResModel({
      num? status, 
      String? message, 
      Response? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  LikeApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  num? _status;
  String? _message;
  Response? _response;
LikeApiResModel copyWith({  num? status,
  String? message,
  Response? response,
}) => LikeApiResModel(  status: status ?? _status,
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

/// title : "Success"
/// count : 2

Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
      String? title, 
      num? count,}){
    _title = title;
    _count = count;
}

  Response.fromJson(dynamic json) {
    _title = json['title'];
    _count = json['count'];
  }
  String? _title;
  num? _count;
Response copyWith({  String? title,
  num? count,
}) => Response(  title: title ?? _title,
  count: count ?? _count,
);
  String? get title => _title;
  num? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['count'] = _count;
    return map;
  }

}