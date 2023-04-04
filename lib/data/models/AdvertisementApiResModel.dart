import 'dart:convert';
/// status : 1
/// message : "Advertisement List"
/// response : [{"advertisement_id":1,"title":"Dummy Ad","description":"This is working","external_url":"","image":""},{"advertisement_id":2,"title":"Another Dummy Ad","description":"Working api","external_url":"","image":""}]

AdvertisementApiResModel advertisementApiResModelFromJson(String str) => AdvertisementApiResModel.fromJson(json.decode(str));
String advertisementApiResModelToJson(AdvertisementApiResModel data) => json.encode(data.toJson());
class AdvertisementApiResModel {
  AdvertisementApiResModel({
      num? status, 
      String? message, 
      List<Response>? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  AdvertisementApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['response'] != null) {
      _response = [];
      json['response'].forEach((v) {
        _response?.add(Response.fromJson(v));
      });
    }
  }
  num? _status;
  String? _message;
  List<Response>? _response;
AdvertisementApiResModel copyWith({  num? status,
  String? message,
  List<Response>? response,
}) => AdvertisementApiResModel(  status: status ?? _status,
  message: message ?? _message,
  response: response ?? _response,
);
  num? get status => _status;
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

/// advertisement_id : 1
/// title : "Dummy Ad"
/// description : "This is working"
/// external_url : ""
/// image : ""

Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
      num? advertisementId, 
      String? title, 
      String? description, 
      String? externalUrl, 
      String? image,}){
    _advertisementId = advertisementId;
    _title = title;
    _description = description;
    _externalUrl = externalUrl;
    _image = image;
}

  Response.fromJson(dynamic json) {
    _advertisementId = json['advertisement_id'];
    _title = json['title'];
    _description = json['description'];
    _externalUrl = json['external_url'];
    _image = json['image'];
  }
  num? _advertisementId;
  String? _title;
  String? _description;
  String? _externalUrl;
  String? _image;
Response copyWith({  num? advertisementId,
  String? title,
  String? description,
  String? externalUrl,
  String? image,
}) => Response(  advertisementId: advertisementId ?? _advertisementId,
  title: title ?? _title,
  description: description ?? _description,
  externalUrl: externalUrl ?? _externalUrl,
  image: image ?? _image,
);
  num? get advertisementId => _advertisementId;
  String? get title => _title;
  String? get description => _description;
  String? get externalUrl => _externalUrl;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['advertisement_id'] = _advertisementId;
    map['title'] = _title;
    map['description'] = _description;
    map['external_url'] = _externalUrl;
    map['image'] = _image;
    return map;
  }

}