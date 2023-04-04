/// status : "Success"
/// message : "Introduction"
/// data : [{"logo":"http://3.6.41.121/CampusDunia_backend/storage/uploads/welcome-img-1.png","title":"Pay anytime, anywhere","description":"Using your smart card"},{"logo":"http://3.6.41.121/CampusDunia_backend/storage/uploads/welcome-img-2.png","title":"Pay anytime, anywhere","description":"Using your smart card"}]

class IntroApiModel {
  IntroApiModel({
      String? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  IntroApiModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  List<Data>? _data;

  String? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// logo : "http://3.6.41.121/CampusDunia_backend/storage/uploads/welcome-img-1.png"
/// title : "Pay anytime, anywhere"
/// description : "Using your smart card"

class Data {
  Data({
      String? logo, 
      String? title, 
      String? description,}){
    _logo = logo;
    _title = title;
    _description = description;
}

  Data.fromJson(dynamic json) {
    _logo = json['logo'];
    _title = json['title'];
    _description = json['description'];
  }
  String? _logo;
  String? _title;
  String? _description;

  String? get logo => _logo;
  String? get title => _title;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['logo'] = _logo;
    map['title'] = _title;
    map['description'] = _description;
    return map;
  }

}