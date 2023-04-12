

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_firebase/widget/text_widget.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController = TextEditingController(text: "");
  @override
  void dispose() {
    // TODO: implement dispose
    _addressTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {



  final themeState = Provider.of<DarkThemeProvider>(context);
  final Color color = themeState.getDarkTheme ? Colors.white: Colors.black;
  

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 RichText(
                  text: TextSpan(text: "Hi,  ", 
                  style: TextStyle(color: Colors.cyan, 
                  fontSize: 27 , fontWeight: FontWeight.bold), 
                  children: <TextSpan>[
                    TextSpan(
                      text: 'MyName', 
                       style: TextStyle(color: color, 
                  fontSize: 25 , fontWeight: FontWeight.w600),
                    recognizer: TapGestureRecognizer()..onTap = (){
                      print("my name is pressed");
                    }
                    ), 
                    

                  ] ),
                 
                 ),
SizedBox(height: 5,),
                 TextWidget(
                text:"Email@gmail.com" ,
                color: color, 
                textSize: 15
                ) ,

                SizedBox(height: 20,),

                Divider(thickness: 2,),

                 SizedBox(height: 20,),

                _listTiles(title: 'Address 2', 
                subtitle: 'my address', 
                icon: IconlyLight.profile, 
                onPressed: ()async{
               await _showAddressDialog();
                }, 
                color: color,
                ),

                 _listTiles(title: 'Orders', 
                
                icon: IconlyLight.bag, 
                onPressed: (){}, 
                color: color,),

                 _listTiles(title: 'Wishlist', 
              
                icon: IconlyLight.heart, 
                onPressed: (){}, 
                color: color,),

                _listTiles(title: 'Viewed', 
                icon: IconlyLight.show, 
                onPressed: (){}, 
                color: color,),

                 _listTiles(title: 'Forget Password', 
                icon: IconlyLight.unlock, 
                onPressed: (){}, 
                color: color,),

                 SwitchListTile(
            title: TextWidget(
                text: themeState.getDarkTheme? 'Dark mode' : 'Light mode',
                color: color, 
                textSize: 22
                ) , 
            secondary: Icon(themeState.getDarkTheme? Icons.dark_mode_outlined:Icons.light_mode_outlined),
            onChanged:(bool value){
             setState(() {
                themeState.setDarkTheme = value;
             });
            }, 
            value: themeState.getDarkTheme, ),
            

                 _listTiles(title: 'Logout', 
                icon: IconlyLight.logout, 
                onPressed: (){
                 _showLogoutDialog();
                    

                },
                color: color,),



               
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future <void> _showLogoutDialog()async{
    await showDialog(context: context, 
    builder: (context){
return AlertDialog(
title: Row(
  children: [
    Image.asset("assets/images/warning-sign.png", height: 20, width: 20,
    fit: BoxFit.fill,), 
   SizedBox(width: 8,),
    Text("Sign out"), 

    
  ],
),

content: Text("Do you wanna sign out ?"),
actions: [
  TextButton(onPressed: (){
    if(Navigator.canPop(context)){
Navigator.pop(context);
    }
    
  }, 
  child:TextWidget(
    text: "Cancle", 
    color: Colors.cyan,
    textSize: 18,
  ) ), 

  TextButton(onPressed: (){}, 
  child:TextWidget(
    text: "Ok", 
    color: Colors.red,
    textSize: 18,
  ) ), 
],
);
    });
    
  }

  Future <void > _showAddressDialog()async {
    await showDialog(context: context,
                   builder: ((context) {
                    return AlertDialog(

                     title: Text("Update"),
                     content: TextField(
                      // onChanged: (value) {
                      //  print(" _addressTextController.text ${ _addressTextController.text}");
                      // },
                      controller: _addressTextController,
                      // maxLength: 6, 
                      maxLines: 5,
                      decoration: InputDecoration(  
                        hintText: "Your address"
                      ),
                     ),
                     actions: [
                      TextButton(onPressed: (){},
                       child: Text("Update"))
                     ],
                    ) ;
                   }));
               
  }

  Widget _listTiles(
    {
      required String title , 
    String? subtitle, 
    required IconData icon, 
    required Function onPressed , 
    required  Color color}){
    return  ListTile(   
                 
              title:  TextWidget(
                text: title,
                color: color, 
                textSize: 22,
                // isTitle: true,
                ), 
              //  Text(
              //   title, 
              //   style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              //   ),
              subtitle: TextWidget(
                text: subtitle == null ? "" : subtitle,
                color: color, 
                textSize: 18
                ) ,
              leading: Icon(icon),
              trailing: const Icon(IconlyLight.arrowRight2),
              onTap: () {
                onPressed();
              },
            );
          
  }
}