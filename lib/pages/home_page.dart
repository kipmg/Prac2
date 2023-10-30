import 'package:flutter/material.dart';
import 'package:animecafe/util/coffee_title.dart';
import 'package:animecafe/util/coffe_type.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
//list of coffee types
  final List coffeeType = [
    ['Капучино', false],
    ['Латте', true],
    ['Американо', false],
    ['Чай', false],
  ];

// user tapped on coffe type

  void coffeTypeselected(int index) {
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
      backgroundColor: Colors.grey[900], appBar: AppBar(elevation: 0,
      backgroundColor: Colors.transparent,
      leading: const Icon(Icons.menu),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 25.0),
          child: Icon(Icons.person, color: Colors.orange,),
        )
      ],
    ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.orange,), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
      ]),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0), child: Text(
          "Лучший кофе каждое утро!",
          style: TextStyle(fontSize: 18),
        ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search, color: Colors.orange,),
              hintText: 'Найти для себя..',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ), // OutlineInputBorder
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ), // OutlineInputBorder
            ), // InputDecoration
          ), // TextField
        ), // Padding
        const SizedBox(
          height: 10,
        ), // SizedBox
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: coffeeType.length,
            itemBuilder: (context, index) {
              return CoffeeType(
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap: () {
                    coffeTypeselected(index);
                  }
              );
            }, // CoffeeType
          ),
        ), // ListView.builder
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CoffeTitle(
                coffeeImagePath: 'assets/images/cup_cof.jpg',
                coffeName: 'Latte',
                coffePrice: '299',
              ), // CoffeTitle
              CoffeTitle(
                coffeName: 'Americano',
                coffePrice: '99',
                coffeeImagePath: 'assets/images/f_cof.jpg',
              ),
              CoffeTitle(
                coffeName: 'Cappuchino',
                coffePrice: '199',
                coffeeImagePath: 'assets/images/f_cof.jpg',

              ), // CoffeTitle
            ],
          ), // ListView
        ) // Expanded
      ]), // Column
    );
  }
}