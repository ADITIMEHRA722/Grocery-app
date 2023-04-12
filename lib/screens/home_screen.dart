import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_firebase/inner_screen.dart/feeds_sreens.dart';
import 'package:grocery_firebase/inner_screen.dart/on_sale_screen.dart';
import 'package:grocery_firebase/provider/dark_theme_provider.dart';
import 'package:grocery_firebase/services/global_method.dart';
import 'package:grocery_firebase/services/utils.dart';
import 'package:grocery_firebase/widget/feed_iteams.dart';
import 'package:grocery_firebase/widget/on_sale_widget.dart';
import 'package:grocery_firebase/widget/text_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   
  final List<String> _offerImages = [ 
    'assets/images/offres/Offer1.jpg',
     'assets/images/offres/Offer2.jpg',
      'assets/images/offres/Offer3.jpg',
       'assets/images/offres/Offer4.jpg',
    
  ]; 
  @override
  Widget build(BuildContext context) {
    final Color  color= Utils(context).color;
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
// GlobalMethods globalMethods = GlobalMethods();


    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
             height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
              _offerImages[index],
                   
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: _offerImages.length,
                pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter, 
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white,activeColor: Colors.red
                  )
                ), 
                control: SwiperControl(color: Colors.black),
             ),
            ),
      
            TextButton(onPressed: (){
              //Navigator.pushNamed(context, OnSaleScreen.routeName);
            GlobalMethods.navigateTo(context:context, 
            routeName: OnSaleScreen.routeName );
            
            }, 
            child: TextWidget(color: Colors.blue, 
            maxLines: 1, 
            textSize: 20, 
            text: "View all",)),
      SizedBox(height: 6,), 
      
            Row(
              children: [
              RotatedBox(
                quarterTurns: -1,
                child: Row(
                  children: [
                    TextWidget(
                      text: "On sale".toUpperCase(), 
                      color: Colors.red, 
                      textSize: 22, 
                      isTitle: true,
                      ), 
                      SizedBox(width: 5,),
                      Icon(IconlyLight.discount, 
                      color: Colors.red,)
                  ],
                ),
              ),
              SizedBox(width: 8,),
                Flexible(
                  child: SizedBox(
                    height: size.height*0.24,
                    child: ListView.builder(
                      itemCount: 10, 
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return OnSaleWidget();
                      }),
                    ),
                  ),
                ),
              ],
            ),
      SizedBox(height: 10,), 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              TextWidget(
                text: "Our Products", 
                color: color, 
                textSize:20 ),
               TextButton(onPressed: (){
                 GlobalMethods.navigateTo(context:context, 
            routeName: FeedsScreen.routeName );
            
               }, 
              child: TextWidget(color: Colors.blue, 
              maxLines: 1, 
              textSize: 20, 
              text: "Browse all",)),
            ],),
          ),  
      SizedBox(height: 6,),  
      
      GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
       crossAxisCount: 2, 
       padding: EdgeInsets.zero,
       crossAxisSpacing: 10, 
       mainAxisSpacing: 10,
       childAspectRatio: size.width/ (size.height*0.66), 
       children: List.generate(4, (index){
        return  FeedsWidget();
       }),
       )
           
            
          ],
        ),
      ) ,
       
    );
  }
}


// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Center(
//         // child: SwitchListTile(
//         // title: Text("theme"), 
//         // secondary: Icon(themeState.getDarkTheme? Icons.dark_mode_outlined:Icons.light_mode_outlined),
//         // onChanged:(bool value){
//         //  setState(() {
//         //     themeState.setDarkTheme = value;
//         //  });
//         // }, 
//         // value: themeState.getDarkTheme, ),'

//          child: Swiper(
//     itemBuilder: (BuildContext context, int index) {
//       return Image.asset(
//   _offerImages,
       
//         fit: BoxFit.fill,
//       );
//     },
//     itemCount: 10,
//     pagination: SwiperPagination(), 
//     control: SwiperControl(),
//  )
//         ) ,
       
//     );
//   }
// }
