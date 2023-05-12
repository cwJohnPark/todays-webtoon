import 'dart:convert';

import 'package:http/http.dart';
import 'package:todays_webtoon/models/webtoon.dart';
import 'package:todays_webtoon/models/webtoon_detail.dart';
import 'package:todays_webtoon/models/webtoon_episode.dart';

class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = "today";
  static const String episodes = "episodes";

  static Future<List<Webtoon>> getTodaysWebtoons() async {
    var url = Uri.parse("$baseUrl/$today");
    final response = await get(url);
    if (response.statusCode != 200) {
      throw Error();
    }
    return jsonDecode(response.body)
        .map<Webtoon>((e) => Webtoon.fromJson(e))
        .toList();
  }

  static Future<WebtoonDetail> getWebtoonDetails(String id) async {
    var url = Uri.parse("$baseUrl/$id");
    final response = await get(url);
    if (response.statusCode != 200) {
      throw Error();
    }
    return WebtoonDetail.fromJson(jsonDecode(response.body));
  }

  static Future<WebtoonEpisodes> getLatestEpisodes(String id) async {
    var url = Uri.parse("$baseUrl/$id/$episodes");
    final response = await get(url);
    if (response.statusCode != 200) {
      throw Error();
    }
    return WebtoonEpisodes.fromJson(jsonDecode(response.body));
  }
}
