import 'dart:convert';
/// status : 0
/// message : "You have already like this video!"
/// response : {"title":"Warning"}

VideoLikeApiResModel videoLikeApiResModelFromJson(String str) => VideoLikeApiResModel.fromJson(json.decode(str));
String videoLikeApiResModelToJson(VideoLikeApiResModel data) => json.encode(data.toJson());
class VideoLikeApiResModel {
  VideoLikeApiResModel({
      num? status, 
      String? message, 
      Response? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  VideoLikeApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  num? _status;
  String? _message;
  Response? _response;
VideoLikeApiResModel copyWith({  num? status,
  String? message,
  Response? response,
}) => VideoLikeApiResModel(  status: status ?? _status,
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

/// title : "Warning"

Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
      String? title,}){
    _title = title;
}

  Response.fromJson(dynamic json) {
    _title = json['title'];
  }
  String? _title;
Response copyWith({  String? title,
}) => Response(  title: title ?? _title,
);
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    return map;
  }

}