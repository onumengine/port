import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progress_dialog/progress_dialog.dart';
import '../bloc/sign_in/bloc.dart';
import '../bloc/sign_in/event.dart';
import '../bloc/sign_in/state.dart';
import 'home_page.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  SignInBloc _signInBloc;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool _autoValidate = false;
  bool _obscureText = true;
  bool isloading = false;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    _signInBloc = BlocProvider.of<SignInBloc>(context);
    //_emailController.text = "BUI/ACAD/282";
   // _passwordController.text = "Ezekiel79";
    super.initState();
  }

  double GetPaddingFromScreenSize(double screenSize) {
    if (screenSize < 800)
      return 70;
    else if (screenSize > 800 && screenSize < 1000)
      return 50;
    else if (screenSize > 1000) return 3;
  }

  bool GetScreenSizeBool(double screenSize) {
    if (screenSize < 500)
      return true;
    else
      return false;
  }

  void showloader(loading) {
    setState(() {
      isloading = loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Scaffold(
          backgroundColor: Colors.grey[100],
          resizeToAvoidBottomPadding: false,
          body: BlocListener<SignInBloc, SignInState>(
            listener: (context, state) {
              if (state is SignInPostingState) {
                showloader(true);
              } else if (state is SignInPostingError) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(state.error,
                      style: TextStyle(color: Colors.black87)),
                  backgroundColor: Colors.white,
                ));
                showloader(false);
              } else if (state is SignInPostedSuccess) {
                showloader(false);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ),
                );
              } else {
                showloader(false);
              }
            },
            child: Container(
              color: Color(0xFF222B45),
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width /
                            GetPaddingFromScreenSize(screenSize.width)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            "Welcome, Please enter your details to proceed.",
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ),
                        Container(
                          height: 350,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF222B45).withOpacity(0.5),
                                    blurRadius: 5,
                                    spreadRadius: 10)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(left: 8.0, top: 8.0),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey[300])),
                                    labelText: 'username',
                                    labelStyle: TextStyle(
                                        color: Color(0xffA1A1A1), fontSize: 13),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: SvgPicture.asset(
                                        'drawable/user.svg',
                                        height: 10.0,
                                        width: 10.0,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(left: 8.0, top: 8.0),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey[300])),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                        color: Color(0xffA1A1A1), fontSize: 13),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(13),
                                      child: SvgPicture.asset(
                                        'drawable/padlock.svg',
                                        height: 10.0,
                                        width: 10.0,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 5.0, 0.0, 10.0),
                                  child: InkResponse(
                                    onTap: () {
                                      _signInBloc.add(SigningInEvent(
                                          email: _emailController.text,
                                          password: _passwordController.text));
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF222B45),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      2.0, 0.0, 2.0, 0.0),
                                              child: isloading == false
                                                  ? Text(
                                                      'Sign In',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14),
                                                    )
                                                  : CircularProgressIndicator(
                                                      valueColor:
                                                          new AlwaysStoppedAnimation<
                                                                  Color>(
                                                              Colors.white),
                                                      strokeWidth: 3,
                                                    ))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              "Forgot Password?  Click here",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
