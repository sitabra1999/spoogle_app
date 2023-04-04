import 'dart:convert';
/// status : 1
/// message : "User Device Token List"
/// response : [{"id":1,"device_type":"Android","device_token":"eiPjhX95Q0qJZVwUIlhEm4:APA91bHlXEUaMeXmc9V1XA3TX_W6fG5opF3ylXQpcs6apX7ohMnm28jL4KxTKvmNpMqoV9pVsyKuxO-sHA6TKTj92hZNjxfVvlSpjXk5Ppuv52pblF7x6a9u5KXPF1DcsjxzDjxMr1Ip","user_id":1,"username":"Kiran","image":"https://notebrains.com/dev/codebell/public/uploads/images/16496312711.jpeg"}]

GetDeviceTokenApiResModel getDeviceTokenApiResModelFromJson(String str) => GetDeviceTokenApiResModel.fromJson(json.decode(str));
String getDeviceTokenApiResModelToJson(GetDeviceTokenApiResModel data) => json.encode(data.toJson());
class GetDeviceTokenApiResModel {
  GetDeviceTokenApiResModel({
      num? status, 
      String? message, 
      List<Response>? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  GetDeviceTokenApiResModel.fromJson(dynamic json) {
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
GetDeviceTokenApiResModel copyWith({  num? status,
  String? message,
  List<Response>? response,
}) => GetDeviceTokenApiResModel(  status: status ?? _status,
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

/// id : 1
/// device_type : "Android"
/// device_token : "eiPjhX95Q0qJZVwUIlhEm4:APA91bHlXEUaMeXmc9V1XA3TX_W6fG5opF3ylXQpcs6apX7ohMnm28jL4KxTKvmNpMqoV9pVsyKuxO-sHA6TKTj92hZNjxfVvlSpjXk5Ppuv52pblF7x6a9u5KXPF1DcsjxzDjxMr1Ip"
/// user_id : 1
/// username : "Kiran"
/// image : "https://notebrains.com/dev/codebell/public/uploads/images/16496312711.jpeg"

Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
      num? id, 
      String? deviceType, 
      String? deviceToken, 
      num? userId, 
      String? username, 
      String? image,}){
    _id = id;
    _deviceType = deviceType;
    _deviceToken = deviceToken;
    _userId = userId;
    _username = username;
    _image = image;
}

  Response.fromJson(dynamic json) {
    _id = json['id'];
    _deviceType = json['device_type'];
    _deviceToken = json['device_token'];
    _userId = json['user_id'];
    _username = json['username'];
    _image = json['image'];
  }
  num? _id;
  String? _deviceType;
  String? _deviceToken;
  num? _userId;
  String? _username;
  String? _image;
Response copyWith({  num? id,
  String? deviceType,
  String? deviceToken,
  num? userId,
  String? username,
  String? image,
}) => Response(  id: id ?? _id,
  deviceType: deviceType ?? _deviceType,
  deviceToken: deviceToken ?? _deviceToken,
  userId: userId ?? _userId,
  username: username ?? _username,
  image: image ?? _image,
);
  num? get id => _id;
  String? get deviceType => _deviceType;
  String? get deviceToken => _deviceToken;
  num? get userId => _userId;
  String? get username => _username;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['device_type'] = _deviceType;
    map['device_token'] = _deviceToken;
    map['user_id'] = _userId;
    map['username'] = _username;
    map['image'] = _image;
    return map;
  }

}