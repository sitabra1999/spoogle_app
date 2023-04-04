import 'dart:convert';
/// status : 1
/// message : "Users List"
/// response : [{"user_id":3,"user_device_token":"","name":"Tapan","email":"tapan@gmail.com","mobile":"9126338684","image":"https://notebrains.com/dev/codebell/public/uploads/images/defaultlogo.png","address":"","qrcode":"https://notebrains.com/dev/codebell/uploads/qrcodes/16588248399126338684.png","call_frwd_to_user_id":"","call_frwd_to_username":"","call_flag":0,"call_frwd_phone":"","call_frwd_image":"https://notebrains.com/dev/codebell/public/uploads/images/defaultlogo.png"},{"user_id":4,"user_device_token":"","name":"Ravi","email":"ravi@gmail.com","mobile":"7411499496","image":"https://notebrains.com/dev/codebell/public/uploads/images/defaultlogo.png","address":"","qrcode":"https://notebrains.com/dev/codebell/uploads/qrcodes/16590137027411499496.png","call_frwd_to_user_id":"","call_frwd_to_username":"","call_flag":0,"call_frwd_phone":"","call_frwd_image":"https://notebrains.com/dev/codebell/public/uploads/images/defaultlogo.png"},{"user_id":5,"user_device_token":"","name":"Sudhangshu","email":"sudhangshu@gmail.com","mobile":"7757058838","image":"https://notebrains.com/dev/codebell/uploads/user/stockerassdsd-1661342640.png","address":"Kolkata, India","qrcode":"https://notebrains.com/dev/codebell/uploads/qrcodes/16590137797757058838.png","call_frwd_to_user_id":"0","call_frwd_to_username":"","call_flag":0,"call_frwd_phone":"","call_frwd_image":"https://notebrains.com/dev/codebell/public/uploads/images/defaultlogo.png"},{"user_id":6,"user_device_token":"","name":"Priyanka S","email":"priyankas@gmail.com","mobile":"9373564041","image":"https://notebrains.com/dev/codebell/uploads/user/splash-1661342244.png","address":"Kolkata","qrcode":"https://notebrains.com/dev/codebell/uploads/qrcodes/16600288029373564041.png","call_frwd_to_user_id":"0","call_frwd_to_username":"","call_flag":0,"call_frwd_phone":"","call_frwd_image":"https://notebrains.com/dev/codebell/public/uploads/images/defaultlogo.png"},{"user_id":7,"user_device_token":"","name":"Eketi","email":"winner1089@gmail.com","mobile":"8956584897","image":"https://notebrains.com/dev/codebell/public/uploads/images/defaultlogo.png","address":"A-803, Brahma Vantage, Bavdhan, Pune-411021","qrcode":"https://notebrains.com/dev/codebell/uploads/qrcodes/16604531498956584897.png","call_frwd_to_user_id":"0","call_frwd_to_username":"","call_flag":0,"call_frwd_phone":"","call_frwd_image":"https://notebrains.com/dev/codebell/public/uploads/images/defaultlogo.png"},{"user_id":8,"user_device_token":"cTO885aCTNKNsFc_nz8mRI:APA91bH_DWZyJxFnODIN_uzEB1ikdwFvcXPx5dLHRmJ13pCWzKrhAJVmmxhs7Wsv1TQKybQkT9G_i90rPlZGcGwDLQPB4ozQn6QRQQNgJpeuXK_aWqhASGxeW6832EMRA--VWaunqg_d","name":"Imdadul haque","email":"imdadulhaque.bt@gmail.com","mobile":"9564636037","image":"https://notebrains.com/dev/codebell/uploads/user/WhatsApp Image-1660719956.jpeg","address":"Durgapur","qrcode":"https://notebrains.com/dev/codebell/uploads/qrcodes/16607199569564636037.png","call_frwd_to_user_id":"5","call_frwd_to_username":"Sudhangshu","call_flag":1,"call_frwd_phone":"7757058838","call_frwd_image":"https://notebrains.com/dev/codebell/public/uploads/images/defaultlogo.png"}]

UserListApiResModel userListApiResModelFromJson(String str) => UserListApiResModel.fromJson(json.decode(str));
String userListApiResModelToJson(UserListApiResModel data) => json.encode(data.toJson());
class UserListApiResModel {
  UserListApiResModel({
      num? status, 
      String? message, 
      List<Response>? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  UserListApiResModel.fromJson(dynamic json) {
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
UserListApiResModel copyWith({  num? status,
  String? message,
  List<Response>? response,
}) => UserListApiResModel(  status: status ?? _status,
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

/// user_id : 3
/// user_device_token : ""
/// name : "Tapan"
/// email : "tapan@gmail.com"
/// mobile : "9126338684"
/// image : "https://notebrains.com/dev/codebell/public/uploads/images/defaultlogo.png"
/// address : ""
/// qrcode : "https://notebrains.com/dev/codebell/uploads/qrcodes/16588248399126338684.png"
/// call_frwd_to_user_id : ""
/// call_frwd_to_username : ""
/// call_flag : 0
/// call_frwd_phone : ""
/// call_frwd_image : "https://notebrains.com/dev/codebell/public/uploads/images/defaultlogo.png"

Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
      num? userId, 
      String? userDeviceToken, 
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
      String? callFrwdImage,}){
    _userId = userId;
    _userDeviceToken = userDeviceToken;
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
}

  Response.fromJson(dynamic json) {
    _userId = json['user_id'];
    _userDeviceToken = json['user_device_token'];
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
  }
  num? _userId;
  String? _userDeviceToken;
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
Response copyWith({  num? userId,
  String? userDeviceToken,
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
}) => Response(  userId: userId ?? _userId,
  userDeviceToken: userDeviceToken ?? _userDeviceToken,
  name: name ?? _name,
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
);
  num? get userId => _userId;
  String? get userDeviceToken => _userDeviceToken;
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['user_device_token'] = _userDeviceToken;
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
    return map;
  }

}