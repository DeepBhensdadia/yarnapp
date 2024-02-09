import 'package:flutter/material.dart';

import '../../const/themes.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({super.key});

  @override
  State<TermsConditionScreen> createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: MyTheme.scaffoldColor,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.30),
                  Colors.white.withOpacity(0.65),
                  Colors.white.withOpacity(0.85)
                ])),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),
                title: Text(
                  'Terms And Condition',
                  textScaleFactor: 1,
                  style: TextStyle(color: MyTheme.appBarTextColor),
                ),
                // centerTitle: true,
                backgroundColor: MyTheme.appBarColor,
                elevation: 5,
                automaticallyImplyLeading: true,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.white.withOpacity(0.20),
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.025),
                        Colors.transparent,
                      ])),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Text('''Welcome to our app!

At R R Textile, we’ve been making fabric for many years. 

With modern machines and fabrics in focus, we saw the need for an app to easily and accurately calculate fabric costs. 

That’s why we’re here – making fabric pricing simple for you.

This app is very useful for all weavers, whether they have a Power loom, Water jet loom, Rapier loom, or Airjet loom.

Here are the main four points:
	•	Yarn category
	•	Yarn rate
	•	Fabric category
	•	Fabric cost

In the yarn category, simply include yarn types like polyester, viscose, cotton, nylon, and more.
The benefit of this category is that you can easily find what you're looking for using filters.

In the yarn rate, include various yarns with details. This helps find out how much the fabric costs.
This app is helpful because you don't have to keep adding the same yarn repeatedly to calculate costs for different fabrics.

In the fabric category, include items like saree, dress, dupata, all over, and more.
The benefit of this category is that you can easily find what you're looking for using filters.

In the fabric cost, provide a few details to know how much the fabric costs.
This app is handy because if the yarn rate changes, you can edit it, and it will automatically update the cost for all fabrics that use this yarn.

We added weft with two choices:
	◦	Choose the Basic option if you know the average ppi of all wefts. 
	◦	Choose the Advance option if you don't have the average ppi of the weft.

In the Advance option, if you use the same feeder or yarn with various ppi, consider it as a separate weft.

Lastly, you can also include an image of your fabric.''',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
