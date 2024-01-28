import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_cart_example/product_model.dart';
import 'cart_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> productList = [];

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Cart Example"),
        actions: [
          Consumer<CartProvider>(builder: (context, cartProvider, _) {
            return InkWell(
              child: Container(
                margin: EdgeInsets.all(15),
                child: Badge(
                  child: Icon(Icons.shopping_cart, size: 30,),
                  badgeContent: Text(cartProvider.getCartList.length.toString()),
                  badgeColor: Colors.white,
                  position: BadgePosition.topEnd(),
                ),
              ),
              onTap: (){
                Navigator.pushNamed(context, '/CartScreen');
              },
            );
          }),
        ],
      ),
      body: productListing(),
    );
  }

  Widget productListing() {
    return ListView.builder(
        itemCount: productList.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return listSection(index);
        });
  }

  Widget listSection(int index) {
    return Consumer<CartProvider>(builder: (context, cartProvider, _) {
      return Card(
          elevation: 5,
          margin: EdgeInsets.all(8),
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Image.network(productList[index].image),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(productList[index].title, overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Weight : ${productList[index].weight}'),
                          Text('Price : ₹ ${productList[index].price.toString()}', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_outline, color: Colors.red)
                          ),
                          cartProvider.isCart(productList[index].id) ?
                          Container(
                            child: Row(
                              children: [
                                InkWell(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      border: Border.all(color: Colors.blue),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)
                                      ),
                                    ),
                                    child: Icon(Icons.remove, color: Colors.white),
                                  ),
                                  onTap: (){},
                                ),
                                Container(
                                  height: 35,
                                  width: 35,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)
                                    ),
                                  ),
                                  child: Text('Remove', style: TextStyle(color: Colors.blue)),
                                ),
                                InkWell(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      border: Border.all(color: Colors.blue),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)
                                      ),
                                    ),
                                    child: Icon(Icons.add, color: Colors.white),
                                  ),
                                  onTap: (){

                                  },
                                )
                              ],
                            ),
                          ) :
                          InkWell(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5.0)
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.shopping_cart, color: Colors.white),
                                  SizedBox(width: 5),
                                  Text('Add to cart', style: TextStyle(color: Colors.white))
                                ],
                              ),
                            ),
                            onTap: (){
                              print('>>>>>>>>>');
                              print(productList[index].quantity);
                              productList[index].isCart = true;
                              cartProvider.addItem(productList[index]);
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
      );
    });
  }

  void getProductList() {
    ProductModel m1 = ProductModel(id: 'p1', title:'Cremica Jeera Lite Biscuit', image: 'https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=85,metadata=none,w=500,h=500/app/images/products/sliding_image/484750a.jpg?ts=1688628435', weight:'500 g', quantity:1, price:72.0, isFavourite:false, isCart:false);
    ProductModel m2 = ProductModel(id: 'p2', title:'Britannia Tiger Krunch Chocochips Biscuit', image: 'https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=85,metadata=none,w=500,h=500/app/images/products/sliding_image/415898a.jpg?ts=1688975163', weight:'400 g', quantity:1, price:72.0, isFavourite:false, isCart:false);
    ProductModel m3 = ProductModel(id: 'p3', title:'Cadbury Oreo Vanilla Cream Biscuits', image: 'https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=85,metadata=none,w=500,h=500/app/images/products/sliding_image/382396a.jpg?ts=1694694815', weight:'288.75 g', quantity:1, price:85.0, isFavourite:false, isCart:false);
    ProductModel m4 = ProductModel(id: 'p4', title:'Parle-G Gold Glucose Biscuit', image: 'https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=85,metadata=none,w=500,h=500/app/images/products/sliding_image/387474a.jpg?ts=1686557456', weight:'1 Kg', quantity:1, price:125.0, isFavourite:false, isCart:false);
    ProductModel m5 = ProductModel(id: 'p5', title:'Sunfeast Dark Fantasy Yumfills Choco Pie', image: 'https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=85,metadata=none,w=500,h=500/app/images/products/sliding_image/409925a.jpg?ts=1695038359', weight:'242 g', quantity:1, price:146.0, isFavourite:false, isCart:false);
    productList.add(m1);
    productList.add(m2);
    productList.add(m3);
    productList.add(m4);
    productList.add(m5);
  }
}
