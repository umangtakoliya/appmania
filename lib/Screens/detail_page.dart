import 'package:flutter/material.dart';

import 'all_product_list.dart';

class Detail_Scereen extends StatefulWidget {
  const Detail_Scereen({Key? key}) : super(key: key);

  @override
  State<Detail_Scereen> createState() => _Detail_ScereenState();
}

class _Detail_ScereenState extends State<Detail_Scereen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        autofocus: false,
        onPressed: () {
          if (!addedProducts.contains(data)) {
            addedProducts.add(data);
          }
          Navigator.of(context).pushNamed(
            'cart_page',
          );
        },
        backgroundColor: Colors.black26,
        child: Icon(
          Icons.shopping_bag_outlined,
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        top: true,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...data['images']
                            .map(
                              (e) => Container(
                                height: h * 0.490,
                                width: w * 0.999,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(e),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: h * 0.460,
                    width: 360,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 250,
                              child: Text(
                                data['title'],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              child: Icon(Icons.ssid_chart),
                            )
                          ],
                        ),
                        Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w700),
                        ),
                        Container(
                          height: 70,
                          width: 350,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              "${data['description']}",
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),



                        Row(
                          children: [
                            Text(
                              "Quantity",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: Color(0xfff3f3f3),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "-",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "3",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "+",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Totle price",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Rs. ${data['price']}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 20,
                left: 10,
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
