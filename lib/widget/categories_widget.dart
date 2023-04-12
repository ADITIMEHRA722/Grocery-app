import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_firebase/provider/dark_theme_provider.dart';
import 'package:grocery_firebase/widget/text_widget.dart';
import 'package:provider/provider.dart';


class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key, 
   required this.catText, 
   required this.imgPath, 
   required this.passedColor});

   final String catText, imgPath ; 
   final Color passedColor; 

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
     final Color color  = themeState.getDarkTheme? Colors.white: Colors.black;

    double _screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        print("category pressed");
      },
      child: Container(
        // height: _screenWidth * 0.6,
        decoration: BoxDecoration(
          color: passedColor.withOpacity(0.1), 
          borderRadius: BorderRadius.circular(16), 
          border: Border.all(
            color: passedColor.withOpacity(0.7), 
            width: 2
          )
    
        ),
        child: Column(
          children: [
            Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgPath, ), 
                  fit: BoxFit.fill )
              ),
            ), 
            TextWidget(
              text: catText, 
              color: color,
               textSize: 20, 
               isTitle:true )
          ],
        ),
      ),
    );
  }
}





// class CategoriesWidget extends StatefulWidget {
//   const CategoriesWidget({super.key,
//    required this.catText, 
//    required this.imgPath, 
//    required this.color});

//   final String catText, imgPath ; 
//   final Color color; 



//   @override
//   State<CategoriesWidget> createState() => _CategoriesWidgetState();
// }

// class _CategoriesWidgetState extends State<CategoriesWidget> {
//   @override
//   Widget build(BuildContext context) {
//      final themeState = Provider.of<DarkThemeProvider>(context);
//      final Color color  = themeState.getDarkTheme? Colors.white: Colors.black;
//    // Size size = MediaQuery.of(context).size;
//     double _screenWidth = MediaQuery.of(context).size.width;
//     return InkWell(
//       onTap: (){
//         print("category pressed");
//       },
//       child: Container(
//         // height: _screenWidth * 0.6,
//         decoration: BoxDecoration(
//           color: Colors.red.withOpacity(0.1), 
//           borderRadius: BorderRadius.circular(16), 
//           border: Border.all(
//             color: Colors.red.withOpacity(0.7), 
//             width: 2
//           )
    
//         ),
//         child: Column(
//           children: [
//             Container(
//               height: _screenWidth * 0.3,
//               width: _screenWidth * 0.3,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(imgPath, ), 
//                   fit: BoxFit.fill )
//               ),
//             ), 
//             TextWidget(
//               text: catText, 
//               color: color,
//                textSize: 20, 
//                isTitle:true )
//           ],
//         ),
//       ),
//     );
//   }
// }


