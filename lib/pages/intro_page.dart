import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          const SizedBox(height: 25),
          // shop name
          Text("Kebabci", style: GoogleFonts.dmSerifDisplay(
            fontSize: 40,
          ),),

          const SizedBox(height: 25,),
          // icon
          Padding(
            padding: const EdgeInsets.all(50),
            child: Image.asset('lib/images/shop.png'),
          ),

          const SizedBox(height: 25,),
          
          // title
          Text("THE TASTE OF TURKISH KEBAB", style: GoogleFonts.dmSerifDisplay(
            fontSize: 44,
          ),),

          const SizedBox(height: 20,),
          
          // subtitle
          Text("Enjoy the best kebab in town", style: GoogleFonts.dmSerifDisplay(
            fontSize: 20, color: const Color.fromARGB(255, 56, 55, 55)
          ),),
        
          const SizedBox(height: 25,),
        
          //get started button
          MyButton(text: "Get Started",
            onTap: () {
              // go to menu page
              Navigator.pushNamed(context, '/menupage');
            },
          ),
        ],),
      ),
    );
  }
}