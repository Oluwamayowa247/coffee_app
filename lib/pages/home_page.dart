import 'package:coffee_app/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/util/coffee_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//list of coffee types;
  final List coffeeType = [
    ['Cappucino', true],
    ['Latte', false],
    ['Black', false],
    ['Tea', false]
  ];

//user taps;
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }

      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          elevation: 0,
          leading: Icon(Icons.menu),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(Icons.person),
            )
          ],
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
        ]),
        body: Column(
          children: [
            // Text Widget
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'FIND THE BEST COFFEE FOR YOU...',
                style: TextStyle(
                  fontFamily: 'BebasNeue',
                  fontSize: 32,
                ),
                maxLines: 2,
              ),
            ),
            SizedBox(
              height: 25,
            ),

            //Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Find Your Coffee...',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600))),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            //horizontal view of coffee types
            Container(
                height: 20,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: coffeeType.length,
                    itemBuilder: (context, index) {
                      return CoffeeType(
                          coffeeType: coffeeType[index][0],
                          isSelected: coffeeType[index][1],
                          onTap: () {
                            coffeeTypeSelected(index);
                          });
                    })),

            SizedBox(
              height: 29,
            ),
            //Horizontal List View
            Expanded(
                child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                    coffeeImagePath: 'lib/images/img6.jpg',
                    coffeeName: 'Black Tea',
                    coffeePrice: '5.60',
                    coffeWith: 'With Mustard Seed'),
                CoffeeTile(
                    coffeeImagePath: 'lib/images/img5.jpg',
                    coffeeName: 'Latte',
                    coffeePrice: '8.50',
                    coffeWith: 'With Skimmed Milk'),
                CoffeeTile(
                    coffeeImagePath: 'lib/images/img3.jpg',
                    coffeeName: 'Tea',
                    coffeePrice: '9.50',
                    coffeWith: 'With Natural Milk '),
                CoffeeTile(
                    coffeeImagePath: 'lib/images/img2.jpg',
                    coffeeName: 'Morning Rush',
                    coffeePrice: '10.50',
                    coffeWith: 'With Natural Honey')
              ],
            )),
          ],
        ));
  }
}
