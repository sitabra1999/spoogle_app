/// status : "Success"
/// message : "OTP verified successfully"
/// data : {"screen":1,"token":"21|hwi6WXtDcD6eCgZZBo3bCIY9mxuqM1ZRWWDwiYZ7"}

class VerifyOtpApiModel {
  VerifyOtpApiModel({
      String? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  VerifyOtpApiModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  Data? _data;

  String? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// screen : 1
/// token : "21|hwi6WXtDcD6eCgZZBo3bCIY9mxuqM1ZRWWDwiYZ7"

class Data {
  Data({
      int? screen, 
      String? token,}){
    _screen = screen;
    _token = token;
}

  Data.fromJson(dynamic json) {
    _screen = json['screen'];
    _token = json['token'];
  }
  int? _screen;
  String? _token;

  int? get screen => _screen;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['screen'] = _screen;
    map['token'] = _token;
    return map;
  }

}