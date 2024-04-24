import 'package:flutter/material.dart';
import 'package:beautyapp/pages/states/ProductDetailPageState.dart';
import 'package:flutter/widgets.dart';



class ProductDetailPage extends StatefulWidget {

    final String name;
    final String brand;
    final int price;
    final String description;
    final String user_id;
    final String user_name;
    final bool like;
    final String id;//product_id

    //const ProductDetailPage({Key? key}) : super(key: key);
    
    static const routeName = '/ProductDetailPage';

    const ProductDetailPage({
      super.key,
      required this.name,
      required this.brand,
      required this.price,
      required this.description,
      required this.user_id,
      required this.user_name,
      required this.id,
      required this.like,
    });

  @override
  State<ProductDetailPage> createState() => ProductDetailPageState();
}