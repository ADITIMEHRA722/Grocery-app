import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_firebase/provider/dark_theme_provider.dart';

import 'package:grocery_firebase/screens/cart/cart_screen.dart';
import 'package:grocery_firebase/screens/categories.dart';
import 'package:grocery_firebase/screens/home_screen.dart';
import 'package:grocery_firebase/screens/user.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 2;

  final List <Map<String,dynamic>> _pages = [
   {
      'page': const HomeScreen(),
      'title': 'Home Screen',
    },
    {
      'page': CategoriesScreen(),
      'title': 'Categories Screen',
    },
    {
      'page': const CartScreen(),
      'title': 'Cart Screen',
    },
    {
      'page': const UserScreen(),
      'title': 'user Screen',
    },
    
    // const HomeScreen(),
    // const CategoriesScreen(),
    // const CartScreen(),
    // const UserScreen()
  ];

  void _SelectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    
    return Scaffold(

    // appBar: AppBar(  
    //   title: Text( _pages[_selectedIndex]['title']),
    // ),



      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
          onTap: _SelectedPage,
          unselectedItemColor: _isDark ? Colors. grey[300]: Colors.black12,
          selectedItemColor: _isDark ? Colors.lightBlue.shade200  : Colors.black87,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
             backgroundColor: themeState.getDarkTheme? Theme.of(context).cardColor: Colors.white,

                 icon:Icon(_selectedIndex==0 ? IconlyBold.home : IconlyLight.home),
                  label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(_selectedIndex==1 ? IconlyBold.category :IconlyLight.category), label: "Category"),

                 BottomNavigationBarItem(
                icon: Icon(_selectedIndex==2 ? IconlyBold.buy :IconlyLight.buy), label: "Cart"),

                 BottomNavigationBarItem(
                icon: Icon(_selectedIndex==3 ? IconlyBold.user2 :IconlyLight.user2), label: "User"),

               
          ]),
    );
  }
}
