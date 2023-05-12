import 'package:flutter/material.dart';
import 'package:todays_webtoon/models/webtoon.dart';
import 'package:todays_webtoon/services/api_services.dart';
import 'package:todays_webtoon/widget/webtoon_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          title: const Text(
            "오늘의 웹툰",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: FutureBuilder(
          future: ApiService.getTodaysWebtoons(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              var webtoons = List<Webtoon>.from(snapshot.data);
              return Column(
                children: [
                  const SizedBox(
                    height: 48,
                  ),
                  Expanded(
                    child: makeList(webtoons),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  ListView makeList(List<Webtoon> webtoons) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      scrollDirection: Axis.horizontal,
      itemCount: webtoons.length,
      itemBuilder: (context, index) {
        return WebtoonCard(webtoon: webtoons[index]);
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
    );
  }
}
