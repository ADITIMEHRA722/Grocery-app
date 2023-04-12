import 'package:flutter/material.dart';
import 'package:grocery_firebase/inner_screen.dart/on_sale_screen.dart';

class GlobalMethods{
  static navigateTo({ required BuildContext context , required String routeName}){
     Navigator.pushNamed(context, routeName);
  }
}