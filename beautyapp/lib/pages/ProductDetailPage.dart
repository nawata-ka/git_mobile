import 'package:flutter/material.dart';
import 'package:beautyapp/pages/states/ProductDetailPageState.dart';


class ProductDetailPage extends StatefulWidget {

  //final String product_id;

  const ProductDetailPage({Key? key}) : super(key: key);
  
  static const routeName = '/ProductDetailPage';

  // const ProductDetailPage({
  //   super.key,
  //   required this.product_id,
  // });

  @override
  State<ProductDetailPage> createState() => ProductDetailPageState();
}