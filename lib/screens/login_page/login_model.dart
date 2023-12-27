class LoginResponseModel {
  LoginResponseData? data;

  LoginResponseModel({this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new LoginResponseData.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginResponseData {
  String? bearer;
  String? status;
  String? message;

  LoginResponseData({this.bearer, this.status, this.message});

  LoginResponseData.fromJson(Map<String, dynamic> json) {
    bearer = json['Bearer'];
    status = json['Status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Bearer'] = this.bearer;
    data['Status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}