import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:venturo/model/youtube_model.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

class AppModel with ChangeNotifier {
  late YoutubeModel listModel;
  bool isLoading = true;

  Future<YoutubeModel> getListVideos() async {
    isLoading = true;
    YoutubeModel result;
    var res = await http.get(Uri.parse("http://tes-mobile.landa.id/index.php"));
    if (res.statusCode == 200) {
      listModel = YoutubeModel.fromJson(json.decode(res.body));
    }
    isLoading = false;
    print(json.encode(listModel));
    notifyListeners();
    return result = listModel;
  }
}
