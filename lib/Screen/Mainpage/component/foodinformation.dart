// component에 넣은 이유 :
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/theme.dart';

Widget FoodInformation(ReviewerName, ReviewerText, _initialRating, image) {
  // double _initialRating = 3.0;
  // double _minRating = 0.5;

  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 15,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 400,
          height: 200,
          // 전체적인 Box 크기 지정

          // 전체적인 Box Style 지정
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),

          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),

                // image

                // 별점 표시 (뷰어만)
                // image 매개변수 사용 (유저 이미지 반영 예정)

                // ReviewerName 매개변수 사용
                // TextStyleSub6

                // _initialRating 매개변수 사용
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // image 매개변수 사용 (유저 이미지 반영 예정)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                      child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(image),
                              )
                          )
                      ),
                    ),

                    // ReviewerName 매개변수 사용
                    // TextStyleSub6
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                          child: Text(
                            ReviewerName,
                            style: TextStyleSub6,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                    ),
                    /*
                    RatingBar.builder(
                      initialRating: _initialRating,
                      minRating: _minRating,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.redAccent,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    */

                    // 별점 표시 (뷰어만)
                    // _initialRating 매개변수 사용
                    RatingBarIndicator(
                      rating: _initialRating,
                      // 표시할 별점
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.redAccent,
                      ),
                      //
                      itemCount: 5,
                      itemSize: 30.0,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),

                // ReviewerText 매개변수 사용
                // TextStyleRating6
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Text(
                          ReviewerText,
                          style: TextStyleRating6
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

/*
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget FoodInformation(ReviewerName, ReviewerText, _initialRating) {
  // double _initialRating = 3.0;
  double _minRating = 0.5;
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 15,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 400,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),

          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0
                      ),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    /*
                        Image(
                          image: image
                        ),
                      */
                    SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5.0,
                          ),
                          child: Text(
                            ReviewerName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                      width: 50,
                    ),
                    /*
                    RatingBar.builder(
                      initialRating: _initialRating,
                      minRating: _minRating,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.redAccent,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    */
                    RatingBarIndicator(
                      rating: _initialRating, // 표시할 별점
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.redAccent,
                      ),
                      itemCount: 5,
                      itemSize: 30.0,
                      direction: Axis.horizontal,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Text(
                        ReviewerText,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

      ],
    ),
  );
}
*/
