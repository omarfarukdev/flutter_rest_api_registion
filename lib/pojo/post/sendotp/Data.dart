class Data {
  String? token;
  String? phoneNumber;

  Data({this.token, this.phoneNumber});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}