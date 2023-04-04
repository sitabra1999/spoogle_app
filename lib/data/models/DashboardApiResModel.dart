/// status : 1
/// message : "Dashboard Data"
/// response : {"product":4,"requisitions":2,"po":2,"invoice":1,"transactions":1,"review":1,"disputes":1}

class DashboardApiResModel {
  DashboardApiResModel({
      int? status, 
      String? message, 
      Response? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  DashboardApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  int? _status;
  String? _message;
  Response? _response;

  int? get status => _status;
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

/// product : 4
/// requisitions : 2
/// po : 2
/// invoice : 1
/// transactions : 1
/// review : 1
/// disputes : 1

class Response {
  Response({
      int? product, 
      int? requisitions, 
      int? po, 
      int? invoice, 
      int? transactions, 
      int? review, 
      int? disputes,}){
    _product = product;
    _requisitions = requisitions;
    _po = po;
    _invoice = invoice;
    _transactions = transactions;
    _review = review;
    _disputes = disputes;
}

  Response.fromJson(dynamic json) {
    _product = json['product'];
    _requisitions = json['requisitions'];
    _po = json['po'];
    _invoice = json['invoice'];
    _transactions = json['transactions'];
    _review = json['review'];
    _disputes = json['disputes'];
  }
  int? _product;
  int? _requisitions;
  int? _po;
  int? _invoice;
  int? _transactions;
  int? _review;
  int? _disputes;

  int? get product => _product;
  int? get requisitions => _requisitions;
  int? get po => _po;
  int? get invoice => _invoice;
  int? get transactions => _transactions;
  int? get review => _review;
  int? get disputes => _disputes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product'] = _product;
    map['requisitions'] = _requisitions;
    map['po'] = _po;
    map['invoice'] = _invoice;
    map['transactions'] = _transactions;
    map['review'] = _review;
    map['disputes'] = _disputes;
    return map;
  }

}