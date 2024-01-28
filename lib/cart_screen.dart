import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_cart_example/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Consumer<CartProvider>(builder: (context, cartProvider, _) {
        return cartProvider.getCartList.isEmpty ? Center(child: Text('Empty Cart')) :
            Column(
              children: [
                ListView.builder(
            itemCount: cartProvider.getCartList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  print('>>>>>>>>>>>>');
                  print(cartProvider.getCartList[index].quantity);
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
                              child: Image.network(cartProvider.getCartList[index].image),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(cartProvider.getCartList[index].title, overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Weight : ${cartProvider.getCartList[index].weight}'),
                                      Text('Price : ₹ ${(cartProvider.getCartList[index].quantity * cartProvider.getCartList[index].price)}', style: TextStyle(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.favorite_outline, color: Colors.red)
                                      ),
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
                                              onTap: (){
                                                cartProvider.decreament(index);
                                              },
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
                                              child: Text(cartProvider.getCartList[index].quantity.toString(), style: TextStyle(color: Colors.blue)),
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
                                                cartProvider.increament(index);
                                              },
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                  );
                }),
                Divider(thickness: 2),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                      Text('₹ ${cartProvider.totalAmount().toString()}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),
                )
              ],
            );
      })
    );
  }
}
