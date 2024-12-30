import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/components/button.dart';
import 'package:restaurant_app/theme/colors.dart';

import '../models/food.dart';
import '../models/shop.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;

  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {

  //quantity
  int quantityCount = 0;

  //decrement quantity
  void decrementQuantity() {
    setState(() {
      quantityCount--;
    },);
  }

  //increment quantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    },);
  }

  //add to cart
  void addToCart() {
    // only add to cart if quantity is more than 0
    if (quantityCount > 0) {
      // get access to shop
      final shop = context.read<Shop>();

      // add to cart
      shop.addToCart(widget.food, quantityCount);

      // let the user know that the item has been added to the cart
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: secondaryColor,
          content: Text('Successfully added to cart',
          style: TextStyle(fontSize: 18,
          color: Colors.white),
          textAlign: TextAlign.center,
          ),
          actions: [
            // okay button
            IconButton(onPressed: (){
              //pop once to close the dialog
              Navigator.pop(context);
              //pop again to close the page
              Navigator.pop(context);
            }, icon: Icon(Icons.check, color: Colors.white,),)  
          ],
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        //listview of food details
        Expanded(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView(children: [
            //food image
            Image.asset(widget.food.imagePath, height: 200,),
          
            const SizedBox(height: 25,),
          
            // rating
            Row(children: [
              //star icon
              Icon(Icons.star, color: Colors.yellow[800], size: 20,),
              
              const SizedBox(width: 5,),
              //rating
              Text(
                widget.food.rating, 
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 18, 
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 112, 42, 42)),),
            ],),

            const SizedBox(height: 10,),
            // food name
            Text(
              widget.food.name,
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 25,),
            // description
            Text('Description', 
            style: GoogleFonts.dmSerifDisplay(
              color: Colors.grey[900],
              fontWeight: FontWeight.bold,
              fontSize: 18),),

            const SizedBox(height: 20,),
            // description text
            Text(widget.food.description,
              style: GoogleFonts.dmSerifDisplay(
              color: Colors.grey[700],
              fontSize: 16,
              height: 2.5,
            ),
              ),
            ]),
          ),
        ),
        //price + quantity + add to cart button
        Container(
          color: primaryColor,
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              //price + quantity
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                //price
                Text("\€${widget.food.price}",
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //quantity
                Row(children: [
                  //minus button
                  Container(
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.remove),
                    color: Colors.white,
                    onPressed: () {
                    if (quantityCount > 0) {
                      decrementQuantity();
                    }
                    },
                  ),
                  ),
                  //quantity count
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      width: 30,
                      child: Center(
                        child: Text(
                          '$quantityCount',
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //plus button
                  Container(
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add, size: 25), // smaller size
                      color: Colors.white,
                      onPressed: incrementQuantity,
                    ),
                  ),
                ],),
              ],),

              const SizedBox(height: 25,),
              //add to cart button
              MyButton(text: "Add to Cart", onTap: addToCart),
            ],
          ),
        )
      ]),
    );
  }
}