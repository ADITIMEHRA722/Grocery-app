import 'package:flutter/material.dart';
import 'package:grocery_firebase/consts/theme_data.dart';
import 'package:grocery_firebase/inner_screen.dart/feeds_sreens.dart';
import 'package:grocery_firebase/inner_screen.dart/on_sale_screen.dart';
import 'package:grocery_firebase/provider/dark_theme_provider.dart';
import 'package:grocery_firebase/screens/btm_bar.dart';
import 'package:grocery_firebase/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

 void getCurrentAppTheme() async {
 themeChangeProvider.setDarkTheme = await themeChangeProvider.darkThemePrefs.getTheme();
 }

 @override
  void initState() {
    // TODO: implement initState
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_){
          return themeChangeProvider;
        })
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {
          
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home:BottomBarScreen(),
            routes: {
              OnSaleScreen.routeName: (context)=> const OnSaleScreen(),
              FeedsScreen.routeName:(context)=> const FeedsScreen(),
             },
          );
        }
      ),
    );

  }
}
