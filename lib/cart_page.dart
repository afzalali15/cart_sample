import 'package:cart_sample/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_data.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Demo'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ChangeNotifierProvider(
              create: (context) => products[index],
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(child: Text(products[index].name)),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              products[index].decrementCount();
                            },
                            icon: Icon(Icons.remove_circle),
                          ),
                          Consumer<Product>(
                            builder: (context, value, child) => Text(
                              products[index].count.toString(),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              products[index].incrementCount();
                            },
                            icon: Icon(Icons.add_circle),
                          ),
                        ],
                      ),
                      Consumer<Product>(
                        builder: (context, value, child) => Text(
                          products[index].totalPrice.toString(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
