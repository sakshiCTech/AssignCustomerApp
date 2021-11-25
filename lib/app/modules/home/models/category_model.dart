class Category {
  int id;
  Name name;
  String slug;
  String icon;
  String bgcolour;
  Name desc;
  int status;
  String parentId;
  String createdAt;
  String updatedAt;

  Category(
      {this.id,
        this.name,
        this.slug,
        this.icon,
        this.bgcolour,
        this.desc,
        this.status,
        this.parentId,
        this.createdAt,
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    slug = json['slug'];
    icon = json['icon'];
    bgcolour = json['bgcolour'];
    desc = json['desc'] != null ? new Name.fromJson(json['desc']) : null;
    status = json['status'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    data['slug'] = this.slug;
    data['icon'] = this.icon;
    data['bgcolour'] = this.bgcolour;
    if (this.desc != null) {
      data['desc'] = this.desc.toJson();
    }
    data['status'] = this.status;
    data['parent_id'] = this.parentId;
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
