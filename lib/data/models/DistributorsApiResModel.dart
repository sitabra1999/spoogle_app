import 'dart:convert';
/// status : 1
/// message : "Distributors List"
/// response : {"distributor_list":[{"name":"Myntra","image":"https://notebrains.com/dev/codebell/public/uploads/distributor/app_logo (1)-1654153565.png"},{"name":"Zomato","image":"https://notebrains.com/dev/codebell/public/uploads/images/defaultlogo.png"}],"advertisement_list":{"advertisement_id":5,"title":"Water","description":"","external_url":"","image":"https://notebrains.com/dev/codebell/public/uploads/advertise/oto-effects_1660719069.jpeg"}}

DistributorsApiResModel distributorsApiResModelFromJson(String str) => DistributorsApiResModel.fromJson(json.decode(str));
String distributorsApiResModelToJson(DistributorsApiResModel data) => json.encode(data.toJson());
class DistributorsApiResModel {
  DistributorsApiResModel({
      num? status, 
      String? message, 
      Response? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  DistributorsApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  num? _status;
  String? _message;
  Response? _response;
DistributorsApiResModel copyWith({  num? status,
  String? message,
  Response? response,
}) => DistributorsApiResModel(  status: status ?? _status,
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

/// distributor_list : [{"name":"Myntra","image":"https://notebrains.com/dev/codebell/public/uploads/distributor/app_logo (1)-1654153565.png"},{"name":"Zomato","image":"https://notebrains.com/dev/codebell/public/uploads/images/defaultlogo.png"}]
/// advertisement_list : {"advertisement_id":5,"title":"Water","description":"","external_url":"","image":"https://notebrains.com/dev/codebell/public/uploads/advertise/oto-effects_1660719069.jpeg"}

Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
      List<DistributorList>? distributorList, 
      AdvertisementList? advertisementList,}){
    _distributorList = distributorList;
    _advertisementList = advertisementList;
}

  Response.fromJson(dynamic json) {
    if (json['distributor_list'] != null) {
      _distributorList = [];
      json['distributor_list'].forEach((v) {
        _distributorList?.add(DistributorList.fromJson(v));
      });
    }
    _advertisementList = json['advertisement_list'];
  }
  List<DistributorList>? _distributorList;
  AdvertisementList? _advertisementList;
Response copyWith({  List<DistributorList>? distributorList,
  AdvertisementList? advertisementList,
}) => Response(  distributorList: distributorList ?? _distributorList,
  advertisementList: advertisementList ?? _advertisementList,
);
  List<DistributorList>? get distributorList => _distributorList;
  AdvertisementList? get advertisementList => _advertisementList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_distributorList != null) {
      map['distributor_list'] = _distributorList?.map((v) => v.toJson()).toList();
    }
    map['advertisement_list'] = _advertisementList;
    return map;
  }

}

/// advertisement_id : 5
/// title : "Water"
/// description : ""
/// external_url : ""
/// image : "https://notebrains.com/dev/codebell/public/uploads/advertise/oto-effects_1660719069.jpeg"

AdvertisementList advertisementListFromJson(String str) => AdvertisementList.fromJson(json.decode(str));
String advertisementListToJson(AdvertisementList data) => json.encode(data.toJson());
class AdvertisementList {
  AdvertisementList({
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

  AdvertisementList.fromJson(dynamic json) {
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
AdvertisementList copyWith({  num? advertisementId,
  String? title,
  String? description,
  String? externalUrl,
  String? image,
}) => AdvertisementList(  advertisementId: advertisementId ?? _advertisementId,
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

/// name : "Myntra"
/// image : "https://notebrains.com/dev/codebell/public/uploads/distributor/app_logo (1)-1654153565.png"

DistributorList distributorListFromJson(String str) => DistributorList.fromJson(json.decode(str));
String distributorListToJson(DistributorList data) => json.encode(data.toJson());
class DistributorList {
  DistributorList({
      String? name, 
      String? image,}){
    _name = name;
    _image = image;
}

  DistributorList.fromJson(dynamic json) {
    _name = json['name'];
    _image = json['image'];
  }
  String? _name;
  String? _image;
DistributorList copyWith({  String? name,
  String? image,
}) => DistributorList(  name: name ?? _name,
  image: image ?? _image,
);
  String? get name => _name;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }

}