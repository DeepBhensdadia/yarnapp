import 'package:flutter/material.dart';
import 'package:search_choices/search_choices.dart';
import 'package:yarn_modified/const/themes.dart';
import 'package:yarn_modified/model/get-yarn-category-model.dart';
import 'package:yarn_modified/model/get-yarn-index-model.dart';

//==========================Yarn Dropdown=============================

class CustomDropdownyarn extends StatelessWidget {
  final String? Function(int?)? validing;

  final dynamic nonf;

  const CustomDropdownyarn({
    Key? key,
    required this.yarn,
    required this.onSelection,
    required this.hint,
    this.isSelectFirst = false,
    this.initialValue,
    this.validing,  this.nonf,
  }) : super(key: key);

  final List<yarnIndexDatum?> yarn;
  final void Function(int?) onSelection;
  final int? initialValue;
  final bool isSelectFirst;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Yarn",
          style: TextStyle(
              color: MyTheme.appBarColor,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        Theme(
          data: ThemeData(
            backgroundColor: Colors.white,
            canvasColor: Colors.white,
          ),
          child: SearchChoices<int>.single(
            key: nonf,
            validator: validing,
            padding: const EdgeInsets.only(top: 2.5, bottom: 7.5),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            items: yarn
                .map<DropdownMenuItem<int>>(
                  (element) => DropdownMenuItem<int>(
                    value: element?.id ?? 0,
                    child: Text(
                      element?.yarnName ?? "",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                )
                .toList(),
            value: initialValue,
            hint: Text(
              hint,
              style: TextStyle(color: Colors.grey),
            ),
            onChanged: (value) {
              onSelection(value);
            },
            searchHint: Text(
              "Select Any Yarn",
              style: TextStyle(color: Colors.black),
            ),
            searchInputDecoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search_rounded,
                color: Colors.black,
              ),
              hintText: "Search...",
              hintStyle: TextStyle(color: Colors.grey),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.5), width: 0.25),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.5), width: 0.25),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.blue.withOpacity(0.5), width: 1),
              ),
              border: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.black.withOpacity(0.5), width: 1),
              ),
            ),
            searchFn: (String keyword, List<DropdownMenuItem> items) {
              List<int> filterdata = [];
              if (items.isNotEmpty && keyword.isNotEmpty) {
                keyword.split(" ").forEach((k) {
                  int i = 0;
                  for (DropdownMenuItem item in items) {
                    if (!filterdata.contains(i) &&
                        k.isNotEmpty &&
                        ((item.child as Text)
                            .data
                            .toString()
                            .toLowerCase()
                            .contains(k.toLowerCase()))) {
                      filterdata.add(i);
                    }
                    i++;
                  }
                });
              }
              if (keyword.isEmpty) {
                filterdata = Iterable<int>.generate(items.length).toList();
              }
              return (filterdata);
            },
            searchResultDisplayFn: (
                {required displayItem,
                required emptyListWidget,
                required itemTapped,
                required itemsToDisplay,
                required scrollController,
                required thumbVisibility}) {
              return Expanded(
                child: Scrollbar(
                  controller: scrollController,
                  thumbVisibility: thumbVisibility,
                  child: itemsToDisplay.isEmpty
                      ? emptyListWidget
                      : ListView.builder(
                          controller: scrollController,
                          itemBuilder: (context, index) {
                            int itemIndex = itemsToDisplay[index].item1;
                            DropdownMenuItem item = itemsToDisplay[index].item2;
                            bool isItemSelected = itemsToDisplay[index].item3;
                            return InkWell(
                              onTap: () {
                                itemTapped(
                                  itemIndex,
                                  item.value,
                                  isItemSelected,
                                );
                              },
                              child: displayItem(
                                item,
                                isItemSelected,
                              ),
                            );
                          },
                          itemCount: itemsToDisplay.length,
                        ),
                ),
              );
            },
            isExpanded: true,
            displayClearIcon: false,
            dialogBox: true,
          ),
        ),
      ],
    );
  }
}

//========================Category Dropdown============================

class CustomCategoryDropdownyarn extends StatefulWidget {
  const CustomCategoryDropdownyarn({
    Key? key,
    required this.yarn,
    required this.onSelection,
    required this.hint,
    this.isSelectFirst = false,
    this.initialValue,
  }) : super(key: key);

  final List<yarnCategoryDatum?> yarn;
  final void Function(int?) onSelection;
  final int? initialValue;
  final bool isSelectFirst;
  final hint;

  @override
  State<CustomCategoryDropdownyarn> createState() =>
      _CustomCategoryDropdownyarnState();
}

class _CustomCategoryDropdownyarnState
    extends State<CustomCategoryDropdownyarn> {
  int? _selectedyarnCategory;

  @override
  void initState() {
    super.initState();
    _selectedyarnCategory = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Yarn",
          style: TextStyle(
              color: MyTheme.appBarColor,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        Theme(
          data: ThemeData(
            backgroundColor: Colors.white,
            canvasColor: Colors.white,
          ),
          child: SearchChoices<int>.single(
            padding: const EdgeInsets.only(top: 2.5, bottom: 7.5),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            ),
            items: widget.yarn
                .map<DropdownMenuItem<int>>(
                  (element) => DropdownMenuItem<int>(
                    value: element?.id ?? 0,
                    child: Text(element?.yarnCategory ?? ""),
                  ),
                )
                .toList(),
            value: _selectedyarnCategory,
            hint: Text(
              widget.hint,
              style: TextStyle(color: Colors.grey),
            ),
            onChanged: (value) {
              setState(() {
                _selectedyarnCategory = value;
                print(value);
              });
              widget.onSelection(value);
            },
            searchHint: Text(
              "Select Any Yarn",
              style: TextStyle(color: Colors.black),
            ),
            searchInputDecoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search_rounded,
                color: Colors.black,
              ),
              hintText: "Search...",
              hintStyle: TextStyle(color: Colors.grey),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.5), width: 0.25),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.5), width: 0.25),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.blue.withOpacity(0.5), width: 1),
              ),
              border: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.black.withOpacity(0.5), width: 1),
              ),
            ),
            searchFn: (String keyword, List<DropdownMenuItem> items) {
              List<int> filterdata = [];
              if (items.isNotEmpty && keyword.isNotEmpty) {
                keyword.split(" ").forEach((k) {
                  int i = 0;
                  for (DropdownMenuItem item in items) {
                    if (!filterdata.contains(i) &&
                        k.isNotEmpty &&
                        ((item.child as Text)
                            .data
                            .toString()
                            .toLowerCase()
                            .contains(k.toLowerCase()))) {
                      filterdata.add(i);
                    }
                    i++;
                  }
                });
              }
              if (keyword.isEmpty) {
                filterdata = Iterable<int>.generate(items.length).toList();
              }
              return (filterdata);
            },
            searchResultDisplayFn: (
                {required displayItem,
                required emptyListWidget,
                required itemTapped,
                required itemsToDisplay,
                required scrollController,
                required thumbVisibility}) {
              return Expanded(
                child: Scrollbar(
                  controller: scrollController,
                  thumbVisibility: thumbVisibility,
                  child: itemsToDisplay.isEmpty
                      ? emptyListWidget
                      : ListView.builder(
                          controller: scrollController,
                          itemBuilder: (context, index) {
                            int itemIndex = itemsToDisplay[index].item1;
                            DropdownMenuItem item = itemsToDisplay[index].item2;
                            bool isItemSelected = itemsToDisplay[index].item3;
                            return InkWell(
                              onTap: () {
                                itemTapped(
                                  itemIndex,
                                  item.value,
                                  isItemSelected,
                                );
                              },
                              child: displayItem(
                                item,
                                isItemSelected,
                              ),
                            );
                          },
                          itemCount: itemsToDisplay.length,
                        ),
                ),
              );
            },
            isExpanded: true,
            displayClearIcon: false,
            dialogBox: true,
          ),
        ),
      ],
    );
  }
}
