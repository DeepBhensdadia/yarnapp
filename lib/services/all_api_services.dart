import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:yarn_modified/model/addfebricresponsemodel.dart';
import 'package:yarn_modified/model/get-fabric-category-model.dart';
import 'package:yarn_modified/model/getdetailscheckmodel.dart';
import 'package:yarn_modified/model/getfebricslistmodel.dart';
import 'package:yarn_modified/model/getloginmodel.dart';
import 'package:yarn_modified/model/getregisterresponsemodel.dart';
import 'package:yarn_modified/model/getresultmodelresponse.dart';
import 'package:yarn_modified/model/packagelistresponse.dart';
import 'package:yarn_modified/model/packagesummaryresponse.dart';
import 'package:yarn_modified/services/app_url.dart';
import 'package:yarn_modified/shared_pref/shared_pref.dart';
import '../model/create-fabric-category-model.dart';
import '../model/create-yarn-category-model.dart';
import '../model/create-yarn-index-model.dart';
import '../model/deletion-model.dart';
import '../model/edit-model.dart';
import '../model/get-yarn-category-model.dart';
import '../model/get-yarn-index-model.dart';

//==============Get Yarn & Fabric Category, Yarn & Fabric Index Api===========

var commonHeaders = {'Content-Type': 'application/json'};

Getloginresponse? saveUser() {
  Getloginresponse? saveuser = SharedPref.get(prefKey: PrefKey.loginDetails) !=
          null
      ? getloginresponseFromJson(SharedPref.get(prefKey: PrefKey.loginDetails)!)
      : null;
  return saveuser;
}

//******************************* packages **************************//

Future<Packagelistresponse> Packagelist() async {
  var url = Uri.parse(URLs.Base_url + "packagelist");
  var response = await http.get(url);
  print('Response Body: ${response.body}');
  return packagelistresponseFromJson(response.body);
}

Future<Packagessummaryresponse> PackageSummary() async {
  var url = Uri.parse(URLs.Base_url + "userpackage?user_id=${saveUser()?.id}");
  var response = await http.get(url);
  print('Response Body: ${response.body}');
  return packagessummaryresponseFromJson(response.body);
}

Future<YarnCategoryModel> yarnCategoryData() async {
  var url = Uri.parse(URLs.Base_url + "yarnCategory?user_id=${saveUser()?.id}");
  var response = await http.get(url);
  // print('Response Body: ${response.body}');
  return yarnCategoryModelFromJson(response.body);
}

Future<GetFebricsModel> febricindexlist({required String para}) async {
  var url =
      Uri.parse(URLs.Base_url + "getFabricCost?user_id=${saveUser()?.id}$para");
  var response = await http.get(url);
  print('Response Body: ${response.body}');
  return getFebricsModelFromJson(response.body);
}

Future<FabricCategoryModel> fabricCategoryData() async {
  var url =
      Uri.parse(URLs.Base_url + "fabricCategory?user_id=${saveUser()?.id}");
  var response = await http.get(url);
  // print('Response Body: ${response.body}');
  return fabricCategoryModelFromJson(response.body);
}

Future<YarnIndexModel> yarnIndexData({required String keyword}) async {
  var url =
      Uri.parse(URLs.Base_url + "yarmsrc?user_id=${saveUser()?.id}$keyword");
  var response = await http.get(url);
  // print('Response Body: ${response.body}');
  return yarnIndexModelFromJson(response.body);
}

Future<Getloginresponse> getlogindetails(
    {required String keyword, required String deviceinfo}) async {
  var url = Uri.parse(URLs.Base_url +
      "userlogin?mobile_number=${keyword}&device_id=$deviceinfo");
  var response = await http.post(url);
  print('Response Body: ${response.body}');
  return getloginresponseFromJson(response.body);
}

Future<Getloginresponse> UpdatePhonenumber({required var parameter}) async {
  var url = Uri.parse(URLs.Base_url + "updateNumber");
  var response = await http.post(url, body: parameter, headers: commonHeaders);
  print('Response Body: ${response.body}');
  return getloginresponseFromJson(response.body);
}

Future<Getloginresponse> Updateuserprofile({required var parameter}) async {
  var url = Uri.parse(URLs.Base_url + "userUpadate");
  var response = await http.post(url, body: parameter, headers: commonHeaders);
  print('Response Body: ${response.body}');
  return getloginresponseFromJson(response.body);
}

// ===========================GetxCode============================

Future<GetResultModel> getResultapi({required String id}) async {
  var url =
      Uri.parse(URLs.Base_url + "getresult/$id?user_id=${saveUser()?.id}");
  var response = await http.get(url);
  print('Response Body: ${response.body}');
  return getResultModelFromJson(response.body);
}

Future<Getdetailscheckresponse> getDetailsChecktapi(
    {required String deviceid}) async {
  var url = Uri.parse(
      URLs.Base_url + "getDetails?device_id=$deviceid&id=${saveUser()?.id}");
  var response = await http.get(url);
  print('Response Body: ${response.body}');
  return getdetailscheckresponseFromJson(response.body);
}

Future<AddfebricresponseModel> addfebricdetails({required var parameter}) {
  String url = '${URLs.Base_url}AddFabricDetails';
  return http
      .post(Uri.parse(url), body: parameter, headers: commonHeaders)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return addfebricresponseModelFromJson(response.body);
  });
}

Future<EditModel> febricvalidation({required var parameter}) {
  String url = '${URLs.Base_url}validationFabricDetails';
  return http
      .post(Uri.parse(url), body: parameter, headers: commonHeaders)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return editModelFromJson(response.body);
  });
}

Future<Getregistrationresponse> Registration({required var parameter}) {
  String url = '${URLs.Base_url}userRegistration';
  return http
      .post(Uri.parse(url), body: parameter, headers: commonHeaders)
      .then((http.Response response) {
    debugPrint(json.encode(response.body));
    return getregistrationresponseFromJson(response.body);
  });
}

//==============Add Yarn & Fabric Category, Yarn & Fabric Index Api===========

Future<CreateYarnCategoryModel> addYarnCategoryData(
    {required parameter}) async {
  var url = Uri.parse(URLs.Base_url + "yarnCreateCategory");
  // var response = await http.post(body: jsonEncode(parameter),url,headers: yarnHeaders);
  // // print('Response Body: ${response.body}');
  // return createYarnCategoryModelFromJson(response.body);

  var response =
      await http.post(body: jsonEncode(parameter), url, headers: commonHeaders);

  if (response.statusCode == 200) {
    // print('Response Body: ${response.body}');
  }
  return createYarnCategoryModelFromJson(response.body);
}

Future<CreateFabricCategoryModel> addFabricCategoryData(
    {required parameter}) async {
  var url = Uri.parse(URLs.Base_url + "fabricCreateCategory");
  var response =
      await http.post(body: jsonEncode(parameter), url, headers: commonHeaders);
  // print('Response Body: ${response.body}');
  return createFabricCategoryModelFromJson(response.body);
}

Future<CreateAddYarnModel> addYarnIndexData({required parameter}) async {
  var url = Uri.parse(URLs.Base_url + "yarnCreate");
  var response = await http.post(body: parameter, url, headers: commonHeaders);
  print('Response Body: ${response.body}');
  return createAddYarnModelFromJson(response.body);
}

//==============Edit Yarn & Fabric Category, Yarn & Fabric Index Api===========

Future<EditModel> editYarnCategoryData(
    {required parameter, required String categoryId}) async {
  var url = Uri.parse(URLs.Base_url + "yarnUpdateCategory/$categoryId");
  var response = await http.put(body: parameter, url, headers: commonHeaders);
  print('Response Body: ${response.body}');
  return editModelFromJson(response.body);
}

Future<EditModel> editFabricCategoryData(
    {required parameter, required String categoryId}) async {
  var url = Uri.parse(URLs.Base_url + "fabricUpdateCategory/$categoryId");
  var response = await http.put(body: parameter, url, headers: commonHeaders);
  print('Response Body: ${response.body}');
  return editModelFromJson(response.body);
}

Future<EditModel> editYarnIndexData(
    {required parameter, required String categoryId}) async {
  var url = Uri.parse(URLs.Base_url + "yarnUpdate/$categoryId");
  var response = await http.put(body: parameter, url, headers: commonHeaders);
  print('Response Body: ${response.body}');
  return editModelFromJson(response.body);
}

//=============Delete Yarn & Fabric Category, Yarn & Fabric Index Api==========

Future<DeletionModel> deleteYarnCategoryData(
    {required String categoryId}) async {
  var url = Uri.parse(URLs.Base_url +
      "yarnDestroyCategory/$categoryId?user_id=${saveUser()?.id}");
  print(url);
  var response = await http.delete(url);
  print('Response Body: ${response.body}');
  return deletionModelFromJson(response.body);
}

Future<DeletionModel> deleteFabricCategoryData(
    {required String categoryId}) async {
  var url = Uri.parse(URLs.Base_url +
      "fabricDestroyCategory/$categoryId?user_id=${saveUser()?.id}");
  print(url);
  var response = await http.delete(url);
  print('Response Body: ${response.body}');
  return deletionModelFromJson(response.body);
}

Future<DeletionModel> deleteYarnIndexData({required String categoryId}) async {
  var url = Uri.parse(
      URLs.Base_url + "yarnDestroy/$categoryId?user_id=${saveUser()?.id}");
  print(url);
  var response = await http.delete(url);
  print('Response Body: ${response.body}');
  return deletionModelFromJson(response.body);
}

Future<DeletionModel> deleteFabricData({required String categoryId}) async {
  var url = Uri.parse(
      URLs.Base_url + "fabricCostDelete/$categoryId?user_id=${saveUser()?.id}");
  print(url);
  var response = await http.delete(url);
  print('Response Body: ${response.body}');
  return deletionModelFromJson(response.body);
}

Future<DeletionModel> deleteFabricimage({required String id}) async {
  var url = Uri.parse(URLs.Base_url + "deletePhoto?id=$id");
  print(url);
  var response = await http.post(url);
  print('Response Body: ${response.body}');
  return deletionModelFromJson(response.body);
}

Future<DeletionModel> deleteuseraccount() async {
  var url = Uri.parse(URLs.Base_url + "deleteUser?id=${saveUser()?.id}");
  print(url);
  var response = await http.post(url);
  print('Response Body: ${response.body}');
  return deletionModelFromJson(response.body);
}
