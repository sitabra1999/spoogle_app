import 'dart:convert';
/// status : 1
/// message : "Top Headlines"
/// response : [{"news_id":748,"title":"Brentford striker Marcus Forss all set for move to Middlesbrough.","image":"https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/D351/production/_126079045_shutterstock_editorial_12894243fu.jpg","publish_datetime":"13-03-2023 05:33 PM"}]

BreakingNewsApiResModel breakingNewsApiResModelFromJson(String str) => BreakingNewsApiResModel.fromJson(json.decode(str));
String breakingNewsApiResModelToJson(BreakingNewsApiResModel data) => json.encode(data.toJson());
class BreakingNewsApiResModel {
  BreakingNewsApiResModel({
      dynamic status, 
      String? message, 
      List<Response>? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  BreakingNewsApiResModel.fromJson(dynamic json) {
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
BreakingNewsApiResModel copyWith({  dynamic status,
  String? message,
  List<Response>? response,
}) => BreakingNewsApiResModel(  status: status ?? _status,
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

/// news_id : 748
/// title : "Brentford striker Marcus Forss all set for move to Middlesbrough."
/// image : "https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/D351/production/_126079045_shutterstock_editorial_12894243fu.jpg"
/// publish_datetime : "13-03-2023 05:33 PM"

Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
      dynamic newsId, 
      String? title, 
      String? image, 
      String? publishDatetime,}){
    _newsId = newsId;
    _title = title;
    _image = image;
    _publishDatetime = publishDatetime;
}

  Response.fromJson(dynamic json) {
    _newsId = json['news_id'];
    _title = json['title'];
    _image = json['image'];
    _publishDatetime = json['publish_datetime'];
  }
  dynamic _newsId;
  String? _title;
  String? _image;
  String? _publishDatetime;
Response copyWith({  dynamic newsId,
  String? title,
  String? image,
  String? publishDatetime,
}) => Response(  newsId: newsId ?? _newsId,
  title: title ?? _title,
  image: image ?? _image,
  publishDatetime: publishDatetime ?? _publishDatetime,
);
  dynamic get newsId => _newsId;
  String? get title => _title;
  String? get image => _image;
  String? get publishDatetime => _publishDatetime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['news_id'] = _newsId;
    map['title'] = _title;
    map['image'] = _image;
    map['publish_datetime'] = _publishDatetime;
    return map;
  }

}