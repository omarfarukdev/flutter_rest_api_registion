class OTPVerify {
  bool? success;
  Data? data;
  String? message;

  OTPVerify({this.success, this.data, this.message});

  OTPVerify.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? token;
  int? isverified;

  Data({this.token, this.isverified});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    isverified = json['isverified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['isverified'] = this.isverified;
    return data;
  }
}