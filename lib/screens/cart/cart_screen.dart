import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_firebase/screens/cart/cart_widget.dart';
import 'package:grocery_firebase/services/utils.dart';
import 'package:grocery_firebase/widget/text_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color  color= Utils(context).color;
    final theme = Utils(context).getTheme;
   Size size = Utils(context).getScreenSize;
   
    return Scaffold(
      appBar: AppBar(   
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(onPressed: () {},
           icon: Icon(IconlyLight.delete, 
           color: color,
           ))
        ],
        elevation: 0, 
        leading: Icon(IconlyLight.arrowLeft2, 
        color: color,),
        title: TextWidget(
          text: "Cart (2)", 
          color: color, 
          textSize: 22, 
          isTitle: true,
          ),
      ),
      body: Column(
        children: [
         
         _ckeckout(context: context),
          
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder:(ctx, index){
          return CartWidget();
              } ),
          ),
        ],
      ),
    );
  }


  Widget _ckeckout ({required BuildContext context, }){
     final Color  color= Utils(context).color;
    final theme = Utils(context).getTheme;
   Size size = Utils(context).getScreenSize;
    return   SizedBox(
            width: double.infinity,  
            height: size.height*0.1,
          //  color: ,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
             children: [
              Material(
                color: Colors.green,  
                borderRadius: BorderRadius.circular(10), 
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),  
                  onTap: () {}, 
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextWidget(
                      text: "Order Now", 
                      textSize: 20, 
                      color: Colors.white,
                    ),
                  ),
                ),
              ), 
Spacer(),
              FittedBox(
                child: TextWidget(
                  text: "Total: \$0.30", 
                  color: color, 
                  textSize: 18, 
                  isTitle: true,),
              )
             ], 
            ),
          ),
          );
          
  }
}