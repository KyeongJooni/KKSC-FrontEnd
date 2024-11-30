import 'package:flutter/material.dart';

const TextStyle4 = TextStyle(
  // fontSize: 16,
  // color: greyColor2,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w400, // Medium
  // decoration: TextDecoration.underline,
);
// 사용 용도 :
// dart 분류
/*
main.dart : O
*/
// 사용 장소
// 1.
/*
//    Drawer
//      ㄴListView
//        ㄴListTile
//          ㄴonTap()
//            ㄴshowDialog
//              ㄴalertDialog
//                ㄴactions
//                  ㄴElevatedButton
//                    ㄴText ("Check" / TextStyle4)
*/

const TextStyleSub4 = TextStyle(
  fontSize: 16,
  // color: greyColor2,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w400, // Medium
  // decoration: TextDecoration.underline,
);

const TextStyle5 = TextStyle(
  // fontSize: 16,
  // color: greyColor1,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w500, // Bold
);
// 사용 용도 :
// dart 분류
/*
main.dart : O
*/
// 사용 장소
// 1.
/*
//    Drawer
//      ㄴListView
//        ㄴUserAccountsDrawerHeader
//          - accountName (Id / TextStyle5)
//          - accountEmail (Email / TextStyle5)
*/
// 2.
/*
//    Drawer
//      ㄴListView
//        ㄴListTile
//          ㄴonTap()
//            ㄴshowDialog
//              ㄴalertDialog
//                ㄴcontent: Text (Version / TextStyle5)
*/

const TextStyleSub5 = TextStyle(
  // fontSize: 16,
  color: Colors.grey,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w500, // Bold
);
// 사용 용도 :
// dart 분류
/*
main.dart : O
*/
// 사용 장소
// 1.
/*
//    Drawer
//      ㄴListView
//        ㄴListTile
//          ㄴText
//            - style (Version / TextStyle6)
*/
// 2.
/*
//    Drawer
//      ㄴListView
//        ㄴListTile
//          ㄴonTap()
//            ㄴshowDialog
//              ㄴalertDialog
//                ㄴtitle: Text ("Version" / TextStyle6)
*/

const TextStyle6 = TextStyle(
  // fontSize: 16,
  // color: greyColor2,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w600, // Medium
  // decoration: TextDecoration.underline,
);

const TextStyleMain6 = TextStyle(
  // fontSize: 16,
  // color: greyColor2,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w600, // Medium
  // decoration: TextDecoration.underline,
);
/*
    //    build
    //      ㄴSingleChildScrollView
    //        ㄴColumn
    //          ㄴInkWell
    //            ㄴPadding
    //              ㄴRow
    //                ㄴText
*/
/*
      //    build
      //      ㄴSingleChildScrollView
      //        ㄴColumn
      //          ㄴInkWell
      //            ㄴPadding
      //              ㄴRow
      //                ㄴText
  */

const TextStyleRating6 = TextStyle(
  fontSize: 20,
  // color: greyColor2,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w600, // Medium
  // decoration: TextDecoration.underline,
);
// 사용 용도 :
// dart 분류
/*
foodinformation.dart : O
*/
// 사용 장소
// 1.
/*
//    ㄴPadding
//      ㄴRow
//        ㄴText
//          - style (ReviewerText - 매개변수 / TextStyleRating6)
*/

const TextStyleSub6 = TextStyle(
  fontSize: 18,
  // color: greyColor2,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w600, // Medium
  // decoration: TextDecoration.underline,
);
// 사용 용도 :
// dart 분류
/*
foodinformation.dart : O
*/
// 사용 장소
// 1.
/*
//    ㄴRow
//      ㄴColumn
//        ㄴPadding
//          ㄴText
//            - style (ReviewerName - 매개변수 / TextStyleSub6)
*/

const TextStyle7 = TextStyle(
  fontSize: 16,
  // color: greyColor1,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w700, // Bold
);

const TextStyleMain7 = TextStyle(
  fontSize: 20,
  // color: greyColor1,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w700, // Bold
);
// 사용 용도 :
// dart 분류
/*
foodinformation.dart : O
*/
// 사용 장소
// 1.
/*
//    build
//      ㄴSingleChildScrollView
//        ㄴColumn
//          ㄴPadding
//            ㄴRow
//              ㄴText
*/
/*
    //    build
    //      ㄴSingleChildScrollView
    //        ㄴColumn
    //          ㄴPadding
    //            ㄴRow
    //              ㄴText
*/

const TextStyleMain8 = TextStyle(
  fontSize: 24,
  // color: greyColor1,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w800, // Bold
);