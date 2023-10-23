import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.75),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.transparent,title: Text('My Orders',textScaleFactor: 1,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                          "Try To Adding Some Orders That Will Be Appeared Here, You Can Add Cotton Shiffon, Georgette And All Types Of Materials, So Kindly Visit To Yarn And Fabric Pages To Order Something, Thank You."),
                    ],
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
