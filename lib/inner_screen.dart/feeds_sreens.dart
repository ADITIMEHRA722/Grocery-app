import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_firebase/services/utils.dart';
import 'package:grocery_firebase/widget/feed_iteams.dart';
import 'package:grocery_firebase/widget/text_widget.dart';

class FeedsScreen extends StatefulWidget {

    static const routeName = "/FeedsScreen";
  const FeedsScreen({super.key});


  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {

final TextEditingController ? _searchTextController = TextEditingController();
final FocusNode _searchTextFocusNode =FocusNode();
@override
  void dispose() {
    // TODO: implement dispose
    _searchTextController!.dispose();
    _searchTextFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

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
        centerTitle: true,
        title: TextWidget(
          text: "All Products ", 
          color: color, 
          textSize: 24, 
          isTitle: true,),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: kBottomNavigationBarHeight,
                child: TextField(
                  focusNode: _searchTextFocusNode,
              controller: _searchTextController ,
              onChanged: (value){
                setState(() {
                  
                });
               
              },
              
               decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(  
                  borderRadius: BorderRadius.circular(12), 
                  borderSide: BorderSide(color: Colors.greenAccent, width: 1), 
              
                  
                ), 
              
                enabledBorder: OutlineInputBorder(
                  
                  borderRadius: BorderRadius.circular(12), 
                  borderSide: BorderSide(color: Colors.greenAccent, width: 1), 
              
                 ), 
              
                 hintText: "what's in your mind", 
                 prefixIcon: Icon(Icons.search), 
                 suffix: IconButton(
                  onPressed: () {
                   _searchTextController!.clear();
                   _searchTextFocusNode.unfocus();
                 },
                 icon: Icon(Icons.close, 
                 color: _searchTextFocusNode.hasFocus ? Colors.red: color,),)
               ), 
                ),
              ),
            ),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
         crossAxisCount: 2, 
         padding: EdgeInsets.zero,
         crossAxisSpacing: 10, 
         mainAxisSpacing: 10,
         childAspectRatio: size.width/ (size.height*0.66), 
         children: List.generate(20, (index){
          return  FeedsWidget();
         }),
         ),
          ],
        ),
      ),
      
     
    );
  }
}