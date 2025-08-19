class ParticipantModel {
  String? id;
  bool? isGroupChat;
  List<UserModel>? participants;
  String? createdAt;
  String? updatedAt;
  int? v;
  LastMessage? lastMessage;

  ParticipantModel({
    this.id,
    this.isGroupChat,
    this.participants,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.lastMessage,
  });

  factory ParticipantModel.fromJson(Map<String, dynamic> json) {
    return ParticipantModel(
      id: json['_id'],
      isGroupChat: json['isGroupChat'],
      participants: (json['participants'] as List?)
          ?.map((e) => UserModel.fromJson(e))
          .toList(),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
      lastMessage: json['lastMessage'] != null
          ? LastMessage.fromJson(json['lastMessage'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'isGroupChat': isGroupChat,
      'participants': participants?.map((e) => e.toJson()).toList(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'lastMessage': lastMessage?.toJson(),
    };
  }
}

class UserModel {
  Location? location;
  String? id;
  String? name;
  String? email;
  String? password;
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
  int? v;
  String? lastSeen;
  String? plan;
  String? previousPlan;
  String? profile;
  String? deletedTime;
  String? createdForTTL;
  String? referralCode;
  String? planEndDate;
  List<String>? fcmTokens;
  List<PaymentHistory>? paymentHistory;

  UserModel({
    this.location,
    this.id,
    this.name,
    this.email,
    this.password,
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
    this.v,
    this.lastSeen,
    this.plan,
    this.previousPlan,
    this.profile,
    this.deletedTime,
    this.createdForTTL,
    this.referralCode,
    this.planEndDate,
    this.fcmTokens,
    this.paymentHistory,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      location:
      json['location'] != null ? Location.fromJson(json['location']) : null,
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      gender: json['gender'],
      phone: json['phone'],
      addressLane1: json['addressLane1'],
      addressLane2: json['addressLane2'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postalCode'],
      country: json['country'],
      isOnline: json['isOnline'],
      blockedUsers: json['blockedUsers'],
      role: json['role'],
      isVerified: json['isVerified'],
      isDeleted: json['isDeleted'],
      deletedMessage: json['deletedMessage'],
      isDisabled: json['isDisabled'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
      lastSeen: json['lastSeen'],
      plan: json['plan'],
      previousPlan: json['previousPlan'],
      profile: json['profile'],
      deletedTime: json['deletedTime'],
      createdForTTL: json['createdForTTL'],
      referralCode: json['referralCode'],
      planEndDate: json['planEndDate'],
      fcmTokens: (json['fcmTokens'] as List?)?.map((e) => e.toString()).toList(),
      paymentHistory: (json['paymentHistory'] as List?)
          ?.map((e) => PaymentHistory.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location?.toJson(),
      '_id': id,
      'name': name,
      'email': email,
      'password': password,
      'gender': gender,
      'phone': phone,
      'addressLane1': addressLane1,
      'addressLane2': addressLane2,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
      'isOnline': isOnline,
      'blockedUsers': blockedUsers,
      'role': role,
      'isVerified': isVerified,
      'isDeleted': isDeleted,
      'deletedMessage': deletedMessage,
      'isDisabled': isDisabled,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'lastSeen': lastSeen,
      'plan': plan,
      'previousPlan': previousPlan,
      'profile': profile,
      'deletedTime': deletedTime,
      'createdForTTL': createdForTTL,
      'referralCode': referralCode,
      'planEndDate': planEndDate,
      'fcmTokens': fcmTokens,
      'paymentHistory': paymentHistory?.map((e) => e.toJson()).toList(),
    };
  }
}

class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}

class PaymentHistory {
  String? orderId;
  int? amount;
  String? currency;
  String? status;
  Method? method;
  String? paidAt;
  String? id;

  PaymentHistory({
    this.orderId,
    this.amount,
    this.currency,
    this.status,
    this.method,
    this.paidAt,
    this.id,
  });

  factory PaymentHistory.fromJson(Map<String, dynamic> json) {
    return PaymentHistory(
      orderId: json['orderId'],
      amount: json['amount'],
      currency: json['currency'],
      status: json['status'],
      method: json['method'] != null ? Method.fromJson(json['method']) : null,
      paidAt: json['paidAt'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'amount': amount,
      'currency': currency,
      'status': status,
      'method': method?.toJson(),
      'paidAt': paidAt,
      '_id': id,
    };
  }
}

class Method {
  Upi? upi;

  Method({this.upi});

  factory Method.fromJson(Map<String, dynamic> json) {
    return Method(
      upi: json['upi'] != null ? Upi.fromJson(json['upi']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'upi': upi?.toJson(),
    };
  }
}

class Upi {
  String? channel;
  String? upiId;

  Upi({this.channel, this.upiId});

  factory Upi.fromJson(Map<String, dynamic> json) {
    return Upi(
      channel: json['channel'],
      upiId: json['upi_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'channel': channel,
      'upi_id': upiId,
    };
  }
}

class LastMessage {
  String? id;
  String? senderId;
  String? content;
  String? messageType;
  String? fileUrl;
  String? createdAt;

  LastMessage({
    this.id,
    this.senderId,
    this.content,
    this.messageType,
    this.fileUrl,
    this.createdAt,
  });

  factory LastMessage.fromJson(Map<String, dynamic> json) {
    return LastMessage(
      id: json['_id'],
      senderId: json['senderId'],
      content: json['content'],
      messageType: json['messageType'],
      fileUrl: json['fileUrl'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'senderId': senderId,
      'content': content,
      'messageType': messageType,
      'fileUrl': fileUrl,
      'createdAt': createdAt,
    };
  }
}
