/// status : 1
/// message : "Product List"
/// response : [{"product_id":19,"category_name":"Bakery, Cakes & Dairy","product_name":"Diary","productid":"PRD00018","status":1,"image":"https://mridayaitservices.com/demo/restobuy/uploads/product/img_1645684631.jpg"},{"product_id":17,"category_name":"Egg, Meat & Fish","product_name":"Y product","productid":"PRD00017","status":0,"image":"https://mridayaitservices.com/demo/restobuy/uploads/product/img_1645683800.jpg"},{"product_id":16,"category_name":"Egg, Meat & Fish","product_name":"cfcfg","productid":"PRD00016","status":1,"image":"https://mridayaitservices.com/demo/restobuy/uploads/product/img_1645619194.jpg"},{"product_id":15,"category_name":"Egg, Meat & Fish","product_name":"cfcfg","productid":"PRD00013","status":0,"image":"https://mridayaitservices.com/demo/restobuy/uploads/product/img_1645619100.jpg"},{"product_id":9,"category_name":"Foodgrains, Oil & Masala","product_name":"Test Product 2","productid":"PRD00009","status":1,"image":"https://mridayaitservices.com/demo/restobuy/uploads/product/1800ss_getty_rf_fiber_foods-1645598482.jpg"},{"product_id":8,"category_name":"Egg, Meat & Fish","product_name":"Test Product 1","productid":"PRD00005","status":1,"image":"https://mridayaitservices.com/demo/restobuy/uploads/product/Junk-food-vector-illustration-1645598383.jpg"},{"product_id":4,"category_name":"Fruit & Vegetables","product_name":"Fruits","productid":"PRD00004","status":1,"image":"https://mridayaitservices.com/demo/restobuy/uploads/product/culture-2-1643263670.png"},{"product_id":3,"category_name":"Fruit & Vegetables","product_name":"Fruits and Vegitables","productid":"PRD00003","status":1,"image":"https://mridayaitservices.com/demo/restobuy/uploads/product/download (2)-1629288288.jpg"}]

class ProductApiResModel {
  ProductApiResModel({
      int? status, 
      String? message, 
      List<Response>? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  ProductApiResModel.fromJson(dynamic json) {
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

/// product_id : 19
/// category_name : "Bakery, Cakes & Dairy"
/// product_name : "Diary"
/// productid : "PRD00018"
/// status : 1
/// image : "https://mridayaitservices.com/demo/restobuy/uploads/product/img_1645684631.jpg"

class Response {
  Response({
      int? productId, 
      String? categoryName, 
      String? productName, 
      String? productid, 
      int? status, 
      String? image,}){
    _productId = productId;
    _categoryName = categoryName;
    _productName = productName;
    _productid = productid;
    _status = status;
    _image = image;
}

  Response.fromJson(dynamic json) {
    _productId = json['product_id'];
    _categoryName = json['category_name'];
    _productName = json['product_name'];
    _productid = json['productid'];
    _status = json['status'];
    _image = json['image'];
  }
  int? _productId;
  String? _categoryName;
  String? _productName;
  String? _productid;
  int? _status;
  String? _image;

  int? get productId => _productId;
  String? get categoryName => _categoryName;
  String? get productName => _productName;
  String? get productid => _productid;
  int? get status => _status;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = _productId;
    map['category_name'] = _categoryName;
    map['product_name'] = _productName;
    map['productid'] = _productid;
    map['status'] = _status;
    map['image'] = _image;
    return map;
  }

}