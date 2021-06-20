import 'package:flutter/material.dart';
import 'package:sample_project/constants.dart';
import 'package:sample_project/screens/details/components/item_image.dart';
import 'package:sample_project/screens/details/components/order_button3.dart';
import 'package:sample_project/screens/details/components/title_price_rating.dart';

class Body2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        ItemImage(
          imgSrc: "images/biriyani.jpg",
        ),
        Expanded(
          child: ItemInfo(),
        ),
      ],
    );
  }
}

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: <Widget>[
          shopeName(name: "Nila's Kitchen"),
          TitlePriceRating(
            name: "Chicken Biriyani",
            numOfReviews: 159,
            rating: 4,
            price: 9,
            onRatingChanged: (value) {},
          ),
          Text(
            "The most trending food of Nila's kitchen is the famous fragrant chicken biriyani. With the best chefs right from Hyderabad, the biriyanis here are true heaven. "
                "The Average cost for two is 350. ",
            style: TextStyle(
              height: 1.5,
            ),
          ),
          SizedBox(height: size.height * 0.1),
          // Free space  10% of total height
          OrderButton3(
            size: size,
            press: () {},
          )
        ],
      ),
    );
  }

  Row shopeName({String name}) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: ksecondaryColor,
        ),
        SizedBox(width: 15),
        Text(name),
      ],
    );
  }
}
