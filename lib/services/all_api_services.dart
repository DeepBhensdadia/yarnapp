import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:yarn_modified/model/addfebricresponsemodel.dart';
import 'package:yarn_modified/model/get-fabric-category-model.dart';
import 'package:yarn_modified/model/getfebricslistmodel.dart';
import 'package:yarn_modified/model/getresultmodelresponse.dart';
import 'package:yarn_modified/services/app_url.dart';
import '../model/create-fabric-category-model.dart';
import '../model/create-yarn-category-model.dart';
import '../model/create-yarn-index-model.dart';
import '../model/deletion-model.dart';
import '../model/edit-model.dart';
import '../model/get-yarn-category-model.dart';
import '../model/get-yarn-index-model.dart';

//==============Get Yarn & Fabric Category, Yarn & Fabric Index Api===========

var commonHeaders = {
  'Content-Type': 'application/json'
};

Future<YarnCategoryModel> yarnCategoryData() async {
  var url = Uri.parse(URLs.Base_url + "yarnCategory?user_id=1");
  var response = await http.get(url);
  // print('Response Body: ${response.body}');
  return yarnCategoryModelFromJson(response.body);
}
Future<GetFebricsModel> febricindexlist() async {
  var url = Uri.parse(URLs.Base_url + "getFabricCost?user_id=1");
  var response = await http.get(url);
  // print('Response Body: ${response.body}');
  return getFebricsModelFromJson(response.body);
}

Future<FabricCategoryModel> fabricCategoryData() async {
  var url = Uri.parse(URLs.Base_url + "fabricCategory?user_id=1");
  var response = await http.get(url);
  // print('Response Body: ${response.body}');
  return fabricCategoryModelFromJson(response.body);
}

Future<YarnIndexModel> yarnIndexData({required String keyword}) async {
  var url = Uri.parse(URLs.Base_url + "yarmsrc?user_id=1$keyword");
  var response = await http.get(url);
  // print('Response Body: ${response.body}');
  return yarnIndexModelFromJson(response.body);
}

// ===========================GetxCode============================

Future<GetResultModel> getResultapi({required String id}) async {
  var url = Uri.parse(URLs.Base_url + "getresult/$id");
  var response = await http.get(url);
  // print('Response Body: ${response.body}');
  return getResultModelFromJson(response.body);
}

Future<AddfebricresponseModel> addfebricdetails({required var parameter}) {
  String url = '${URLs.Base_url}AddFabricDetails';
  return http
      .post(Uri.parse(url),body: parameter,headers: commonHeaders)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return addfebricresponseModelFromJson(response.body);
  });
}

//==============Add Yarn & Fabric Category, Yarn & Fabric Index Api===========


Future<CreateYarnCategoryModel> addYarnCategoryData({required parameter}) async {
  var url = Uri.parse(URLs.Base_url + "yarnCreateCategory");
  // var response = await http.post(body: jsonEncode(parameter),url,headers: yarnHeaders);
  // // print('Response Body: ${response.body}');
  // return createYarnCategoryModelFromJson(response.body);

  var response = await http.post(body: jsonEncode(parameter),url,headers: commonHeaders);

  if (response.statusCode == 200) {
    // print('Response Body: ${response.body}');
  }
  return createYarnCategoryModelFromJson(response.body);
}

Future<CreateFabricCategoryModel> addFabricCategoryData({required parameter}) async {
  var url = Uri.parse(URLs.Base_url + "fabricCreateCategory");
  var response = await http.post(body: jsonEncode(parameter),url,headers: commonHeaders);
  // print('Response Body: ${response.body}');
  return createFabricCategoryModelFromJson(response.body);
}

Future<CreateAddYarnModel> addYarnIndexData({required parameter}) async {
  var url = Uri.parse(URLs.Base_url + "yarnCreate");
  var response = await http.post(body: parameter,url,headers: commonHeaders);
  // print('Response Body: ${response.body}');
  return createAddYarnModelFromJson(response.body);
}

//==============Edit Yarn & Fabric Category, Yarn & Fabric Index Api===========

Future<EditModel> editYarnCategoryData({required  parameter, required String categoryId}) async {
  var url = Uri.parse(URLs.Base_url + "yarnUpdateCategory/$categoryId");
  var response = await http.put(body: parameter,url,headers: commonHeaders);
  print('Response Body: ${response.body}');
  return editModelFromJson(response.body);
}

Future<EditModel> editFabricCategoryData({required  parameter, required String categoryId}) async {
  var url = Uri.parse(URLs.Base_url + "fabricUpdateCategory/$categoryId");
  var response = await http.put(body: parameter,url,headers: commonHeaders);
  print('Response Body: ${response.body}');
  return editModelFromJson(response.body);
}

Future<EditModel> editYarnIndexData({required  parameter, required String categoryId}) async {
  var url = Uri.parse(URLs.Base_url + "yarnUpdate/$categoryId");
  var response = await http.put(body:parameter,url,headers: commonHeaders);
  print('Response Body: ${response.body}');
  return editModelFromJson(response.body);
}

//=============Delete Yarn & Fabric Category, Yarn & Fabric Index Api==========

Future<DeletionModel> deleteYarnCategoryData({required String categoryId}) async {
  var url = Uri.parse(URLs.Base_url + "yarnDestroyCategory/$categoryId");
  print(url);
  var response = await http.delete(url);
  print('Response Body: ${response.body}');
  return deletionModelFromJson(response.body);
}

Future<DeletionModel> deleteFabricCategoryData({required String categoryId}) async {
  var url = Uri.parse(URLs.Base_url + "fabricDestroyCategory/$categoryId");
  print(url);
  var response = await http.delete(url);
  print('Response Body: ${response.body}');
  return deletionModelFromJson(response.body);
}

Future<DeletionModel> deleteYarnIndexData({required String categoryId}) async {
  var url = Uri.parse(URLs.Base_url + "yarnDestroy/$categoryId");
  print(url);
  var response = await http.delete(url);
  print('Response Body: ${response.body}');
  return deletionModelFromJson(response.body);
}