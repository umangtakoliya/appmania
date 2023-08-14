import 'package:flutter/material.dart';
import 'package:furniture_app/Screens/all_product_list.dart';
import 'package:furniture_app/Screens/home_photo.dart';
import 'package:flutter/src/material/dropdown.dart';
import 'detail_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  String? select;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          //centerTitle: true,
          toolbarHeight: 20,
          elevation: 0,
          backgroundColor: Color(0xffffffff),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Container(
                        height: 50,
                        width: w * .900,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC2KZM_UXXpe4AJmkCuoYk2ziRwxdSlCyqqaadIuQP6o6gia9HAe5qzRuVYlQX_Z6z68s&usqp=CAU",fit: BoxFit.cover,),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(9.9),
                                  child: Container(
                                    margin: EdgeInsets.only(left: 80),
                                    height: 30,
                                    width: w * 0.410,
                                    alignment: Alignment.center,
                                    child: Text(
                                         "Living Liquidz",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),



                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        height: 40,
                        width: w * 0.950,
                        decoration: BoxDecoration(
                          color: Color(0xfff5f5f5),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 0),
                              spreadRadius: 1,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "Search",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.list_rounded),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Special Offers",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                            height: h * 0.190,
                            width: w * 0.880,
                            decoration: BoxDecoration(
                              color: Color(0xfff5f5f5),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                  color: Colors.black,
                                ),
                              ],
                              image: DecorationImage(
                                image:NetworkImage
                                  ("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2IiHiXEmYWmwTsUHvPDl2WpYkpajTJS-4PA&usqp=CAU"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "Most Popular",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            DropdownButton(
                              hint: Text("Select Category"),
                              value: select,
                              items: Cat.map(
                                (e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ),
                              ).toList(),
                              onChanged: (val) {
                                setState(
                                  () {
                                    select = val;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Visibility(
                              visible: select != null,
                              child: ActionChip(
                                avatar: Icon(Icons.clear),
                                label: Text("Clear"),
                                onPressed: () {
                                  setState(() {
                                    select = null;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      (select != null)
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: product(category: select!))
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  product(category:"whisky" ),
                                  product(category: "vodka"),
                                  product(category: "Rum"),
                                  product(category: "wine"),
                                  product(category: "Beer"),

                                ],
                              ),
                            ),
                      Container(
                        height: 150,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 70,
                  width: w * 1,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Container(
                              height: 45,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(
                                  Icons.home_filled,
                                  size: 30,
                                ),
                              ),
                              color: Colors.white,
                            ),
                            Text(
                              "Home",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Container(
                              height: 45,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed('cart_page');
                                },
                                child: Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 30,
                                ),
                              ),
                              color: Colors.white,
                            ),
                            Text(
                              "Cart",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Container(
                              height: 45,
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                size: 30,
                              ),
                              color: Colors.white,
                            ),
                            Text(
                              "Orders",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Container(
                              height: 45,
                              child: Icon(
                                Icons.wallet,
                                size: 30,
                              ),
                              color: Colors.white,
                            ),
                            Text(
                              "Wallet",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Container(
                              height: 45,
                              child: Icon(
                                Icons.account_circle_outlined,
                                size: 30,
                              ),
                              color: Colors.white,
                            ),
                            Text(
                              "Profile",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}