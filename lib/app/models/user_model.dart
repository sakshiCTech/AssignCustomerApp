class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String paymentMode;
  String userType;
  String gender;
  String countryCode;
  String mobile;
  String deviceToken;
  String deviceId;
  String deviceType;
  String loginBy;
  String language;
  String qrcodeUrl;
  String referralUniqueId;
  int referalCount;
  String trialEndsAt;
  String avatar;
  int socialUniqueId;
  double latitude;
  double longitude;
  int stripeCustId;
  int walletBalance;
  int otp;
  String emailVerifiedAt;
  String blocked;
  String deletedAt;
  String createdAt;
  String updatedAt;
  String currency;
  String sos;
  String measurement;
  String accessToken;
  int rating;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.paymentMode,
        this.userType,
        this.gender,
        this.countryCode,
        this.mobile,
        this.deviceToken,
        this.deviceId,
        this.deviceType,
        this.loginBy,
        this.language,
        this.qrcodeUrl,
        this.referralUniqueId,
        this.referalCount,
        this.trialEndsAt,
        this.avatar,
        this.socialUniqueId,
        this.latitude,
        this.longitude,
        this.stripeCustId,
        this.walletBalance,
        this.otp,
        this.emailVerifiedAt,
        this.blocked,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.currency,
        this.sos,
        this.measurement,
        this.accessToken,
        this.rating});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    paymentMode = json['payment_mode'];
    userType = json['user_type'];
    gender = json['gender'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    deviceToken = json['device_token'];
    deviceId = json['device_id'];
    deviceType = json['device_type'];
    loginBy = json['login_by'];
    language = json['language'];
    qrcodeUrl = json['qrcode_url'];
    referralUniqueId = json['referral_unique_id'];
    referalCount = json['referal_count'];
    trialEndsAt = json['trial_ends_at'];
    avatar = json['avatar'];
    socialUniqueId = json['social_unique_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    stripeCustId = json['stripe_cust_id'];
    walletBalance = json['wallet_balance'];
    otp = json['otp'];
    emailVerifiedAt = json['email_verified_at'];
    blocked = json['blocked'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    currency = json['currency'];
    sos = json['sos'];
    measurement = json['measurement'];
    accessToken = json['access_token'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['payment_mode'] = this.paymentMode;
    data['user_type'] = this.userType;
    data['gender'] = this.gender;
    data['country_code'] = this.countryCode;
    data['mobile'] = this.mobile;
    data['device_token'] = this.deviceToken;
    data['device_id'] = this.deviceId;
    data['device_type'] = this.deviceType;
    data['login_by'] = this.loginBy;
    data['language'] = this.language;
    data['qrcode_url'] = this.qrcodeUrl;
    data['referral_unique_id'] = this.referralUniqueId;
    data['referal_count'] = this.referalCount;
    data['trial_ends_at'] = this.trialEndsAt;
    data['avatar'] = this.avatar;
    data['social_unique_id'] = this.socialUniqueId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['stripe_cust_id'] = this.stripeCustId;
    data['wallet_balance'] = this.walletBalance;
    data['otp'] = this.otp;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['blocked'] = this.blocked;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['currency'] = this.currency;
    data['sos'] = this.sos;
    data['measurement'] = this.measurement;
    data['access_token'] = this.accessToken;
    data['rating'] = this.rating;
    return data;
  }
}
