
class Student {
  bool error;
  String matric;
  String id,username,firstname,lastname,api;
  String programme,college,gender,isVerified;
  String isDisabled,profilePhoto;
 int spill;
  String middle;
  String email;
  String phone;
  String dob;
  String fatherphone;
  String motherphone;
  String hostel;
  String yoe;
  String address;
  String room;

  Student.init();
  // this is a class function
  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matric = json['StudentsId'];
    username = json['middlename'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    programme = json['Departments_DepartmentCode'];
    college = json['Faculty'];
    gender = json['sex'];
    room = json['room_number'];
    hostel = json['hostel_name'];
    fatherphone = json['fatherphone'];
    motherphone = json['motherphone'];
    dob = json['day'];
    yoe = json['yearofentry'];
    address = json['homeaddress'];
    email = json['email'];



//    isVerified = json['isVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['matric'] = this.matric;
    data['id'] =this.id;
    data['middlename'] =this.username;
    data['firstname'] = this.firstname ;
    data['lastname'] =this.lastname ;
    data['programme'] =this.programme ;
    data['college'] =this.college ;
    data['sex'] =this.gender ;
    data['spill'] =this.spill ;
//    data['isVerified'] =this.isVerified ;
//    data['isDisabled'] =this. isDisabled ;

    return data;
  }

}