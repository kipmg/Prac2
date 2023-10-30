import 'package:flutter/material.dart';
class CoffeTitle extends StatelessWidget { final String coffeeImagePath; final String coffeName;
final String coffePrice;
const CoffeTitle(
    {required this.coffeeImagePath,
      required this.coffeName,
      required this.coffePrice,
      super. key});
@override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
    child: Container(
      padding: const EdgeInsets.all(12.0), width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black54,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 200,
              height: 150,
              child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(
                      coffeeImagePath)),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(
                vertical: 12.0, horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start,
              children: [
                Text(
                  coffeName,
                  style: const TextStyle(
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text('C добавлением молока',
                  style: TextStyle(
                      color: Colors
                          .grey[700]),
                ), // Text
              ],
            ), // Column
          ), // Padding
//price
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween,
                children: [
                  Text('$coffePrice P'),
                  Container(
                    padding: const EdgeInsets
                        .all(4),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius
                          .circular(6),
                    ), // BoxDecoration
                    child: const Icon(
                        Icons.add),
                  ) // Container
                ]), // Row
          ),
        ],
      ),
    ), // Column
  );
}
}