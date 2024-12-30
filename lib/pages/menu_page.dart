import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/components/button.dart';
import 'package:restaurant_app/models/food.dart';
import 'package:restaurant_app/theme/colors.dart';
import 'package:restaurant_app/pages/food_details_page.dart'; // Add this import
import 'package:provider/provider.dart'; // Add this import

import '../components/food_tile.dart';
import '../models/shop.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //food menu
  List foodMenu = [
    //kebab
    Food(
        name: "Kebab",
        price: "6.5",
        imagePath: "lib/images/kebab.png",
        rating: "4.9",
        description:
            "Doner kebab for food lovers. Our doner kebabs prepared with carefully marinated meats, fresh ingredients and unique spices are here to delight your taste buds. Order now, don't miss this unique flavor!"),
    //soup
    Food(
        name: "Soup",
        price: "4.5",
        imagePath: "lib/images/soup.png",
        rating: "4.6",
        description:
            "A delicious start that will warm you up! Our soups are prepared with traditional recipes, fresh ingredients and cooked with love. Warm happiness in every spoonful! Try it now and enjoy health and flavor!"),
    //fries
    Food(
        name: "Fries",
        price: "2",
        imagePath: "lib/images/fries.png",
        rating: "4.3",
        description:
            "Crispy and golden yellow flavor! Prepared with carefully selected potatoes, our delicious French fries offer pleasure in every bite.Whether alone or with sauces; you will love this flavor!Try it now, catch the crispy happiness!"),
    //salad
    Food(
        name: "Salad",
        price: "3.5",
        imagePath: "lib/images/salad.png",
        rating: "4.3",
        description:
            "Freshness and health together!Our salads, prepared with carefully selected vegetables, offer freshness in every bite.Ideal for those looking for a light, delicious and nutritious option. Try it now and discover the fresh taste of nature!"),
    //cola
    Food(
        name: "Cola",
        price: "1.5",
        imagePath: "lib/images/cola.png",
        rating: "4.3",
        description:
            "Coolness and energy together! Ice-cold cola multiplies your pleasure by offering freshness with every sip.Whether with food or on its own, you won't be able to say no to this flavor!Try it now and enjoy the moment!"),
  ];

  // navigate to food details page
  void navigateToFoodDetails(int index) {
    //get the shop and it's menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get the shop and it's menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        centerTitle: true,
        title: Text(
          "Kebabci",
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.grey[900],
            fontSize: 30,
          ),
        ),
        actions: [
          //cart icon
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              color: secondaryColor,
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // promo banner
          const SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Get 17% Promo",
                      style: GoogleFonts.dmSerifDisplay(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 25),

                    //redeem button
                    MyButton(
                      text: "Redeem Code",
                      onTap: () {},
                    ),
                  ],
                ),

                //image
                Image.asset(
                  "lib/images/promo.png",
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search here...',
                hintStyle: GoogleFonts.dmSerifDisplay(color: secondaryColor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          // menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text('Food Menu',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 20,
                  color: secondaryColor,
                )),
          ),

          const SizedBox(height: 25),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () => navigateToFoodDetails(index),
              ),
            ),
          ),

          const SizedBox(height: 40),

          // popular food
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                //image
                Image.asset(
                  'lib/images/kebab.png',
                  height: 60,
                ),
                const SizedBox(
                  width: 20,
                ),
                //name and price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //name
                    Text(
                      'Kebab',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                      ),
                    ),

                    const SizedBox(height: 10),

                    //price
                    Text(
                      '6.5€',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),

                //heart icon
                Padding(
                  padding: const EdgeInsets.only(left: 135),
                  child: Icon(Icons.favorite_outline,
                      color: secondaryColor, size: 30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
