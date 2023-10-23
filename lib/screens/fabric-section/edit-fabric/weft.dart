import 'package:flutter/material.dart';
import '../../../widgets/common_fields.dart';

class EditWeftCategory extends StatefulWidget {
  final PageController page;
  const EditWeftCategory({super.key, required this.page});

  @override
  State<EditWeftCategory> createState() => _EditWeftCategoryState();
}

class _EditWeftCategoryState extends State<EditWeftCategory> {
  ScrollController _basicController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Scrollbar(
          controller: _basicController,
          child: SingleChildScrollView(
            controller: _basicController,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            widget.page.nextPage(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.ease);
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blueAccent)),
                          child: Text('GET RESULT (BASIC)')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
