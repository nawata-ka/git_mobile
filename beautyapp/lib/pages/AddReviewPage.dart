import 'package:flutter/material.dart';
import 'package:beautyapp/pages/states/AddReviewPageState.dart';

class AddReviewPage extends StatefulWidget {
  //const AddReviewPage({Key? key}) : super(key: key);

  final String user_id;
  final String user_name;
  final String product_id;

  static const routeName = '/AddReviewPage';

  const AddReviewPage({
      super.key,
      required this.user_id,
      required this.user_name,
      required this.product_id,
    });
  @override
  State<AddReviewPage> createState() => AddReviewPageState();

}

