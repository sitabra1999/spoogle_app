import 'dart:convert';
/// status : 1
/// message : "Sports"
/// response : [{"sport_id":25,"sport_name":"Chess","slug":"chess","main_image":"https://spoogle.in/dev/public/uploads/sports/chess-1657709951.svg","data_updated_on":""}]

AllSportsApiResModel allSportsApiResModelFromJson(String str) => AllSportsApiResModel.fromJson(json.decode(str));
String allSportsApiResModelToJson(AllSportsApiResModel data) => json.encode(data.toJson());
class AllSportsApiResModel {
  AllSportsApiResModel({
      dynamic status, 
      String? message, 
      List<Response>? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  AllSportsApiResModel.fromJson(dynamic json) {
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
AllSportsApiResModel copyWith({  dynamic status,
  String? message,
  List<Response>? response,
}) => AllSportsApiResModel(  status: status ?? _status,
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

/// sport_id : 25
/// sport_name : "Chess"
/// slug : "chess"
/// main_image : "https://spoogle.in/dev/public/uploads/sports/chess-1657709951.svg"
/// data_updated_on : ""

Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
      dynamic sportId, 
      String? sportName, 
      String? slug, 
      String? mainImage, 
      String? dataUpdatedOn,}){
    _sportId = sportId;
    _sportName = sportName;
    _slug = slug;
    _mainImage = mainImage;
    _dataUpdatedOn = dataUpdatedOn;
}

  Response.fromJson(dynamic json) {
    _sportId = json['sport_id'];
    _sportName = json['sport_name'];
    _slug = json['slug'];
    _mainImage = json['main_image'];
    _dataUpdatedOn = json['data_updated_on'];
  }
  dynamic _sportId;
  String? _sportName;
  String? _slug;
  String? _mainImage;
  String? _dataUpdatedOn;
Response copyWith({  dynamic sportId,
  String? sportName,
  String? slug,
  String? mainImage,
  String? dataUpdatedOn,
}) => Response(  sportId: sportId ?? _sportId,
  sportName: sportName ?? _sportName,
  slug: slug ?? _slug,
  mainImage: mainImage ?? _mainImage,
  dataUpdatedOn: dataUpdatedOn ?? _dataUpdatedOn,
);
  dynamic get sportId => _sportId;
  String? get sportName => _sportName;
  String? get slug => _slug;
  String? get mainImage => _mainImage;
  String? get dataUpdatedOn => _dataUpdatedOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sport_id'] = _sportId;
    map['sport_name'] = _sportName;
    map['slug'] = _slug;
    map['main_image'] = _mainImage;
    map['data_updated_on'] = _dataUpdatedOn;
    return map;
  }

}