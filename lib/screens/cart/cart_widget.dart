import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_firebase/services/utils.dart';
import 'package:grocery_firebase/widget/heart_btn.dart';
import 'package:grocery_firebase/widget/text_widget.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final _quantityTextController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _quantityTextController.text = '1' ;
    super.initState();
  }

@override
  void dispose() {
    // TODO: implement dispose
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color  color= Utils(context).color;
    final theme = Utils(context).getTheme;
   Size size = Utils(context).getScreenSize;

    return GestureDetector(
      onTap: (() {
        
      }),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(  
                  color: Theme.of(context).cardColor.withOpacity(0.3), 
                  borderRadius: BorderRadius.circular(12)
                ),
                child: //  FancyShimmerImage(imageUrl:'https://unsplash.com/photos/nAOZCYcLND8',
              //           height: size.width*0.21,
              //           width: size.width*0.2,
              //           boxFit: BoxFit.fill,),

                       Row(
                         children: [
                           Container(
                            height: size.width*0.25,
                              width: size.width*0.25,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0)
                              ),
                             child: Image(image:AssetImage("assets/images/cat/fruits.png"),
                              height: size.width*0.21,
                              width: size.width*0.2,
                              fit: BoxFit.fill,),
                           ),

                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Title",
                                 color: color,
                                  textSize: 20, 
                                  isTitle: true, ), 

                                  SizedBox(height: 16,), 
                                  SizedBox(
                                    width: size.width*0.3,
                                    child: Row(
                                      children: [
                                        
                                        _QuantityController(color: Colors.red, 
                                        icon: CupertinoIcons.minus, 
                                        fct:(){
                                           
                                        }
                                        ), 

                                 Flexible(
                                  flex: 1,
                                   child: TextField(
                                    controller: _quantityTextController,
                                    keyboardType: TextInputType.number, 
                                    maxLines: 1, 
                                    decoration: InputDecoration(   
                                      focusedBorder: UnderlineInputBorder(  
                                        borderSide: BorderSide()
                                      )
                                    ),
                                     inputFormatters: [
                                      FilteringTextInputFormatter.allow(RegExp('[0-9]'), 
                                      )
                                    ],

                                    onChanged: (value){
                                      setState(() {
                                       if(value.isEmpty){
                                         _quantityTextController.text='1';
                                       }else{
                                        return;
                                       }
                                      });
                                    },
                                 
                                   ),
                                 ),
 
                                         _QuantityController(color: Colors.green, 
                                        icon: CupertinoIcons.plus, 
                                        fct:(){
                                           
                                        }
                                        )
                                  
                                         
                                      ],
                                    ),
                                  ), 

                                 

                            ],
                           ), 

                           Spacer(), 

                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 5),
                             child: Column(
                              children: [

                                InkWell(
                                  onTap: () {}, 
                                  child: Icon(CupertinoIcons.cart_badge_minus, 
                                  color: Colors.red, 
                                  size: 20,),
                                ),
                                SizedBox(height: 5,), 
                                HeartBtn(),
                                SizedBox(height: 5,), 
                                TextWidget(text: "\$0.26",
                                 color: color, 
                                 textSize: 18, 
                                 maxLines: 1,)

                                
                              ],
                             ),
                           ), 
                           SizedBox(width: 5,)
                         ],
                       ),
              ),
            ),
            
          )
        ],
      ),
    );
  }


  Widget _QuantityController({
    required Function fct, 
    required IconData icon , 
    required Color color
  }){
    return Flexible(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                          child: Material(
                                            color:color,
                                            borderRadius: BorderRadius.circular(12),  
                                            child: InkWell(
                                               borderRadius: BorderRadius.circular(12), 
                                              onTap: (() {
                                                fct();
                                              }),
                                              child: Padding(
                                                padding: const EdgeInsets.all(6.0),
                                                child: Icon(icon,
                                                 color: Colors.white,
                                                 size: 20,),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
  }
}