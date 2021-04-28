import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:port/bloc/sign_up/bloc.dart';
import 'package:port/bloc/sign_up/event.dart';
import 'package:port/bloc/sign_up/state.dart';
import 'package:port/utility/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../utility/colors.dart';

class CreateStudentScreen extends StatefulWidget {
  @override
  _CreateStudentScreenState createState() => _CreateStudentScreenState();
}

class _CreateStudentScreenState extends State<CreateStudentScreen> {
  CreateStudentBloc _createStudentBloc;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _matricController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _hostelController = TextEditingController();
  final _roomController = TextEditingController();
  final _deptCodeController = TextEditingController();
  final _collegeCodeController = TextEditingController();
  final _yearOfEntryController = TextEditingController();
  final _dobController = TextEditingController();
  final _sexController = TextEditingController();
  final _fatherPhoneController = TextEditingController();
  final _motherPhoneController = TextEditingController();
  final _addressController = TextEditingController();

  bool _autoValidate = false;
  bool _obscureText = true;
  PageController pageController = PageController(initialPage: 0);
  int pageNumber = 0;
  bool isloading = false;
  void showloader(loading) {
    setState(() {
      isloading = loading;
    });
  }

  List<Widget> buildDotIndicator() {
    List<Widget> list = [];
    for (int i = 0; i <= 2; i++) {
      list.add(i == pageNumber
          ? indicator(isActive: true)
          : indicator(isActive: false));
    }
    return list;
  }

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    _createStudentBloc = BlocProvider.of<CreateStudentBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(size.width, 1000),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          elevation: 0,
          title: Text(
            "Create Student Profile",
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          backgroundColor: Colors.white,
        ),
        body: BlocListener<CreateStudentBloc, CreateStudentState>(
          listener: (context, state) {
            if (state is PostingState) {
              showloader(true);
            } else if (state is PostingError) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
              showloader(false);
            } else if (state is PostedSuccess) {
              showloader(false);
              Navigator.pop(context, true);
            } else {
              showloader(false);
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 50,
                horizontal: size.width / GetPaddingFromScreenSize(size.width)),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    spreadRadius: 10)
              ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    child: PageView(
                      onPageChanged: (index) => setState(() {
                        pageNumber = index;
                      }),
                      controller: pageController,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              left: 16,
                              bottom: 70,
                              right: 16,
                              top: size.height * 0.1),
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(bottom: 60),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text("Personal information",
                                    style: boldTextStyle(
                                        size: 17, letterSpacing: 0.2)),
                                SizedBox(height: 24),
                                textField(
                                    title: 'First name',
                                    image: Icons.event_note,
                                    controller: _firstNameController),
                                SizedBox(height: 24),
                                textField(
                                    title: 'Middle name',
                                    image: Icons.event_note,
                                    controller: _middleNameController),
                                SizedBox(height: 16),
                                textField(
                                    title: 'Last name',
                                    image: Icons.event_note,
                                    controller: _lastNameController),
                                SizedBox(height: 16),
                                textField(
                                    title: 'Email address',
                                    image: Icons.person_outline,
                                    controller: _emailController),
                                SizedBox(height: 16),
                                textField(
                                    title: 'Sex (Male / Female)',
                                    textInputType: TextInputType.datetime,
                                    image: Icons.calendar_today,
                                    controller: _sexController),
                                SizedBox(height: 16),
                                textField(
                                    title: 'Date of birth (2000-01-02)',
                                    textInputType: TextInputType.datetime,
                                    image: Icons.calendar_today,
                                    controller: _dobController),
                                SizedBox(height: 16),
                                textField(
                                    title: 'Phone number',
                                    image: Icons.phone_iphone,
                                    controller: _phoneController),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 16,
                              bottom: 70,
                              right: 16,
                              top: size.height * 0.1),
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(bottom: 60),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text("School Information",
                                    style: boldTextStyle(
                                        size: 17, letterSpacing: 0.2)),
                                SizedBox(height: 24),
                                textField(
                                    title: 'Matric number',
                                    image: Icons.business,
                                    controller: _matricController),
                                SizedBox(height: 16),
                                textField(
                                    title: 'College code',
                                    image: Icons.contact_mail,
                                    controller: _collegeCodeController),
                                SizedBox(height: 16),
                                textField(
                                    title: 'Programme code',
                                    image: Icons.location_on,
                                    controller: _deptCodeController),
                                SizedBox(height: 16),
                                textField(
                                    title: 'Year of Entry',
                                    image: Icons.calendar_today,
                                    controller: _yearOfEntryController),
                                SizedBox(height: 16),
                                textField(
                                    title: 'Hostel',
                                    image: Icons.home,
                                    controller: _hostelController),
                                SizedBox(height: 16),
                                textField(
                                    title: 'Room',
                                    image: Icons.home,
                                    controller: _roomController)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 16,
                              bottom: 70,
                              right: 16,
                              top: size.height * 0.1),
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(bottom: 60),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text("Other Information",
                                    style: boldTextStyle(
                                        size: 17, letterSpacing: 0.2)),
                                SizedBox(height: 24),
                                textField(
                                    title: 'Home address',
                                    image: Icons.home,
                                    controller: _addressController),
                                SizedBox(height: 16),
                                textField(
                                    title: 'Father Phone',
                                    image: Icons.home,
                                    controller: _fatherPhoneController),
                                SizedBox(height: 16),
                                textField(
                                    title: 'Mother Phone',
                                    image: Icons.business,
                                    controller: _motherPhoneController),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                    padding: EdgeInsets.only(left: 20),
                    width: size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        color: opPrimaryColor,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 15,
                          child: Text('${pageNumber + 1}',
                              style: primaryTextStyle(
                                  size: 16, textColor: opPrimaryColor)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: buildDotIndicator(),
                        ),
                        pageNumber != 2
                            ? FlatButton(
                                onPressed: () {
                                  pageController.nextPage(
                                      duration: Duration(milliseconds: 250),
                                      curve: Curves.fastOutSlowIn);
                                },
                                child: Text('Next',
                                    style: primaryTextStyle(
                                        size: 16,
                                        textColor: opBackgroundColor)),
                              )
                            : FlatButton(
                                onPressed: () {
                                  // Navigator.pop(context);
                                  Student student = Student.init();
                                  student.matric = _matricController.text;
                                  student.firstname = _firstNameController.text;
                                  student.middle = _middleNameController.text;
                                  student.lastname = _lastNameController.text;
                                  student.email = _emailController.text;
                                  student.phone = _phoneController.text;
                                  student.dob = _lastNameController.text;
                                  student.gender = _sexController.text;
                                  student.college = _collegeCodeController.text;
                                  student.programme = _deptCodeController.text;
                                  student.fatherphone =
                                      _fatherPhoneController.text;
                                  student.motherphone =
                                      _motherPhoneController.text;
                                  student.hostel = _hostelController.text;
                                  student.yoe = _yearOfEntryController.text;
                                  student.address = _addressController.text;
                                  student.room = _roomController.text;

                                  _createStudentBloc
                                      .add(PostEvent(student: student));
                                },
                                child: isloading == false
                                    ? Text('Submit',
                                        style: primaryTextStyle(
                                            size: 16,
                                            textColor: opBackgroundColor))
                                    : SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              new AlwaysStoppedAnimation<Color>(
                                                  Colors.white),
                                          strokeWidth: 3,
                                        ),
                                      )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
