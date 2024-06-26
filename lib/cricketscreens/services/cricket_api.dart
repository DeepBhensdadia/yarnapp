import 'dart:convert';

import 'package:yarn_modified/cricketscreens/model/get_super_over_response.dart';
import 'package:yarn_modified/cricketscreens/model/gettournamenttype.dart';
import 'package:http/http.dart' as http;
import 'package:yarn_modified/cricketscreens/model/usercheckmodel.dart';
import '../../services/all_api_services.dart';
import '../../services/app_url.dart';
import '../model/matchlivedetailssuperoverresponse.dart';
import '../model/tournamentlist.dart';

Future<GetTournamenttype> gettournamenttypelist() async {
  var url = Uri.parse(URLs.Base_url + "index_tournament_type");
  var response = await http.get(url);
  print('Response Body: ${response.body}');
  return getTournamenttypeFromJson(response.body);
}

Future<GetTournamentlist> gettournamentlistapi() async {
  var url = Uri.parse(URLs.Base_url + "index_tournament?user_id=${saveUser()?.id}");
  var response = await http.get(url);
  print('Response Body: ${response.body}');
  return getTournamentlistFromJson(response.body);
}
Future<Usercheckmodel> checkuserapi({required String parameter}) async {
  var url = Uri.parse(URLs.Base_url + "user_check");
  var response = await http.post(url,body: parameter);
  print('Response Body: ${response.body}');
  return usercheckmodelFromJson(response.body);
}

Future<GetSuperOverResponse> createSuperOver({required Map<String,dynamic> data}) async {
  var url = Uri.parse(URLs.super_over);
  var response = await http.post(url,body: data,);
  // print('Response Body: ${json.decode(response.body)}');
  return getSuperOverResponseFromJson(response.body);
}

