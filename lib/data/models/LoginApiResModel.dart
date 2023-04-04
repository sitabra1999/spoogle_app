import 'dart:convert';
/// status : 1
/// message : "Login Success"
/// response : {"user_id":26,"name":"Jayanta Paul","username":"","email":"jayanta@gmail.com","mobile":"","image":"","dob":"","gender":"","city":"","country":"","about":"","social_networking":"","access_token":"a3k2enZVUVJHVFRwT3BpSENHWmRTcUxkdGxDZ0oyVDk2aFdEOERwc1BXR1BFRGNRUnV3cXFwNHhhNzlW641181d7dad7c"}

LoginApiResModel loginApiResModelFromJson(String str) => LoginApiResModel.fromJson(json.decode(str));
String loginApiResModelToJson(LoginApiResModel data) => json.encode(data.toJson());
class LoginApiResModel {
  LoginApiResModel({
      num? status, 
      String? message, 
      Response? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  LoginApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  num? _status;
  String? _message;
  Response? _response;
LoginApiResModel copyWith({  num? status,
  String? message,
  Response? response,
}) => LoginApiResModel(  status: status ?? _status,
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

/// user_id : 26
/// name : "Jayanta Paul"
/// username : ""
/// email : "jayanta@gmail.com"
/// mobile : ""
/// image : ""
/// dob : ""
/// gender : ""
/// city : ""
/// country : ""
/// about : ""
/// social_networking : ""
/// access_token : "a3k2enZVUVJHVFRwT3BpSENHWmRTcUxkdGxDZ0oyVDk2aFdEOERwc1BXR1BFRGNRUnV3cXFwNHhhNzlW641181d7dad7c"

Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
      num? userId, 
      String? name, 
      String? username, 
      String? email, 
      String? mobile, 
      String? image, 
      String? dob, 
      String? gender, 
      String? city, 
      String? country, 
      String? about, 
      String? socialNetworking, 
      String? accessToken,}){
    _userId = userId;
    _name = name;
    _username = username;
    _email = email;
    _mobile = mobile;
    _image = image;
    _dob = dob;
    _gender = gender;
    _city = city;
    _country = country;
    _about = about;
    _socialNetworking = socialNetworking;
    _accessToken = accessToken;
}

  Response.fromJson(dynamic json) {
    _userId = json['user_id'];
    _name = json['name'];
    _username = json['username'];
    _email = json['email'];
    _mobile = json['mobile'];
    _image = json['image'];
    _dob = json['dob'];
    _gender = json['gender'];
    _city = json['city'];
    _country = json['country'];
    _about = json['about'];
    _socialNetworking = json['social_networking'];
    _accessToken = json['access_token'];
  }
  num? _userId;
  String? _name;
  String? _username;
  String? _email;
  String? _mobile;
  String? _image;
  String? _dob;
  String? _gender;
  String? _city;
  String? _country;
  String? _about;
  String? _socialNetworking;
  String? _accessToken;
Response copyWith({  num? userId,
  String? name,
  String? username,
  String? email,
  String? mobile,
  String? image,
  String? dob,
  String? gender,
  String? city,
  String? country,
  String? about,
  String? socialNetworking,
  String? accessToken,
}) => Response(  userId: userId ?? _userId,
  name: name ?? _name,
  username: username ?? _username,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  image: image ?? _image,
  dob: dob ?? _dob,
  gender: gender ?? _gender,
  city: city ?? _city,
  country: country ?? _country,
  about: about ?? _about,
  socialNetworking: socialNetworking ?? _socialNetworking,
  accessToken: accessToken ?? _accessToken,
);
  num? get userId => _userId;
  String? get name => _name;
  String? get username => _username;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get image => _image;
  String? get dob => _dob;
  String? get gender => _gender;
  String? get city => _city;
  String? get country => _country;
  String? get about => _about;
  String? get socialNetworking => _socialNetworking;
  String? get accessToken => _accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['name'] = _name;
    map['username'] = _username;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['image'] = _image;
    map['dob'] = _dob;
    map['gender'] = _gender;
    map['city'] = _city;
    map['country'] = _country;
    map['about'] = _about;
    map['social_networking'] = _socialNetworking;
    map['access_token'] = _accessToken;
    return map;
  }

}