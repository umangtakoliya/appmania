import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/all_product_list.dart';

Widget product({required String category}) {
  return Builder(builder: (context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Row(
        children: [
          ...AllProducts.map(
            (e) => (e["category"] == category)
                ? GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('detail_page', arguments: e);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                      height: 350,
                      width: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      e['thumbnail'],
                                    ),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      child: Text(

                                        e['title'],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "Rs. ${e['price']}",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17,

                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  )
                : Container(

            ),
          ).toList(),
        ],
      ),
    );
  });
}
