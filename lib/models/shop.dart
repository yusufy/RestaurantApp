import 'package:flutter/material.dart';
import 'food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
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

  //customer cart
  final Map<Food, int> _cartItems = {};

  //getter methods
  List<Food> get foodMenu => _foodMenu;
  Map<Food, int> get cartItems => _cartItems;

  // Toplam ürün sayısı
  int get cartCount =>
      _cartItems.values.fold(0, (sum, quantity) => sum + quantity);

  //add to cart
  void addToCart(Food food, int quantity) {
    if (cartItems.containsKey(food)) {
      cartItems[food] = cartItems[food]! + quantity;
    } else {
      cartItems[food] = quantity;
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Food food) {
    if (_cartItems.containsKey(food)) {
      if (_cartItems[food]! > 1) {
        _cartItems[food] = _cartItems[food]! - 1;
      } else {
        _cartItems.remove(food);
      }
    }
    notifyListeners();
  }

  // Sepetten ürünü tamamen silme
  void removeItemCompletely(Food food) {
    _cartItems.remove(food);
    notifyListeners();
  }
}
