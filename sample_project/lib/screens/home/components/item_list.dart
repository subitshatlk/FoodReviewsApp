import 'package:flutter/material.dart';
import 'package:sample_project/screens/details/details-screen.dart';
import 'package:sample_project/screens/details/details1-screen.dart';
import 'package:sample_project/screens/details/details2-screen.dart';
import 'package:sample_project/screens/details/details3-screen.dart';
import 'package:sample_project/screens/home/components/item_card.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ItemCard(
            svgSrc: "assets/icons/burger_beer.svg",
            title: "Fast Food",
            shopName: "McDonald's",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailsScreen();
                  },
                ),
              );
            },
          ),
          ItemCard(
            svgSrc: "assets/icons/chinese_noodles.svg",
            title: "Chinese Cuisine",
            shopName: "Wang's Kitchen",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailsScreen1();
                  },
                ),
              );
            },
          ),
          ItemCard(
            svgSrc: "assets/icons/burger_beer.svg",
            title: "South Indian Cuisine",
            shopName: "Nila's Kitchen",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailsScreen2();
                  },
                ),
              );
            },
          ),
          ItemCard(
            svgSrc: "assets/icons/pizza.svg",
            title: "Italian Cuisine",
            shopName: "Domino's Pizza",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailsScreen3();
                  },
                ),
              );
            },
          )

        ],
      ),
    );
  }
}
