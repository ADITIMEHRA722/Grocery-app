import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_firebase/services/utils.dart';
import 'package:grocery_firebase/widget/text_widget.dart';

class PriceWidget extends StatelessWidget {

  const PriceWidget({
    super.key, 
    required this.salePrice, 
    required this.price, 
    required this.textPrice, 
    required this.isOnSale});

  final  double salePrice , price; 
  final String textPrice; 
  final bool isOnSale; 

  @override
  Widget build(BuildContext context) {
     final Color  color= Utils(context).color;
    double userPrice = isOnSale? salePrice: price;

    return FittedBox(
      child: Row(
        children: [
          TextWidget(
            text: '\$${(userPrice * int.parse(textPrice)).toStringAsFixed(2)}', 
          color: Colors.green,
           textSize: 18), 

           SizedBox(width: 5,), 
          Visibility(
            visible: isOnSale? true:false,
            child: Text('\$${(price *int.parse(textPrice)).toStringAsFixed(2)}', 
            style: TextStyle(
              fontSize: 15, 
              color: color, 
              decoration: TextDecoration.lineThrough
              
            ),),
          )
        ],
      ),
    );
  }
}