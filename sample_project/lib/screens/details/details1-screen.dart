import 'package:flutter/material.dart';
import 'package:sample_project/constants.dart';
import 'package:sample_project/screens/details/components/app_bar.dart';
import 'package:sample_project/screens/details/components/body1.dart';

import 'components/body1.dart';

class DetailsScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: detailsAppBar(context),
      body: BodyNew(),
    );
  }
}
