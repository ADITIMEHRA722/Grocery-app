import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_firebase/services/utils.dart';
import 'package:grocery_firebase/widget/heart_btn.dart';
import 'package:grocery_firebase/widget/price_widget.dart';
import 'package:grocery_firebase/widget/text_widget.dart';

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({super.key});

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  final  _qualityTextController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    _qualityTextController.text = '1'; 
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _qualityTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Color  color= Utils(context).color;
      final Utils utils = Utils(context);
    final themeState = utils.getTheme;
       Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: (() {
            
          }),
          child: Column(
            children: [
            //  FancyShimmerImage(imageUrl:'https://unsplash.com/photos/nAOZCYcLND8',
            //           height: size.width*0.21,
            //           width: size.width*0.2,
            //           boxFit: BoxFit.fill,),

                     Image(image:AssetImage("assets/images/cat/fruits.png"),
                      height: size.width*0.21,
                      width: size.width*0.2,
                      fit: BoxFit.fill,),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,   ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              text: 'Title', 
                              color: color, 
                              textSize: 20 , 
                              isTitle: true,), 
                               
                              HeartBtn(),
                          ],
                        ),

                        

                      ), 

                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Flexible(
                            flex: 4,
                            child: PriceWidget( 
                              isOnSale: true, 
                              price: 5.9,
                              salePrice: 2.99,
                              textPrice: _qualityTextController.text,
                            ),
                          ), 
                          SizedBox(width: 5,),
                          Flexible(
                            child: Row(
                              children: [

                                Flexible(
                                  flex: 1,
                                  child: FittedBox(child: TextWidget(text: 'KG', color: color, textSize: 10, isTitle: true,))), 
                               
                                SizedBox(width: 5,), 


                                Flexible(
                                  flex: 2,
                                  child: TextFormField(
                                  controller: _qualityTextController,
                                  key: ValueKey('10'), 
                                  style: TextStyle(
                                    color: color, fontSize: 18, 

                                  ),
                                  maxLines: 1, 
                                  enabled: true,
                                  onChanged: (Value){
                                    setState(() {
                                      
                                    });
                                  },
                                  keyboardType: TextInputType.number, 
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp('[0-9]'), 
                                    )
                                  ],
                                ))
                              ],
                            ),
                          )

                         ],),
                       ), 
Spacer(),
                       SizedBox(
                        width: double.infinity,
                         child: TextButton(
                          onPressed: (){},
                          child: TextWidget(
                            text: "Add to cart", 
                            color: color, 
                            textSize: 20,   
                            ), 
                            style: ButtonStyle(  
                              backgroundColor: MaterialStateProperty.all(Theme.of(context).cardColor, 
                              ), 
                       
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap , 
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22), 
                                  bottomRight: Radius.circular(22),)
                                )
                              )
                            ),
                            ),
                       )
            ],
          ),
        ),
      ),
    );
  }
}