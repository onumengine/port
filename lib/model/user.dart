
class User {
  bool error;
  String matric;
  String id,username,firstname,lastname,api;
  String programme,college,gender,isVerified;
  String isDisabled,profilePhoto;
 int spill;


  // this is a class function
  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matric = json['matric'];
    username = json['middlename'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    programme = json['programme'];
    college = json['college'];
    gender = json['sex'];
    spill = json['spill'];
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