import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yarn_modified/getxcontrollers/uploadphoto.dart';
import 'package:yarn_modified/helper.dart';

class PhotoScreencric extends StatefulWidget {
  final double dobbn;

  // final String fabricid;
  final String image;

  const PhotoScreencric(
      {super.key,
      this.dobbn = 30,
      // required this.fabricid,
      required this.image});

  @override
  State<PhotoScreencric> createState() => _PhotoScreencricState();
}

class _PhotoScreencricState extends State<PhotoScreencric> {
  UploadPhoto uploadPhoto = Get.put(UploadPhoto());
  File? _image;

  Future<void> _getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // _image = null;
        await showDialog(
            context: context,
            builder: (_) => AlertDialog(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                content: StatefulBuilder(
                  builder: (context, StateSetter setState) {
                    return InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _image != null
                                ? Container(
                                    height: 300,
                                    width: 400,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      // shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: FileImage(_image!),
                                          fit: BoxFit.cover),
                                    ),
                                  )
                                : Container(
                                    height: 300,
                                    width: 400,
                                    decoration: BoxDecoration(
                                      // shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(widget.image ?? ""),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                            SizedBox(
                              height: 15,
                            ),
                            // _image != null
                            //     ? ElevatedButton(
                            //     onPressed: () {
                            //       uploadPhoto.uploadphotoapi(
                            //           photo: _image!,
                            //           fabricid: widget.fabricid);
                            //     },
                            //     style: ButtonStyle(
                            //         elevation: MaterialStateProperty.all(5),
                            //         backgroundColor:
                            //         MaterialStateProperty.all(
                            //             Colors.blueAccent)),
                            //     child: Text('Update Photo'))
                            //     : Row(
                            //   mainAxisAlignment:
                            //   MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Expanded(
                            //       child: ElevatedButton(
                            //           onPressed: () {
                            //             _getImageFromGallery().then(
                            //                     (value) => setState(() {}));
                            //           },
                            //           style: ButtonStyle(
                            //               elevation:
                            //               MaterialStateProperty.all(
                            //                   5),
                            //               backgroundColor:
                            //               MaterialStateProperty.all(
                            //                   Colors.green)),
                            //           child: Text('Edit Photo')),
                            //     ),
                            //     SizedBox(
                            //       width: 15,
                            //     ),
                            //     Expanded(
                            //       child: ElevatedButton(
                            //           onPressed: () {
                            //             uploadPhoto.deletephotoapi(
                            //                 fabricid: widget.fabricid);
                            //           },
                            //           style: ButtonStyle(
                            //               elevation:
                            //               MaterialStateProperty.all(
                            //                   5),
                            //               backgroundColor:
                            //               MaterialStateProperty.all(
                            //                   Colors.red)),
                            //           child: Text('Delete Photo')),
                            //     )
                            //   ],
                            // ),
                            // Positioned(
                            //   top: 40,
                            //   right: 0,
                            //   child: IconButton(
                            //       onPressed: () {
                            //         _getImageFromGallery()
                            //             .then((value) => setState(() {}));
                            //       },
                            //       icon: Icon(
                            //         Icons.edit,
                            //         size: 35,
                            //       )),
                            // ),
                            // Positioned(
                            //   top: 40,
                            //   left: 0,
                            //   child:  IconButton(
                            //       onPressed: () {
                            //         Get.back();
                            //       },
                            //       icon: Icon(
                            //         Icons.clear,
                            //         size: 35,
                            //       )),
                            // ),
                          ],
                        ),
                      ),
                    );
                  },
                )));
      },
      child: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          radius: widget.dobbn,
          foregroundImage: NetworkImage(widget.image ?? "")),
    );
  }
}
