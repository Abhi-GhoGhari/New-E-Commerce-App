import 'package:flutter/material.dart';
import 'package:new_ecommerce_app/utils/product_utils.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}
// modelRoute.of(context) ?.setting.arguments as Map ?) ?? allProduct[0];

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF2EFE5),
        title: Text(data['title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  data['images'].length,
                  (index) => Container(
                    margin: const EdgeInsets.all(8),
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: NetworkImage(data['images'][index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
