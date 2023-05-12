import 'package:flutter_test/flutter_test.dart';
import 'package:todays_webtoon/services/api_services.dart';

void main() {
  test("API Endpoint '/today' should response with 200 code.", () {
    final body = ApiService.getTodaysWebtoons();

    expect(body, completion(isNotEmpty));
  });
}
