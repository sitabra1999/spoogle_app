/// status : "Success"
/// message : "Otp Send Successfully"
/// data : {"otp":9133}

class SendOtpApiModel {
  SendOtpApiModel({
      String? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  SendOtpApiModel.fromJson(dynamic json) {
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

/// otp : 9133

class Data {
  Data({
      int? otp,}){
    _otp = otp;
}

  Data.fromJson(dynamic json) {
    _otp = json['otp'];
  }
  int? _otp;

  int? get otp => _otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['otp'] = _otp;
    return map;
  }

}