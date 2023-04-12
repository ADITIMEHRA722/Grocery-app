import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_firebase/services/utils.dart';
import 'package:grocery_firebase/widget/categories_widget.dart';
import 'package:grocery_firebase/widget/text_widget.dart';

class CategoriesScreen extends StatelessWidget {
   CategoriesScreen({super.key});

   List<Color> gridColor = [
    Colors.red, 
    Colors.blue, 
    Colors.orange, 
    Colors.pink, 
    Colors.purple, 
    Colors.green
   ];

  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath' :'assets/images/cat/fruits.png', 
      'catText' : 'Fruits'
    },

     {
      'imgPath' :'assets/images/cat/veg.png', 
      'catText' : 'Veg'
    },

     {
      'imgPath' :'assets/images/cat/Spinach.png', 
      'catText' : 'Spinach'
    },

     {
      'imgPath' :'assets/images/cat/spices.png', 
      'catText' : 'Spices'
    },

     {
      'imgPath' :'assets/images/cat/grains.png', 
      'catText' : 'Grains'
    },
     {
      'imgPath' :'assets/images/cat/nuts.png', 
      'catText' : 'Nuts'
    }
  ];

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context); 
    Color color = utils.color; 
    //final Color color = themeState.getDrkThem ? Colors.white : Colors.black;
    return Scaffold(
      appBar: AppBar(  
        elevation: 0,
backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: "Categories", 
          color: color, 
          textSize: 24, 
          isTitle: true,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(crossAxisCount: 2, childAspectRatio: 240/250,
        crossAxisSpacing: 10, 
        mainAxisSpacing: 10, 
        children: List.generate(6, (index) {
          return CategoriesWidget(
            catText: catInfo[index]['catText'], 
            imgPath: catInfo[index]['imgPath'], 
            passedColor:gridColor[index],

          );
        }),),
      ),
    );
}
}