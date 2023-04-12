import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_firebase/services/utils.dart';
import 'package:grocery_firebase/widget/on_sale_widget.dart';
import 'package:grocery_firebase/widget/text_widget.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/OnSaleScreen";
  const OnSaleScreen({super.key});

  

  @override
  Widget build(BuildContext context) {

    bool _isEmpty = false;

     final Color  color= Utils(context).color;
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
  Size size = utils.getScreenSize;

  
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context); 
            
          },
          child: Icon(IconlyLight.arrowLeft2, 
          color: color,
          size: 24,),
        ),
        elevation: 0,
        title: TextWidget(
          text: "Product on sale", 
          color: color, 
          textSize: 24, 
          isTitle: true,),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
     
      body: _isEmpty ? Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset("assets/images/box.png"),
            ),
            Text("No product on sale yet!, \nStay tuned",
            textAlign: TextAlign.center, 
            style: TextStyle(
              color: color, 
              fontSize: 30, 
              fontWeight: FontWeight.w700
            ),),
          ],
        ),
      ),):GridView.count(
        // shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
       crossAxisCount: 2, 
       padding: EdgeInsets.zero,
      //  crossAxisSpacing: 10, 
      //  mainAxisSpacing: 10,
       childAspectRatio: size.width/ (size.height*0.45), 
       children: List.generate(16, (index){
        return  OnSaleWidget();
       }),
       ),
    );
  }
}