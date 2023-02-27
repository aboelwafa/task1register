import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googleflutter/constants/colors.dart';

Widget myButton({
  required void Function()? buttonPress,
  double? width=double.infinity,
  double? height = 40,
  Color? background,
  double borderRadius = 50,
  required String text,
  Color? textColor = MyColors.mywhite,
  double fontSize = 25,
  FontWeight fontWeight = FontWeight.bold,
}) =>
    InkWell(
      onTap: buttonPress,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: height,
          width: width,
          
          decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(borderRadius)),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: fontSize, fontWeight: fontWeight),
          )),
        ),
      ),
    );

    Widget outlinebutton({
        required void Function()? buttonPress,
  required String text,
   double width=double.infinity,
  double height = 40,
  Color?borderColor,
    Color?textColor,
    double  fontSize= 22,
   FontWeight  fontWeight= FontWeight.w500,
   double widthborder=1.5,
   Color?background,


    })=>    
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                width: width,
                height: height,
                child: OutlinedButton(
                 
                  style: OutlinedButton.styleFrom(
                     backgroundColor: background,
                    side: BorderSide(
                      color: borderColor!, width: widthborder)
                  ),
                  onPressed:buttonPress, child: Text(text,style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                    fontWeight: fontWeight
                  ),)),
            ),
              );
