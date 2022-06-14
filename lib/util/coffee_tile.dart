import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String coffeeImagePath;
  final String coffeeName;
  final String coffeWith;
  final String coffeePrice;

  const CoffeeTile(
      {required this.coffeeImagePath,
      required this.coffeeName,
      required this.coffeePrice,
      required this.coffeWith});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25),
      child: Container(
        padding: EdgeInsets.all(12),
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.black54),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Coffee Image
            ClipRect(
              child: Image.asset(coffeeImagePath),
            ),
            //Coffee Name
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffeeName,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 4),
                  Text(
                    coffeWith,
                    style: TextStyle(color: Colors.grey[500]),
                  )
                ],
              ),
            ),
            //Pricing
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$' + coffeePrice),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.orange[700],
                        borderRadius: BorderRadius.circular(4)),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
