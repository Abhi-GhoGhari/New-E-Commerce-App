import 'package:flutter/material.dart';

import '../../utils/product_utils.dart';
import '../../utils/route_utils.dart';
import 'cart_page.dart';
import 'my_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _State();
}

class _State extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.person),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => my_profile(),
              ),
            );
          },
        ),
        title: const Center(child: Text("Home Page")),
        actions: [
          GestureDetector(
            child: Icon(
              Icons.shopping_bag_outlined,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      backgroundColor: Color(0xffE3E1D9),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...Categorios.map(
                (e) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.replaceFirst(e[0], e[0].toUpperCase()),
                      style: TextStyle(
                        fontSize: size.height * 0.02,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...allProducts
                              .map((element) => (element['category'] == e)
                                  ? GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                          MyRoutes.detailPage,
                                          arguments: element,
                                        );
                                      },
                                      child: Container(
                                        height: size.height * 0.3,
                                        width: size.width * 0.5,
                                        margin: const EdgeInsets.all(5),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Color(0xffF2EFE5),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 3,
                                              offset: Offset(3, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: size.height * 0.2,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.red,
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        element['thumbnail']),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                            Container(
                                              height: size.height * 0.1,
                                              // color: Colors.grey.shade100,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    element["title"],
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                    element["description"],
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                    element["price"].toString(),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container())
                              .toList()
                        ],
                      ),
                    ),
                  ],
                ),
              ).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
