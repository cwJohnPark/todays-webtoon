import 'package:flutter/material.dart';
import 'package:todays_webtoon/models/webtoon.dart';
import 'package:todays_webtoon/screens/detail_screen.dart';

class WebtoonCard extends StatelessWidget {
  final Webtoon webtoon;

  const WebtoonCard({Key? key, required this.webtoon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(webtoon: webtoon),
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: webtoon.id,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              width: 250,
              child: Image.network(webtoon.thumb),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            webtoon.title,
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
