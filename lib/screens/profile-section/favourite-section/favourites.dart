import 'package:flutter/material.dart';

class MyFavourites extends StatefulWidget {
  const MyFavourites({super.key});

  @override
  State<MyFavourites> createState() => _MyFavouritesState();
}

class _MyFavouritesState extends State<MyFavourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.75),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.transparent,title: Text('My Favourites',textScaleFactor: 1,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),centerTitle: true,),
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
                          "All Your Favourites Will Appear Here So If You Like To Order Recently, Again n Again Or Afterwards You can Add That Particular Item(s) Here in Favourites."),
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
