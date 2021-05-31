library constants;

import 'dart:convert';

const String BASE_URLOLD =
    "https://virtualmerenda.000webhostapp.com/vetlyn/index.php/";
const String BASE_URL = "http://innovativehill.com/port/api/index.php/";

// http client constants
var headers = <String, String>{
  "Accept": "application/x-www-form-urlencoded",
  'Content-Type': 'application/x-www-form-urlencoded',
  'app_key': 'vvv'
};

var sessionDetails = jsonEncode(<String, String>{
  'session_id': "101",
  'session_token': "Sportixe_c962f2fbe7e7c1c5e5a51438db9b06c9"
});

// secure storage keys
const String CHECK_LOGIN_STATUS = "loginstatus";
const String SESSION_ID = "session_id";
const String SESSION_TOKEN = "session_token";
const String LOGGED_IN_USER = "user";

const String LOGIN_STRING_REQUEST = BASE_URL + "user/login";

const String CREATE_STUDENT_PROFILE = BASE_URL + "";
