import 'package:flutter/material.dart';

class ReviewCardMainpage extends StatelessWidget {
  final String title;
  final String content;
  final String subcontent;
  final Widget Function() widgetBuilder;

  const ReviewCardMainpage(
      {
        required this.title,
        required this.content,
        required this.subcontent,
        required this.widgetBuilder,
      }
  );

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
            width: 220,
            height: 30,
            child: Row(
              children: [
                Container(
                  width: 150,
                  child: Text(
                    title,
                    style: const TextStyle(
                        height: 16 / 12,
                        fontSize: 12,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            width: 196,
            height: 20,
            child: Text(
              content,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 20 / 14,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => widgetBuilder(),
                ),
              );
            },
            child: Text(
              subcontent,
            ),
          ),
        ],
      ),
    );
  }
}