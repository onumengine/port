import 'user.dart';

class LoginResponse {
  bool error;
  String message;
  User account;
  // LoginResponse(this.error,this.session_token,this.session_id,this.message);
  LoginResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (!error) account = User.fromJson(json['account']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['code'] = this.message;
    return data;
  }
}
