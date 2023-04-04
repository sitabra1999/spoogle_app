import 'dart:convert';
/// status : 1
/// message : "Standings List"
/// response : {"sports_data":[{"sports_id":1,"sports_name":"Cricket","image":"https://spoogle.in/dev/public/uploads/sports/cricket-1657708158.svg"}]}

StandingListApiResModel standingListApiResModelFromJson(String str) => StandingListApiResModel.fromJson(json.decode(str));
String standingListApiResModelToJson(StandingListApiResModel data) => json.encode(data.toJson());
class StandingListApiResModel {
  StandingListApiResModel({
      dynamic status, 
      String? message, 
      Response? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  StandingListApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  dynamic _status;
  String? _message;
  Response? _response;
StandingListApiResModel copyWith({  dynamic status,
  String? message,
  Response? response,
}) => StandingListApiResModel(  status: status ?? _status,
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

/// sports_data : [{"sports_id":1,"sports_name":"Cricket","image":"https://spoogle.in/dev/public/uploads/sports/cricket-1657708158.svg"}]

Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
      List<SportsData>? sportsData,}){
    _sportsData = sportsData;
}

  Response.fromJson(dynamic json) {
    if (json['sports_data'] != null) {
      _sportsData = [];
      json['sports_data'].forEach((v) {
        _sportsData?.add(SportsData.fromJson(v));
      });
    }
  }
  List<SportsData>? _sportsData;
Response copyWith({  List<SportsData>? sportsData,
}) => Response(  sportsData: sportsData ?? _sportsData,
);
  List<SportsData>? get sportsData => _sportsData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_sportsData != null) {
      map['sports_data'] = _sportsData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// sports_id : 1
/// sports_name : "Cricket"
/// image : "https://spoogle.in/dev/public/uploads/sports/cricket-1657708158.svg"

SportsData sportsDataFromJson(String str) => SportsData.fromJson(json.decode(str));
String sportsDataToJson(SportsData data) => json.encode(data.toJson());
class SportsData {
  SportsData({
      dynamic sportsId, 
      String? sportsName, 
      String? image,}){
    _sportsId = sportsId;
    _sportsName = sportsName;
    _image = image;
}

  SportsData.fromJson(dynamic json) {
    _sportsId = json['sports_id'];
    _sportsName = json['sports_name'];
    _image = json['image'];
  }
  dynamic _sportsId;
  String? _sportsName;
  String? _image;
SportsData copyWith({  dynamic sportsId,
  String? sportsName,
  String? image,
}) => SportsData(  sportsId: sportsId ?? _sportsId,
  sportsName: sportsName ?? _sportsName,
  image: image ?? _image,
);
  dynamic get sportsId => _sportsId;
  String? get sportsName => _sportsName;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sports_id'] = _sportsId;
    map['sports_name'] = _sportsName;
    map['image'] = _image;
    return map;
  }

}