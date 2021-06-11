library constants;

import 'dart:convert';

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

// API fetch paths
const String CATEGORIES_FETCH_PATH = BASE_URL + "categories";
const String ICON_FETCH_PATH = "http://innovativehill.com/port/api/icons/";
const String LOGIN_STRING_REQUEST = BASE_URL + "user/login";
const String NOTIFICATIONS_FETCH_PATH = BASE_URL + "user/notification/1";
const String PURPOSES_FETCH_PATH =
    "http://innovativehill.com/port/api/schedule/purpose";
const String SCHEDULES_FETCH_PATH = BASE_URL + "user/schedule/3";
const String USERS_FETCH_PATH = BASE_URL + "/organization/user";

// API post paths
const String CREATE_STUDENT_PROFILE = BASE_URL + "";
const String SCHEDULE_POST_PATH = BASE_URL + "schedule/create";
