/* 
Standard cart page like any other e-commerce app.

And link with respective page. Add routes in main.dart
 */

import 'package:flutter/material.dart';

import 'sample_data.dart';
import '../../widgets/cart_list_item.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var _totalPrice = 0.0;
  List<Map<String, Object>> _items;

  @override
  void initState() {
    _items = sampleData.shopItems;
    _items.forEach((element) {
      _totalPrice += element['price'];
    });
    super.initState();
  }

  void _updatePrice(double price, bool isIncrement, int index) {
    setState(() {
      if (isIncrement) {
        _items[index]['quantity'] = (_items[index]['quantity'] as int) + 1;
        _totalPrice += price;
      } else {
        _items[index]['quantity'] = (_items[index]['quantity'] as int) - 1;
        _totalPrice -= price;
      }
    });
  }

  void _deleteCartItem(int index, double price, int quantity) {
    setState(() {
      _totalPrice -= (quantity * price);
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        children: <Widget>[
          Container(
            height: 50,
            margin: const EdgeInsets.only(
              top: 16,
              right: 16,
              left: 16,
            ),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    "Total ${_items.length} Item",
                    style: textStyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 30),
                  child: Text(
                    "\u20B9 $_totalPrice",
                    style: textStyle,
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemBuilder: (_, idx) => CartListItem(
              key: UniqueKey(),
              name: _items[idx]['itemName'],
              price: _items[idx]['price'] as double,
              imageURL: _items[idx]['image'],
              delete: _deleteCartItem,
              index: idx,
              quantity: _items[idx]['quantity'] as int,
              update: _updatePrice,
            ),
            itemCount: _items.length,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 60,
            ),
            child: Container(
              width: 200,
              height: 40,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                disabledColor: Colors.blue,
                color: Colors.green,
                elevation: 5.0,
                onPressed: _items.length == 0 ? null : () {},
                child: Center(
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
