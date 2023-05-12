import 'package:flutter/material.dart';
import 'package:todays_webtoon/models/webtoon.dart';
import 'package:todays_webtoon/models/webtoon_detail.dart';
import 'package:todays_webtoon/services/api_services.dart';

class DetailScreen extends StatelessWidget {
  final Webtoon webtoon;

  const DetailScreen({Key? key, required this.webtoon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(webtoon.title),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          Hero(
            tag: webtoon.id,
            child: Container(
              alignment: Alignment.center,
              height: 320,
              child: Image.network(webtoon.thumb),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: ApiService.getWebtoonDetails(webtoon.id),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                var webtoonDetail = (snapshot.data as WebtoonDetail);
                return Column(
                  children: [
                    const SizedBox(
                      height: 48,
                    ),
                    Text(webtoonDetail.title),
                    Text(webtoonDetail.about),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
