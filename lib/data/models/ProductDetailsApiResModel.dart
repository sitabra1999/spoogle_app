/// status : 1
/// message : "Product Details"
/// response : {"category_name":"Fruit & Vegetables","category_id":4,"product_name":"Fruits","product_id":"PRD00004","image":"https://mridayaitservices.com/demo/restobuy/uploads/product/culture-2-1643263670.png","special_notes":"Test","description":"<p>This is a test Product</p>","multiple_image":[{"img_id":5,"image":"https://mridayaitservices.com/demo/restobuy/uploads/product/culture-2-1643263670.png"},{"img_id":6,"image":"https://mridayaitservices.com/demo/restobuy/uploads/product/healthy-eating-ingredients-732x549-thumbnail-1645513043.jpg"}],"variant":[{"unit":"1Kg","qty":"100","price":"10"},{"unit":"2kg","qty":"100","price":"20"}],"category":[{"category_id":1,"category_name":"Bakery, Cakes & Dairy"},{"category_id":2,"category_name":"Egg, Meat & Fish"},{"category_id":3,"category_name":"Foodgrains, Oil & Masala"},{"category_id":4,"category_name":"Fruit & Vegetables"},{"category_id":5,"category_name":"Beverages"}]}

class ProductDetailsApiResModel {
  ProductDetailsApiResModel({
      int? status, 
      String? message, 
      Response? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  ProductDetailsApiResModel.fromJson(dynamic json) {
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

/// category_name : "Fruit & Vegetables"
/// category_id : 4
/// product_name : "Fruits"
/// product_id : "PRD00004"
/// image : "https://mridayaitservices.com/demo/restobuy/uploads/product/culture-2-1643263670.png"
/// special_notes : "Test"
/// description : "<p>This is a test Product</p>"
/// multiple_image : [{"img_id":5,"image":"https://mridayaitservices.com/demo/restobuy/uploads/product/culture-2-1643263670.png"},{"img_id":6,"image":"https://mridayaitservices.com/demo/restobuy/uploads/product/healthy-eating-ingredients-732x549-thumbnail-1645513043.jpg"}]
/// variant : [{"unit":"1Kg","qty":"100","price":"10"},{"unit":"2kg","qty":"100","price":"20"}]
/// category : [{"category_id":1,"category_name":"Bakery, Cakes & Dairy"},{"category_id":2,"category_name":"Egg, Meat & Fish"},{"category_id":3,"category_name":"Foodgrains, Oil & Masala"},{"category_id":4,"category_name":"Fruit & Vegetables"},{"category_id":5,"category_name":"Beverages"}]

class Response {
  Response({
      String? categoryName, 
      int? categoryId, 
      String? productName, 
      String? productId, 
      String? image, 
      String? specialNotes, 
      String? description, 
      List<MultipleImage>? multipleImage, 
      List<Variant>? variant, 
      List<Category>? category,}){
    _categoryName = categoryName;
    _categoryId = categoryId;
    _productName = productName;
    _productId = productId;
    _image = image;
    _specialNotes = specialNotes;
    _description = description;
    _multipleImage = multipleImage;
    _variant = variant;
    _category = category;
}

  Response.fromJson(dynamic json) {
    _categoryName = json['category_name'];
    _categoryId = json['category_id'];
    _productName = json['product_name'];
    _productId = json['product_id'];
    _image = json['image'];
    _specialNotes = json['special_notes'];
    _description = json['description'];
    if (json['multiple_image'] != null) {
      _multipleImage = [];
      json['multiple_image'].forEach((v) {
        _multipleImage?.add(MultipleImage.fromJson(v));
      });
    }
    if (json['variant'] != null) {
      _variant = [];
      json['variant'].forEach((v) {
        _variant?.add(Variant.fromJson(v));
      });
    }
    if (json['category'] != null) {
      _category = [];
      json['category'].forEach((v) {
        _category?.add(Category.fromJson(v));
      });
    }
  }
  String? _categoryName;
  int? _categoryId;
  String? _productName;
  String? _productId;
  String? _image;
  String? _specialNotes;
  String? _description;
  List<MultipleImage>? _multipleImage;
  List<Variant>? _variant;
  List<Category>? _category;

  String? get categoryName => _categoryName;
  int? get categoryId => _categoryId;
  String? get productName => _productName;
  String? get productId => _productId;
  String? get image => _image;
  String? get specialNotes => _specialNotes;
  String? get description => _description;
  List<MultipleImage>? get multipleImage => _multipleImage;
  List<Variant>? get variant => _variant;
  List<Category>? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_name'] = _categoryName;
    map['category_id'] = _categoryId;
    map['product_name'] = _productName;
    map['product_id'] = _productId;
    map['image'] = _image;
    map['special_notes'] = _specialNotes;
    map['description'] = _description;
    if (_multipleImage != null) {
      map['multiple_image'] = _multipleImage?.map((v) => v.toJson()).toList();
    }
    if (_variant != null) {
      map['variant'] = _variant?.map((v) => v.toJson()).toList();
    }
    if (_category != null) {
      map['category'] = _category?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// category_id : 1
/// category_name : "Bakery, Cakes & Dairy"

class Category {
  Category({
      int? categoryId, 
      String? categoryName,}){
    _categoryId = categoryId;
    _categoryName = categoryName;
}

  Category.fromJson(dynamic json) {
    _categoryId = json['category_id'];
    _categoryName = json['category_name'];
  }
  int? _categoryId;
  String? _categoryName;

  int? get categoryId => _categoryId;
  String? get categoryName => _categoryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = _categoryId;
    map['category_name'] = _categoryName;
    return map;
  }

}

/// unit : "1Kg"
/// qty : "100"
/// price : "10"

class Variant {
  Variant({
      String? unit, 
      String? qty, 
      String? price,}){
    _unit = unit;
    _qty = qty;
    _price = price;
}

  Variant.fromJson(dynamic json) {
    _unit = json['unit'];
    _qty = json['qty'];
    _price = json['price'];
  }
  String? _unit;
  String? _qty;
  String? _price;

  String? get unit => _unit;
  String? get qty => _qty;
  String? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['unit'] = _unit;
    map['qty'] = _qty;
    map['price'] = _price;
    return map;
  }

}

/// img_id : 5
/// image : "https://mridayaitservices.com/demo/restobuy/uploads/product/culture-2-1643263670.png"

class MultipleImage {
  MultipleImage({
      int? imgId, 
      String? image,}){
    _imgId = imgId;
    _image = image;
}

  MultipleImage.fromJson(dynamic json) {
    _imgId = json['img_id'];
    _image = json['image'];
  }
  int? _imgId;
  String? _image;

  int? get imgId => _imgId;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['img_id'] = _imgId;
    map['image'] = _image;
    return map;
  }

}