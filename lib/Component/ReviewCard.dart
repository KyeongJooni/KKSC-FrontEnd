import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String user;
  final String content;
  final String starCount;

  const ReviewCard(
      {required this.user, required this.content, required this.starCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 116,
      padding: EdgeInsets.all(12),
      decoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        color: Color.fromRGBO(0, 0, 0, 0.05),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 196,
            height: 24,
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 0.1),
                      borderRadius: BorderRadius.circular(24)),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8.0),
                  width: 100,
                  child: Text(
                    user,
                    style: const TextStyle(
                        height: 16 / 12,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                for (int i = 0; i < int.parse(starCount); i++)
                  const Icon(
                    Icons.star,
                    size: 12,
                    color: Color.fromRGBO(255, 199, 0, 1),
                  ),
                for (int i = 0; i < 5 - int.parse(starCount); i++)
                  const Icon(
                    Icons.star,
                    size: 12,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            width: 196,
            height: 60,
            child: Text(
              content,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 20 / 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
