class Slide {
  int id;
  String url;
  String video;
  String clickUrl;
  int position;
  String status;
  String createdAt;
  String updatedAt;

  Slide(
      {this.id,
        this.url,
        this.video,
        this.clickUrl,
        this.position,
        this.status,
        this.createdAt,
        this.updatedAt});

  Slide.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    video = json['video'];
    clickUrl = json['click_url'];
    position = json['position'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['video'] = this.video;
    data['click_url'] = this.clickUrl;
    data['position'] = this.position;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  get imageUrl => 'https://pro.assign.co.nz/$url';
}
