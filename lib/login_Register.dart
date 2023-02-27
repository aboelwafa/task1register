// ignore_for_file: unused_local_variable

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:googleflutter/ScreenRegister.dart';
import 'package:googleflutter/constants/colors.dart';
import 'package:googleflutter/notes_screen.dart';
import 'package:googleflutter/widgets/TextFormField.dart';
import 'package:googleflutter/widgets/myButton.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  bool ispassword = true;
  bool isEmail(String value) => EmailValidator.validate(value);

  @override
  void initState() {
    ispassword = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizehight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          children: [
            ClipPath(
              clipper: CustomClipperWave(),
              child: Container(
                height: 300,
                color: MyColors.deepPurple,
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: MyColors.mywhite,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
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
                validate: (value) 
                {
                  if(value!.isEmpty)
                  {
                    return 'the field must not be empty';
                  }
                 else if (!isEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                }),
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
                  }
                  else if(value.length<5)
                  {
                    return 'the password is short';
                  }
                },
                suffixIcon:
                    ispassword ? Icons.visibility_off : Icons.visibility),
            
            Spacer(flex: 1),
            outlinebutton(
              buttonPress: () {
                
                if (formkey.currentState!.validate()) {
                   ScaffoldMessenger.of(context).showSnackBar(
                      
                     const SnackBar(
                      duration: Duration(seconds: 3),
                        backgroundColor: MyColors.green,
                      content: Text(
                        textAlign: TextAlign.center,
                        "Logged in successfully",style: TextStyle(color: MyColors.mywhite,fontSize: 20,fontWeight: FontWeight.bold),),
                    ));
                 Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => NoteScreen(),
        ),
        (route) => false,
        //if you want to disable back feature set to false
);
                }
              },
              text: 'Login',
              background: MyColors.deepPurple,
              borderColor: MyColors.mywhite,
              textColor: MyColors.mywhite,
              height: sizehight / 13,
              width: sizeWidth / 1.5,
              widthborder: 1.3,
            ),
            outlinebutton(
              buttonPress: () {

                Navigator.push(context, MaterialPageRoute(builder:((context) 
                  => 
                   RegisterScreen())));
              },
              text: 'Register',
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
    );
  }
}


class CustomClipperWave extends CustomClipper<Path> {
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
