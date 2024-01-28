import 'package:flutter/material.dart';
import 'package:provider_cart_example/product_model.dart';

class CartProvider extends ChangeNotifier {
  List<ProductModel> _cartList = [];
  List<ProductModel> get getCartList => _cartList;

  void addItem(ProductModel item) {
    _cartList.insert(0, item);
    notifyListeners();
  }

  void removeItem(int position) {
    _cartList.removeAt(position);
    notifyListeners();
  }

  void increament(int position) {
    _cartList[position].quantity += 1;
    notifyListeners();
  }

  void decreament(int position) {

    if(_cartList[position].quantity <= 0) {
      removeItem(position);
    }
    _cartList[position].quantity -= 1;
    notifyListeners();
  }

  int getQuantity(int position) {
    int quantity = 1;
    for(var product in _cartList) {
      if(id == product.id) {
        isCart = true;
      }
    }
    return isCart;
    return _cartList[position].quantity;
  }

  double totalAmount() {
    double total = 0.0;
    for(var product in _cartList) {
      total = total + (product.quantity * product.price);
    }
    return total;
  }

  bool isCart(String id) {
    bool isCart = false;
    for(var product in _cartList) {
      if(id == product.id) {
        isCart = true;
      }
    }
    return isCart;
  }
}