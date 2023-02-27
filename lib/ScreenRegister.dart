// ignore_for_file: camel_case_types, prefer_const_constructors, duplicate_ignore

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:googleflutter/constants/colors.dart';
import 'package:googleflutter/login_Register.dart';
import 'package:googleflutter/widgets/TextFormField.dart';
import 'package:googleflutter/widgets/myButton.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  var fullnameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool ispassword = true;
  bool isConfirmPassword = true;
  bool isEmail(String value) => EmailValidator.validate(value);

  @override
  void initState() {
    ispassword = true;
    isConfirmPassword = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizehight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ClipPath(
                clipper: BottomWaveClipper(),
                child: Container(
                  color: Colors.deepPurple,
                  height: 300,
                  width: double.infinity,
                  child: Center(
                    child: const Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          letterSpacing: 2),
                    ),
                  ),
                ),
              ),
              //  full name
              myTextFormField(
                  nameController: fullnameController,
                  inputType: TextInputType.name,
                  filled: true,
                  fillColor: MyColors.grayOpesity,
                  labelname: 'FullName',
                  borderRadius: 20,
                  hintText: 'enter your name',
                  prefixIcon: Icons.text_fields,
                  labelStyle: MyColors.deepPurple,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'the field must not be empty';
                    } else if (value.length < 3) {
                      return 'short name';
                    }
                    return null;
                  }),

              //  email
              myTextFormField(
                  nameController: emailController,
                  inputType: TextInputType.emailAddress,
                  filled: true,
                  fillColor: MyColors.grayOpesity,
                  labelname: 'Email',
                  borderRadius: 20,
                  hintText: 'enter your email',
                  prefixIcon: Icons.email,
                  labelStyle: MyColors.deepPurple,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'the field must not be empty';
                    } else if (!isEmail(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  }),
              //  phone
              myTextFormField(
                  nameController: phoneController,
                  inputType: TextInputType.phone,
                  filled: true,
                  fillColor: MyColors.grayOpesity,
                  labelname: 'phone',
                  borderRadius: 20,
                  hintText: '+2011415151',
                  prefixIcon: Icons.call,
                  labelStyle: MyColors.deepPurple,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'the field must not be empty';
                    } else if (value.length < 11) {
                      return 'the field must contain 11 number';
                    }
                    return null;
                  }),
              // password

              myTextFormField(
                  nameController: passwordController,
                  inputType: TextInputType.visiblePassword,
                  borderRadius: 20,
                  filled: true,
                  fillColor: MyColors.grayOpesity,
                  hintText: 'enter your password',
                  labelname: 'Password',
                  labelStyle: MyColors.deepPurple,
                  prefixIcon: Icons.lock,
                  obscureText: ispassword,
                  Iconpressed: () {
                    ispassword = !ispassword;
                    setState(() {});
                  },
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'the field must not be empty';
                    } else if (value.length < 6) {
                      return 'password is short';
                    }
                  },
                  suffixIcon:
                      ispassword ? Icons.visibility_off : Icons.visibility),
              // confirmPassword
              myTextFormField(
                  nameController: confirmPasswordController,
                  inputType: TextInputType.visiblePassword,
                  borderRadius: 20,
                  filled: true,
                  fillColor: MyColors.grayOpesity,
                  hintText: 'enter your Confirmpassword',
                  labelname: 'Password',
                  labelStyle: MyColors.deepPurple,
                  prefixIcon: Icons.lock,
                  obscureText: isConfirmPassword,
                  Iconpressed: () {
                    isConfirmPassword = !isConfirmPassword;
                    setState(() {});
                  },
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'the field must not be empty';
                    } else if (value.length < 6) {
                      return 'password is short';
                    }
                  },
                  suffixIcon: isConfirmPassword
                      ? Icons.visibility_off
                      : Icons.visibility),
              outlinebutton(
                buttonPress: () {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      
                      SnackBar(
                        backgroundColor: MyColors.green,
                      content: Text(
                        textAlign: TextAlign.center,
                        "User account created successfully",style: TextStyle(color: MyColors.mywhite,fontSize: 20,fontWeight: FontWeight.bold),),
                    ));
                    fullnameController.clear();
                    passwordController.clear();
                    emailController.clear();
                    confirmPasswordController.clear();
                    phoneController.clear();
                     Navigator.push(context, MaterialPageRoute(builder:((context) 
                  => 
                   LoginScreen())));
                  }
                },
                text: 'Register',
                background: MyColors.deepPurple,
                borderColor: MyColors.mywhite,
                textColor: MyColors.mywhite,
                height: sizehight / 13,
                width: sizeWidth / 1.5,
                widthborder: 1.3,
              ),
              outlinebutton(
                buttonPress: () {
                  Navigator.pop(context);
                },
                text: 'Login',
                background: MyColors.mywhite,
                borderColor: MyColors.deepPurple,
                height: sizehight / 13,
                width: sizeWidth / 1.5,
                textColor: MyColors.deepPurple,
                widthborder: 1.3,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 1.25);
    path.cubicTo(
      size.width / 2 * 0.6,
      size.height * 0.5,
      size.width * 2 / 2,
      size.height * 1.2,
      size.width * 1.2,
      size.height / 1.5,
    );
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
