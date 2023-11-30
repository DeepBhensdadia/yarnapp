import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yarn_modified/const/themes.dart';
import 'package:yarn_modified/services/all_api_services.dart';
import 'package:yarn_modified/widgets/common_fields.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  TextEditingController nameController =
      TextEditingController(text: saveUser()?.name);
  TextEditingController mobileController =
      TextEditingController(text: saveUser()?.mobileNumber);
  TextEditingController emailController =
      TextEditingController(text: saveUser()?.email);
  TextEditingController businessnameController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
                  'Profile',
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
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  CommonTextField(
                                    validatoe: (p0) {
                                      if (p0!.isEmpty) {
                                        return "Enter Name";
                                      }
                                      return null;
                                    },
                                    controller: nameController,
                                    labelText: 'Name *',
                                    keyboardType: TextInputType.text,
                                    hintText: 'Enter Your Full Name',
                                    inputFormatters:
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r'[/\\-_]')),
                                  ),
                                  SizedBox(height: 25),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CommonMobileTextField(
                                            read: true,
                                            validator: (p0) {
                                              if (p0!.isEmpty) {
                                                return "Enter Mobile Number";
                                              } else if (p0.length < 10) {
                                                return "Enter Valid Mobile Number";
                                              }
                                            },
                                            controller: mobileController,
                                            labelText: "Mobile Number *",
                                            hintText: "Enter Mobile Number"),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // Get.to(chenge_phonenumber());
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          // height: 23,
                                          // width: 70,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.pink),
                                          child: Center(
                                            child: Text(
                                              'Change Number.',
                                              style: TextStyle(
                                                  fontFamily: 'SF Pro Display',
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  CommonTextField(
                                    controller: emailController,
                                    labelText: 'Email',
                                    keyboardType: TextInputType.emailAddress,
                                    hintText: 'Enter Your Email Address',
                                    inputFormatters:
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r'[/\\]')),
                                  ),
                                  SizedBox(height: 20),
                                  CommonTextField(
                                    controller: businessnameController,
                                    labelText: 'Business Name',
                                    keyboardType: TextInputType.emailAddress,
                                    hintText: 'Enter Your Email Address',
                                    inputFormatters:
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r'[/\\]')),
                                  ),
                                  SizedBox(height: 20),
                                  CommonTextField(
                                    controller: locationController,
                                    labelText: 'Location',
                                    keyboardType: TextInputType.emailAddress,
                                    hintText: 'Enter Your Location',
                                    inputFormatters:
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r'[/\\]')),
                                  ),
                                  SizedBox(height: 30),
                                  Container(
                                    height: 40,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          if (formKey.currentState!
                                              .validate()) {}
                                        },
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8))),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    MyTheme.appBarColor)),
                                        child: Text('Update')),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/*
*  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text('Hello, Username.',textScaleFactor: 1.75,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Divider(
                  thickness: 3,color: Colors.grey,
                ),
                Expanded(child: ListView.builder(
                  itemCount: profileItems1.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(profileItems1[index]['icon']),
                      title: Text(profileItems1[index]['text']),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded),
                      onTap: () {
                        // if(index == 0) {
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrders()));
                        // }
                        // else if(index == 1) {
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyFavourites()));
                        // }
                        // else if(index == 2) {
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyAccount()));
                        // }
                        // else if(index == 3) {
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                        // }
                        // else if(index == 4) {
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
                        // }
                      },
                    );
                })),
                Divider(
                  thickness: 3,color: Colors.grey,indent: 30,endIndent: 30,
                ),
                Expanded(flex: 3,child: ListView.builder(
                    itemCount: profileItems2.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Icon(profileItems2[index]['icon']),
                        title: Text(profileItems2[index]['text']),
                        trailing: Icon(Icons.keyboard_arrow_right_rounded),
                        onTap: () {
                          // if(index == 0) {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrders()));
                          // }
                          // else if(index == 1) {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyFavourites()));
                          // }
                          // else if(index == 2) {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyAccount()));
                          // }
                          // else if(index == 3) {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                          // }
                          // else if(index == 4) {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
                          // }
                        },
                      );
                    })),
                Divider(
                  thickness: 3,color: Colors.grey,indent: 30,endIndent: 30,
                ),
                Expanded(flex: 3,child: ListView.builder(
                    itemCount: profileItems3.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Icon(profileItems3[index]['icon']),
                        title: Text(profileItems3[index]['text']),
                        trailing: Icon(Icons.keyboard_arrow_right_rounded),
                        onTap: () {
                          // if(index == 0) {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrders()));
                          // }
                          // else if(index == 1) {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyFavourites()));
                          // }
                          // else if(index == 2) {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyAccount()));
                          // }
                          // else if(index == 3) {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                          // }
                          // else if(index == 4) {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
                          // }
                        },
                      );
                    })),
              ],
            ),
            * */

// class CustomListView extends StatelessWidget {
//   const CustomListView({super.key, required this.Icondata, required this.text});
//
//   final  String text;
//   final IconData Icondata;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Icon(Icondata),
//       title: Text(text),
//       trailing: Icon(Icons.keyboard_arrow_right_rounded),
//       onTap: () {
//
//       },
//     );
//   }
// }

//============================Rough==========================
