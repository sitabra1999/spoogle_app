import 'dart:convert';
/// status : 1
/// message : "Profile Details."
/// response : {"name":"Kiran","email":"kiran@gmail.com","mobile":"9564636037","image":"https://notebrains.com/dev/codebell/public/uploads/images/16496312711.jpeg","address":"","qrcode":"https://notebrains.com/dev/codebell/public/uploads/qrcode/16588244729564636037.png","call_frwd_to_user_id":"3","call_frwd_to_username":"Tapan","call_flag":1,"call_frwd_phone":"9126338684","call_frwd_image":"https://notebrains.com/dev/codebell/public/uploads/images/16496312711.jpeg"}

ProfileApiResModel profileApiResModelFromJson(String str) => ProfileApiResModel.fromJson(json.decode(str));
String profileApiResModelToJson(ProfileApiResModel data) => json.encode(data.toJson());
class ProfileApiResModel {
  ProfileApiResModel({
      num? status, 
      String? message, 
      Response? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  ProfileApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  num? _status;
  String? _message;
  Response? _response;
ProfileApiResModel copyWith({  num? status,
  String? message,
  Response? response,
}) => ProfileApiResModel(  status: status ?? _status,
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

/// name : "Kiran"
/// email : "kiran@gmail.com"
/// mobile : "9564636037"
/// image : "https://notebrains.com/dev/codebell/public/uploads/images/16496312711.jpeg"
/// address : ""
/// qrcode : "https://notebrains.com/dev/codebell/public/uploads/qrcode/16588244729564636037.png"
/// call_frwd_to_user_id : "3"
/// call_frwd_to_username : "Tapan"
/// call_flag : 1
/// call_frwd_phone : "9126338684"
/// call_frwd_image : "https://notebrains.com/dev/codebell/public/uploads/images/16496312711.jpeg"

Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
      String? name, 
      String? email, 
      String? mobile, 
      String? image, 
      String? address, 
      String? qrcode, 
      String? callFrwdToUserId, 
      String? callFrwdToUsername, 
      num? callFlag, 
      String? callFrwdPhone, 
      String? callFrwdImage,
      String? callFrwdDeviceToken,}){
    _name = name;
    _email = email;
    _mobile = mobile;
    _image = image;
    _address = address;
    _qrcode = qrcode;
    _callFrwdToUserId = callFrwdToUserId;
    _callFrwdToUsername = callFrwdToUsername;
    _callFlag = callFlag;
    _callFrwdPhone = callFrwdPhone;
    _callFrwdImage = callFrwdImage;
    _callFrwdDeviceToken = callFrwdDeviceToken;
}

  Response.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _mobile = json['mobile'];
    _image = json['image'];
    _address = json['address'];
    _qrcode = json['qrcode'];
    _callFrwdToUserId = json['call_frwd_to_user_id'];
    _callFrwdToUsername = json['call_frwd_to_username'];
    _callFlag = json['call_flag'];
    _callFrwdPhone = json['call_frwd_phone'];
    _callFrwdImage = json['call_frwd_image'];
    _callFrwdDeviceToken = json['call_device_token'];
  }
  String? _name;
  String? _email;
  String? _mobile;
  String? _image;
  String? _address;
  String? _qrcode;
  String? _callFrwdToUserId;
  String? _callFrwdToUsername;
  num? _callFlag;
  String? _callFrwdPhone;
  String? _callFrwdImage;
  String? _callFrwdDeviceToken;
Response copyWith({  String? name,
  String? email,
  String? mobile,
  String? image,
  String? address,
  String? qrcode,
  String? callFrwdToUserId,
  String? callFrwdToUsername,
  num? callFlag,
  String? callFrwdPhone,
  String? callFrwdImage,
  String? callFrwdDeviceToken,
}) => Response(  name: name ?? _name,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  image: image ?? _image,
  address: address ?? _address,
  qrcode: qrcode ?? _qrcode,
  callFrwdToUserId: callFrwdToUserId ?? _callFrwdToUserId,
  callFrwdToUsername: callFrwdToUsername ?? _callFrwdToUsername,
  callFlag: callFlag ?? _callFlag,
  callFrwdPhone: callFrwdPhone ?? _callFrwdPhone,
  callFrwdImage: callFrwdImage ?? _callFrwdImage,
  callFrwdDeviceToken: callFrwdDeviceToken ?? _callFrwdDeviceToken,
);
  String? get name => _name;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get image => _image;
  String? get address => _address;
  String? get qrcode => _qrcode;
  String? get callFrwdToUserId => _callFrwdToUserId;
  String? get callFrwdToUsername => _callFrwdToUsername;
  num? get callFlag => _callFlag;
  String? get callFrwdPhone => _callFrwdPhone;
  String? get callFrwdImage => _callFrwdImage;
  String? get callFrwdDeviceToken => _callFrwdDeviceToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['image'] = _image;
    map['address'] = _address;
    map['qrcode'] = _qrcode;
    map['call_frwd_to_user_id'] = _callFrwdToUserId;
    map['call_frwd_to_username'] = _callFrwdToUsername;
    map['call_flag'] = _callFlag;
    map['call_frwd_phone'] = _callFrwdPhone;
    map['call_frwd_image'] = _callFrwdImage;
    map['call_device_token'] = _callFrwdDeviceToken;
    return map;
  }

}