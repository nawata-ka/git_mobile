import 'package:flutter/material.dart';
import 'package:beautyapp/pages/states/ProductDetailPageState.dart';
import 'package:flutter/widgets.dart';


class ProductDetailPage extends StatefulWidget {

    final String title;
    final String message;

    //const ProductDetailPage({Key? key}) : super(key: key);
    
    static const routeName = '/ProductDetailPage';

    const ProductDetailPage({
      super.key,
      required this.title,
      required this.message,
    });

  @override
  State<ProductDetailPage> createState() => ProductDetailPageState();
}