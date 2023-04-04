/// status : 1
/// message : "Notification List"
/// response : [{"title":"PO Generated","body":"Ozora has completed the approval process. The PO PO00006 has been generated.","datetime":"25-02-2022 01:35 AM"},{"title":"New Requisition Order","body":"Ozora has given a New Requisition Order. Order No is RQ00007","datetime":"25-02-2022 01:33 AM"},{"title":"New Requisition Order","body":"Ozora has given a New Requisition Order. Order No is RQ00007","datetime":"25-02-2022 01:33 AM"},{"title":"New Requisition Order","body":"Ozora has given a New Requisition Order. Order No is RQ00007","datetime":"25-02-2022 01:33 AM"},{"title":"New Requisition Order","body":"Ozora has given a New Requisition Order. Order No is RQ00006","datetime":"24-02-2022 07:04 AM"},{"title":"New Requisition Order","body":"Ozora has given a New Requisition Order. Order No is RQ00005","datetime":"24-02-2022 04:51 AM"},{"title":"New Requisition Order","body":"Ozora has given a New Requisition Order. Order No is RQ00005","datetime":"24-02-2022 04:51 AM"},{"title":"New Requisition Order","body":"Ozora has given a New Requisition Order. Order No is RQ00005","datetime":"24-02-2022 04:51 AM"},{"title":"New Requisition Order","body":"Ozora has given a New Requisition Order. Order No is RQ00004","datetime":"22-02-2022 06:38 AM"},{"title":"New Requisition Order","body":"Ozora has given a New Requisition Order. Order No is RQ00003","datetime":"22-02-2022 05:21 AM"},{"title":"New Requisition Order","body":"Ozora has given a New Requisition Order. Order No is RQ00003","datetime":"22-02-2022 05:21 AM"},{"title":"New Requisition Order","body":"Ozora has given a New Requisition Order. Order No is RQ00002","datetime":"09-02-2022 09:56 AM"},{"title":"New Requisition Order","body":"Ozora has given a New Requisition Order. Order No is RQ00002","datetime":"09-02-2022 09:56 AM"},{"title":"PO Generated","body":"Ozora has completed the approval process. The PO PO00002 has been generated.","datetime":"09-02-2022 01:16 AM"},{"title":"New Requisition Order","body":"Ozora has given a New Requisition Order. Order No is RQ00001","datetime":"09-02-2022 01:13 AM"},{"title":"New Requisition Order","body":"Ozora has given a New Requisition Order. Order No is RQ00001","datetime":"09-02-2022 01:13 AM"}]

class NotificationApiResModel {
  NotificationApiResModel({
      int? status, 
      String? message, 
      List<Response>? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  NotificationApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['response'] != null) {
      _response = [];
      json['response'].forEach((v) {
        _response?.add(Response.fromJson(v));
      });
    }
  }
  int? _status;
  String? _message;
  List<Response>? _response;

  int? get status => _status;
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

/// title : "PO Generated"
/// body : "Ozora has completed the approval process. The PO PO00006 has been generated."
/// datetime : "25-02-2022 01:35 AM"

class Response {
  Response({
      String? title, 
      String? body, 
      String? datetime,}){
    _title = title;
    _body = body;
    _datetime = datetime;
}

  Response.fromJson(dynamic json) {
    _title = json['title'];
    _body = json['body'];
    _datetime = json['datetime'];
  }
  String? _title;
  String? _body;
  String? _datetime;

  String? get title => _title;
  String? get body => _body;
  String? get datetime => _datetime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['body'] = _body;
    map['datetime'] = _datetime;
    return map;
  }

}