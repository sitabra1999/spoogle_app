/// status : "Success"
/// message : "Document already verified"
/// data : {"id":1,"user_id":1,"document_id":1,"document_front_image":"","document_back_image":"","document_number":"BHPPM1282D","document_exp_date":"","document_ocr_data":"{\"is_pan_dob_valid\":true,\"name_matched\":false}","created_at":"2022-03-14T02:50:07.000000Z","updated_at":"2022-03-14T02:50:07.000000Z"}

class KycDocApiModel {
  KycDocApiModel({
      String? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  KycDocApiModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  Data? _data;
KycDocApiModel copyWith({  String? status,
  String? message,
  Data? data,
}) => KycDocApiModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
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

/// id : 1
/// user_id : 1
/// document_id : 1
/// document_front_image : ""
/// document_back_image : ""
/// document_number : "BHPPM1282D"
/// document_exp_date : ""
/// document_ocr_data : "{\"is_pan_dob_valid\":true,\"name_matched\":false}"
/// created_at : "2022-03-14T02:50:07.000000Z"
/// updated_at : "2022-03-14T02:50:07.000000Z"

class Data {
  Data({
      int? id, 
      int? userId, 
      int? documentId, 
      String? documentFrontImage, 
      String? documentBackImage, 
      String? documentNumber, 
      String? documentExpDate, 
      String? documentOcrData, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _documentId = documentId;
    _documentFrontImage = documentFrontImage;
    _documentBackImage = documentBackImage;
    _documentNumber = documentNumber;
    _documentExpDate = documentExpDate;
    _documentOcrData = documentOcrData;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _documentId = json['document_id'];
    _documentFrontImage = json['document_front_image'];
    _documentBackImage = json['document_back_image'];
    _documentNumber = json['document_number'];
    _documentExpDate = json['document_exp_date'];
    _documentOcrData = json['document_ocr_data'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _userId;
  int? _documentId;
  String? _documentFrontImage;
  String? _documentBackImage;
  String? _documentNumber;
  String? _documentExpDate;
  String? _documentOcrData;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  int? id,
  int? userId,
  int? documentId,
  String? documentFrontImage,
  String? documentBackImage,
  String? documentNumber,
  String? documentExpDate,
  String? documentOcrData,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  documentId: documentId ?? _documentId,
  documentFrontImage: documentFrontImage ?? _documentFrontImage,
  documentBackImage: documentBackImage ?? _documentBackImage,
  documentNumber: documentNumber ?? _documentNumber,
  documentExpDate: documentExpDate ?? _documentExpDate,
  documentOcrData: documentOcrData ?? _documentOcrData,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  int? get userId => _userId;
  int? get documentId => _documentId;
  String? get documentFrontImage => _documentFrontImage;
  String? get documentBackImage => _documentBackImage;
  String? get documentNumber => _documentNumber;
  String? get documentExpDate => _documentExpDate;
  String? get documentOcrData => _documentOcrData;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['document_id'] = _documentId;
    map['document_front_image'] = _documentFrontImage;
    map['document_back_image'] = _documentBackImage;
    map['document_number'] = _documentNumber;
    map['document_exp_date'] = _documentExpDate;
    map['document_ocr_data'] = _documentOcrData;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}