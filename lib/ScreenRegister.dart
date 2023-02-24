// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _passwordVisible = true;
    bool _passwordVisible1 = true;

  @override
  void initState() {
    _passwordVisible = false;
        _passwordVisible1 = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ClipPath(
              clipper: BottomWaveClipper(),
              child: Container(
                color: Colors.deepPurple,
                height: 300,
                width: double.infinity,
                // width: MediaQuery.of(context).size.width,
                // ignore: prefer_const_constructors
                child: Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold,fontSize: 22),
                  ),
                ),
              ),
            ),

        
        const    SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'your name',
                  label: Text('fullNmae'),
                  prefixIcon: Icon(Icons.text_decrease),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'exmaple@yahoo.com',
                  label: Text('Email'),
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: '123222....5',
                  label: Text('password'),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: GestureDetector(
                    onLongPress: () {
                      setState(() {
                        _passwordVisible = true;
                      });
                    },
                    onLongPressUp: () {
                      setState(() {
                        _passwordVisible = false;
                      });
                    },
                    child: Icon(_passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: !_passwordVisible1,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: '****************',
                  label: Text('confirmPassword'),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: GestureDetector(
                    onLongPress: () {
                      setState(() {
                        _passwordVisible1 = !_passwordVisible1;
                      });
                    },
                    onLongPressUp: () {
                      setState(() {
                        _passwordVisible1 = !_passwordVisible1;
                      });
                    },
                    child: Icon(!_passwordVisible1
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: '0100000000000',
                  label: Text('phone'),
                  prefixIcon: Icon(Icons.call),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => print('hello'),
                child: Container(
                  //width: 100.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () =>print(MediaQuery.of(context).size.width),
                child: Container(
                  //width: 100.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.deepPurple, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                    child: Text(
                      'login',
                      style: TextStyle(fontSize: 18.0, color: Colors.blue),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  
  @override
  Path getClip(Size size) {
        
    Path path0 = Path();
    path0.moveTo(0,0);
    path0.lineTo(0,size.height*0.7408333);
    path0.quadraticBezierTo(size.width*0.2350000,size.height*0.7983333,size.width*0.3616667,size.height*0.8800000);
    path0.cubicTo(size.width*0.5927778,size.height*1.0085333,size.width*0.7112444,size.height*0.5531333,size.width,size.height*0.7858333);
    path0.quadraticBezierTo(size.width*1.0027778,size.height*0.6039667,size.width,0);
    path0.lineTo(0,0);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}