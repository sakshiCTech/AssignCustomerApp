import 'package:get/get.dart';
import 'package:home_services/app/services/global_service.dart';

class Service {
  int id;
  int parentId;
  Name name;
  String image;
  String marker;
  int discount;
  String url;
  String duration;
  int price;
  String custQtyunit;
  String calculator;
  Name description;
  int status;
  String deletedAt;
  String createdAt;
  String updatedAt;

  Service(
      {this.id,
        this.parentId,
        this.name,
        this.image,
        this.marker,
        this.discount,
        this.url,
        this.duration,
        this.price,
        this.custQtyunit,
        this.calculator,
        this.description,
        this.status,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  get imageUrl => Get.find<GlobalService>().baseUrl + 'public/storage/' + image;

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    image = json['image'];
    marker = json['marker'];
    discount = json['discount'];
    url = json['url'];
    duration = json['duration'];
    price = json['price'];
    custQtyunit = json['cust_qtyunit'];
    calculator = json['calculator'];
    description = json['description'] != null
        ? new Name.fromJson(json['description'])
        : null;
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    data['image'] = this.image;
    data['marker'] = this.marker;
    data['discount'] = this.discount;
    data['url'] = this.url;
    data['duration'] = this.duration;
    data['price'] = this.price;
    data['cust_qtyunit'] = this.custQtyunit;
    data['calculator'] = this.calculator;
    if (this.description != null) {
      data['description'] = this.description.toJson();
    }
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Name {
  String en;

  Name({this.en});

  Name.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    return data;
  }
}
