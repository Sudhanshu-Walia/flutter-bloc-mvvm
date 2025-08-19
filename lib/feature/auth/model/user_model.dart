class UserModel {
  String? token;
  User? user;

  UserModel({this.token, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  Location? location;
  String? sId;
  String? name;
  String? email;
  String? gender;
  String? phone;
  String? addressLane1;
  String? addressLane2;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  bool? isOnline;
  List<dynamic>? blockedUsers;
  String? role;
  bool? isVerified;
  bool? isDeleted;
  String? deletedMessage;
  bool? isDisabled;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? lastSeen;
  String? profile;
  String? deletedTime;
  String? plan;
  String? previousPlan;
  String? createdForTTL;
  List<PaymentHistory>? paymentHistory;
  String? referralCode;
  String? planEndDate;
  List<String>? fcmTokens;

  User(
      {this.location,
      this.sId,
      this.name,
      this.email,
      this.gender,
      this.phone,
      this.addressLane1,
      this.addressLane2,
      this.city,
      this.state,
      this.postalCode,
      this.country,
      this.isOnline,
      this.blockedUsers,
      this.role,
      this.isVerified,
      this.isDeleted,
      this.deletedMessage,
      this.isDisabled,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.lastSeen,
      this.profile,
      this.deletedTime,
      this.plan,
      this.previousPlan,
      this.createdForTTL,
      this.paymentHistory,
      this.referralCode,
      this.planEndDate,
      this.fcmTokens});

  User.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    phone = json['phone'];
    addressLane1 = json['addressLane1'];
    addressLane2 = json['addressLane2'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postalCode'];
    country = json['country'];
    isOnline = json['isOnline'];
    if (json['blockedUsers'] != null) {
      blockedUsers = json['blockedUsers'];
    }
    role = json['role'];
    isVerified = json['isVerified'];
    isDeleted = json['isDeleted'];
    deletedMessage = json['deletedMessage'];
    isDisabled = json['isDisabled'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    lastSeen = json['lastSeen'];
    profile = json['profile'];
    deletedTime = json['deletedTime'];
    plan = json['plan'];
    previousPlan = json['previousPlan'];
    createdForTTL = json['createdForTTL'];
    if (json['paymentHistory'] != null) {
      paymentHistory = <PaymentHistory>[];
      json['paymentHistory'].forEach((v) {
        paymentHistory!.add(PaymentHistory.fromJson(v));
      });
    }
    referralCode = json['referralCode'];
    planEndDate = json['planEndDate'];
    fcmTokens = json['fcmTokens'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['gender'] = gender;
    data['phone'] = phone;
    data['addressLane1'] = addressLane1;
    data['addressLane2'] = addressLane2;
    data['city'] = city;
    data['state'] = state;
    data['postalCode'] = postalCode;
    data['country'] = country;
    data['isOnline'] = isOnline;
    if (blockedUsers != null) {
      data['blockedUsers'] = blockedUsers;
    }
    data['role'] = role;
    data['isVerified'] = isVerified;
    data['isDeleted'] = isDeleted;
    data['deletedMessage'] = deletedMessage;
    data['isDisabled'] = isDisabled;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['lastSeen'] = lastSeen;
    data['profile'] = profile;
    data['deletedTime'] = deletedTime;
    data['plan'] = plan;
    data['previousPlan'] = previousPlan;
    data['createdForTTL'] = createdForTTL;
    if (paymentHistory != null) {
      data['paymentHistory'] = paymentHistory!.map((v) => v.toJson()).toList();
    }
    data['referralCode'] = referralCode;
    data['planEndDate'] = planEndDate;
    data['fcmTokens'] = fcmTokens;
    return data;
  }
}

class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class PaymentHistory {
  String? orderId;
  int? amount;
  String? currency;
  String? status;
  Method? method;
  String? paidAt;
  String? sId;

  PaymentHistory(
      {this.orderId,
      this.amount,
      this.currency,
      this.status,
      this.method,
      this.paidAt,
      this.sId});

  PaymentHistory.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    amount = json['amount'];
    currency = json['currency'];
    status = json['status'];
    method = json['method'] != null ? Method.fromJson(json['method']) : null;
    paidAt = json['paidAt'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = orderId;
    data['amount'] = amount;
    data['currency'] = currency;
    data['status'] = status;
    if (method != null) {
      data['method'] = method!.toJson();
    }
    data['paidAt'] = paidAt;
    data['_id'] = sId;
    return data;
  }
}

class Method {
  Upi? upi;

  Method({this.upi});

  Method.fromJson(Map<String, dynamic> json) {
    upi = json['upi'] != null ? Upi.fromJson(json['upi']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (upi != null) {
      data['upi'] = upi!.toJson();
    }
    return data;
  }
}

class Upi {
  String? channel;
  String? upiId;

  Upi({this.channel, this.upiId});

  Upi.fromJson(Map<String, dynamic> json) {
    channel = json['channel'];
    upiId = json['upi_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['channel'] = channel;
    data['upi_id'] = upiId;
    return data;
  }
}
