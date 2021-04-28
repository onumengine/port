library constants;

import 'dart:convert';

const String BASE_URL = "https://bowenstudent.bowen.edu.ng/v2/utils/";
const String BASE_URL_BOWENSTAFF =
    "http://manage.bowen.edu.ng/utils/api/v1/";
const String BASE_URL_BOWENSTAFF2 =
    "https://manage.bowen.edu.ng/utils/functions/";

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

const String CREATE_TICKET = BASE_URL + "create_ticket.php";
const String UPDATE_TIMELINE = BASE_URL + "timeline_update.php";
const String GET_TIMELINE = BASE_URL + "timeline.php";
const String GET_NOTIFICATION = BASE_URL + "notification.php";
const String VIEW_SENT = BASE_URL + "sent.php";
const String VIEW_RECEIVED = BASE_URL + "received.php";
const String GET_RECEIVER = BASE_URL + "getReceiver.php";
const String ASSIGN_ROLE = BASE_URL + "assign_staff_to_role.php";
const String LIST_STAFF_ROLES = BASE_URL + "listStaffByCollege.php";
const String GET_STUDENT_COURSES =
    BASE_URL_BOWENSTAFF + "getRegisteredCourses.php";
const String GET_CURRENT_COURSES =
    BASE_URL_BOWENSTAFF2 + "getCurrentCourses.php";
const String GET_CURRENT_COURSES_WITH_EXAM =
    BASE_URL_BOWENSTAFF2 + "getRegisteredCoursesWithExam.php";

const String GET_COURSE_MATERIALS = BASE_URL + "getCourseMaterials.php";
const String GET_STUDENT_DATA = BASE_URL + "getStudentData.php";
const String LOGIN_STRING_REQUEST = BASE_URL_BOWENSTAFF + "loginStaff.php";

const String CREATE_STUDENT_PROFILE =
    BASE_URL_BOWENSTAFF + "createStudentProfile.php";
const String CREATE_STAFF_PROFILE =
    BASE_URL_BOWENSTAFF + "createStaffProfile.php";
const String SUSPEND_ACCOUNT =
    BASE_URL_BOWENSTAFF + "suspendOrActivateAccount.php";
const String DELETE_COURSE = BASE_URL_BOWENSTAFF + "removeRegisteredCourse.php";
const String UPDATE_SCORE = BASE_URL_BOWENSTAFF + "updateScores.php";
const String GET_USER = BASE_URL_BOWENSTAFF + "getUser.php";
const String RESET_PASSWORD = BASE_URL_BOWENSTAFF + "resetPassword.php";
const String GET_LECTURER_ROLES = BASE_URL_BOWENSTAFF + "getRoles.php";
const String GET_STUDENTS_BY_COURSE =
    BASE_URL_BOWENSTAFF + "getCourseStudents.php";
