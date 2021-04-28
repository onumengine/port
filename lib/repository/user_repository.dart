import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'api_client.dart';
import 'package:port/utility/constants.dart' as Constants;
import '../model/user.dart';
import '../model/student.dart';

import '../model/generic_response.dart';
import '../model/login_response.dart';

abstract class UserService {
//  Future<User> getCurrentUser();
//  Future<void> signOut();
//  Future<bool> isLoggedIn();
//  Future<User> getUserDetails(String sessionId, String sessionToken);
//  Future<void> LoginUser(User user,String sessionId, String sessionToken);
//  Future<List<NotificationModel>> listNotification();
//  Future<String> getSessionValue(String key);
//  Future<List<BasicUserDetails>> searchUsers(String searchQuery);
//  Future<List<BasicUserDetails>> follow(String userId);
//  Future<List<BasicUserDetails>> listFollowersOrFollowing(String type);
//  Future<List<BasicUserDetails>> getRetixers( String post_id);
//  Future<List<BasicUserDetails>> getPostCarders(String post_id, String type);
//  Future<GenericResponse> updatePassword (String password);
}

class UserRepository extends UserService {
  ApiClient _apiClient = ApiClient();
  SharedPreferences prefs = null;

  void openCache() async {
    prefs = await SharedPreferences.getInstance();
  }


  @override
  Future<GenericResponse> createStudent(Student student) async {
    User user = await getCurrentUser();
    var body = <String, dynamic>{
      'matric': student.matric,
      'firstname': student.firstname,
      'lastname': student.lastname,
      'middlename': student.middle,
      'sex': student.gender,
      'phone': student.phone,
      'email': student.email,
      'collcode': student.college,
      'progcode': student.programme,
      'motherphone': student.motherphone,
      'fatherphone': student.fatherphone,
      'dob': student.dob,
      'yoe': student.yoe,
      'address': student.address,
      'hostel': student.hostel,
      'room': student.room,
      'actor': user.id
    };
    var response =
        await _apiClient.postForm(Constants.CREATE_STUDENT_PROFILE, body);
    print("createStudentResponse : " + response);
    var data = json.decode(response);
    return GenericResponse.fromJson(data);
  }



  @override
  Future<LoginResponse> signInWithEmailAndPassword(
      String username, String password) async {
    var body = <String, dynamic>{
      'username': username,
      'password': password
    };
    var response =
        await _apiClient.postForm(Constants.LOGIN_STRING_REQUEST, body);
    print("loginResponse : " + response);
    var data = json.decode(response);
    return LoginResponse.fromJson(data);
  }

//  @override
//  Future<GenericResponse> resetPassword(String id) async {
//    User user = await getCurrentUser();
//    var body = <String, dynamic>{'id': id, 'actor': user.id};
//    var response = await _apiClient.postForm(Constants.RESET_PASSWORD, body);
//    print("suspendAccount : " + response);
//    var data = json.decode(response);
//    return GenericResponse.fromJson(data);
//  }



  /*
  * sets user login status to true
  */
  Future<void> loginUser(User user) async {
    await openCache();
    prefs.setBool(Constants.CHECK_LOGIN_STATUS, true);
    bool loginStatus = prefs.getBool(Constants.CHECK_LOGIN_STATUS);
    print("login status:" + loginStatus.toString());
    prefs.setString(Constants.LOGGED_IN_USER, json.encode(user));
    print("login cached:" + json.encode(user));
  }

  /*
  * returns the users login status
  */
  @override
  Future<bool> isLoggedIn() async {
    await openCache();
    // check if the key even exists
    bool checkValue = prefs.containsKey(Constants.CHECK_LOGIN_STATUS);

    if (checkValue) {
      bool loginStatus = prefs.getBool(Constants.CHECK_LOGIN_STATUS);
      print("isLoggedIn:" + loginStatus.toString());
      return loginStatus;
    } else {
      return false;
    }
  }

  // checks shared preferences and fetches the user data saved there
  @override
  Future<String> getSessionValue(String key) async {
    await openCache();
    String value = prefs.getString(key);
    //print("session status get:" + value);
    return value;
  }

  // checks shared preferences and fetches the user data saved there
  @override
  Future<User> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = prefs.getString(Constants.LOGGED_IN_USER);
    var data = json.decode(userJson);
    print("getCurrentUser:" + userJson);
    User user = User.fromJson(data);
    return user;
  }
}
