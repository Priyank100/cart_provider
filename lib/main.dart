import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_cart_example/cart_screen.dart';
import 'package:provider_cart_example/home_screen.dart';

import 'cart_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(debugLabel:"navigator");

  @override
  Widget build(BuildContext context) {
    return MultiProvider (
        providers: [
          ChangeNotifierProvider(create: (context) => CartProvider()),
        ],
        child: MaterialApp(
          navigatorKey: navigatorKey,
          theme: ThemeData(primarySwatch: Colors.blue),
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
          routes: <String, WidgetBuilder>{
            "/HomeScreen"  : (BuildContext context) => HomeScreen(),
            "/CartScreen"  : (BuildContext context) => CartScreen(),
          },
        )
    );
  }
}
