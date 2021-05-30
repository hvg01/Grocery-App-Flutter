import 'package:flutter/material.dart';
import 'package:groceries_app/home.dart';

class Quantity extends StatefulWidget {
  const Quantity({Key key}) : super(key: key);

  @override
  _QuantityState createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  int quantity=1;

  void _incrementCounter() {
    setState(() {
      quantity++;
      HomePageData.quantity=quantity;
    });
  }
  void _decrementCounter() {
    setState(() {
      quantity--;
      HomePageData.quantity=quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: 100,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[300]))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.shopping_bag_outlined),
              SizedBox(
                width: 20,
              ),
              Text(
                "Quantity\nper day",
              ),
            ],
          ),
          Container(
            height: 35,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Color(int.parse("0xFF50c0bb")))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.remove,
                      size: 20,
                      color: quantity==1?Colors.grey[200]: Color(int.parse("0xFF50c0bb")),
                    ),
                    onPressed: (){
                      if (quantity>1)
                          _decrementCounter();
                    }
                ),
                Text("$quantity"),
                IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 20,
                      color: Color(int.parse("0xFF50c0bb")),
                    ),
                    onPressed: ()=> _incrementCounter()
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
