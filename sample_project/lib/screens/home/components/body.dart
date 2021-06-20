import 'package:flutter/material.dart';
import 'package:sample_project/components/search_box.dart';
import 'package:sample_project/screens/home/components/category_list.dart';
import 'package:sample_project/screens/home/components/discount_card.dart';
import 'package:sample_project/screens/home/components/item_list.dart';

class Body1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SearchBox(
            onChanged: (value) {},
          ),

          ItemList(),
          DiscountCard(),
        ],
      ),
    );
  }
}
