import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_firebase/services/utils.dart';
import 'package:grocery_firebase/widget/heart_btn.dart';
import 'package:grocery_firebase/widget/price_widget.dart';
import 'package:grocery_firebase/widget/text_widget.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({super.key});

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    
    final Color  color= Utils(context).color;
    final theme = Utils(context).getTheme;
   Size size = Utils(context).getScreenSize;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material( 
        color: Theme.of(context).cardColor.withOpacity(0.9), 
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
           onTap: (){}, 
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // FancyShimmerImage(imageUrl:'https://cdn11.bigcommerce.com/s-podjif72xf/images/stencil/350x350/products/10375/5881/990047__94557.1591323806.jpg?c=2', 
                    // height: size.width*0.22,
                    // width: size.width*0.22,
                    // boxFit: BoxFit.fill,),

                     Image(image:AssetImage("assets/images/cat/veg.png"),
                      height: size.width*0.21,
                      width: size.width*0.2,
                      fit: BoxFit.fill,),
                     
                    Column(
                      children: [
                        TextWidget(
                          text: "1Kg" , 
                          color:color , 
                          textSize: 22, 
                          isTitle:true ,), 

                          SizedBox(height: 6,), 
                          Row(
                            children: [
  //                             GestureDetector(
  //                               onTap: (){
  //  print("print bag button is pressed");
  //                               },
  //                               child: Icon(IconlyLight.bag2, 
  //                               size: 22, 
  //                               color: color,),
  //                             ), 

  HeartBtn(),

                                GestureDetector(
                                onTap: (){
                          print("print heart button is pressed");
                                },
                                child: Icon(IconlyLight.heart, 
                                size: 22, 
                                color: color,),
                              ), 

                            ],
                          ), 
                         
                         
                      ],
                    ), 
                  ],
                ), 
                 PriceWidget(
                  isOnSale: true, 
                            price: 5.9,
                            salePrice: 2.99,
                            textPrice:'1',
                 ),

                 SizedBox(height: 5,), 
                 TextWidget(text: "Product title", 
                 color: color, 
                 textSize: 16, 
                 isTitle: true,
                 ), 

                  SizedBox(height: 5,), 

              ],
             ),
           ),
        ), 
      ),
    );
  }
}