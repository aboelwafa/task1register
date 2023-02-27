// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googleflutter/constants/colors.dart';

Widget myTextFormField({
  required TextEditingController nameController,
  required TextInputType inputType,
  bool? obscureText=false,
   required String? Function(String?)? validate,
  double borderRadius=10,
  String?hintText,
  String?labelname,
  IconData?prefixIcon,
  IconData?suffixIcon,
  bool?filled=false,
  Color?fillColor,
  Color?labelStyle,
  void Function()? Iconpressed,
})=>Padding(
  
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              
              controller: nameController,
              cursorColor: MyColors.deepPurple,
              style:  TextStyle(
                  color: MyColors.deepPurple,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              keyboardType: inputType,
              obscureText: obscureText!,
              validator: validate,
              decoration: InputDecoration(
                border:  OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                ),
                hintText: hintText,
                label:  Text(labelname!),
                prefixIcon:  Icon(prefixIcon!),
                suffixIcon: IconButton(
                    onPressed: Iconpressed, icon:  Icon(suffixIcon)),
                    errorStyle: const TextStyle(
                    color: MyColors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                    ),
                filled: filled,
                fillColor: fillColor,
                labelStyle:  TextStyle(
                  color: labelStyle,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );