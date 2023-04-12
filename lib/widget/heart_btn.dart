import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:grocery_firebase/services/utils.dart';

class HeartBtn extends StatelessWidget {
  const HeartBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final Color  color= Utils(context).color;
      final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    return  GestureDetector(
                                onTap: (){
   print("print bag button is pressed");
                                },
                                child: Icon(IconlyLight.heart, 
                                size: 22, 
                                color: color,),
                              );
  }
}