// main.dart
String ImageURL = 'assets/img/icon/kksc_logo.jpg';
/*
      //    build
      //      ㄴSingleChildScrollView
      //        ㄴColumn
      //          ㄴScrollbar
      //            ㄴPadding
      //              ㄴSingleChildScrollView
      //                ㄴRow
      //                  ㄴInkWell
*/
String Id = '김한성'; // 구현되면 매개변수로 받아야할듯
String Email = 'gkstjd6097@gmail.com';
// 사용 용도 : drawer에 사용자 정보 표시
// 사용 장소
// 1.
/*
//    Drawer
//      ㄴListView
//        ㄴUserAccountsDrawerHeader
//          - currentAccountPicture (ImageURL)
//          - accountName (Id)
//          - accountEmail (Email)
*/

// main.dart
String Version = 'Version: $VersionInnerText';
String VersionInnerText = '1.0.0';
// 사용 용도 :
// 사용 장소
// 1.
/*
//    Drawer
//      ㄴListView
//        ㄴListTile
//          ㄴonTap()
//            ㄴshowDialog
//              ㄴalertDialog
//                ㄴcontent: Text (Version)
*/

// TopAppbar.dart
String ImageURL_AppBar = 'assets/img/icon/gachon_logo.png';
// 사용 용도 :
// 사용 장소
// 1.
/*
//    AppBar
//      ㄴExpanded
//        ㄴRow
//          ㄴTextButton
//            ㄴImage
//              ㄴAssetImage (ImageURL_AppBar)
*/

// foodinformation.dart

// Mainpage.dart
var isLanguage = true;
// true : 한국어
// false : 영어
// 사용 용도 :
// 사용 장소
// 1.
/*
//    build
//      ㄴSingleChildScrollView
//        ㄴColumn
//          ㄴRow
//            ㄴDropdownButton
//              ㄴsetState
//                ㄴif(_selectedValue == _valueList[0])
*/

// Mainpage.dart
List TitleText = [
  "메인 화면",
  /*
    //    build
    //      ㄴSingleChildScrollView
    //        ㄴColumn
    //          ㄴPartMain
  */
  "재학생의 꿀팁",
  /*
    //    build
    //      ㄴSingleChildScrollView
    //        ㄴColumn
    //          ㄴPartMain
  */
  "가천대 학생들을 위한 꿀팁",
  /*
    //    build
    //      ㄴSingleChildScrollView
    //        ㄴColumn
    //          ㄴPadding
    //            ㄴRow
    //              ㄴText
  */
  "첫 학기 계획 세우기",
  /*
    //    build
    //      ㄴSingleChildScrollView
    //        ㄴColumn
    //          ㄴPartFreshman
  */
  "시간표 짜기 꿀팁",
  /*
    //    build
    //      ㄴSingleChildScrollView
    //        ㄴColumn
    //          ㄴPartTimetable
  */
  "학교 근처 맛집",
  /*
    //    build
    //      ㄴSingleChildScrollView
    //        ㄴColumn
    //          ㄴPadding
    //            ㄴRow
    //              ㄴText
  */

  foodPlaceName,
  /*
    //    build
    //      ㄴSingleChildScrollView
    //        ㄴColumn
    //          ㄴInkWell
    //            ㄴPadding
    //              ㄴRow
  */
  otherFoodPlaceName,
  /*
    //    build
    //      ㄴSingleChildScrollView
    //        ㄴColumn
    //          ㄴInkWell
    //            ㄴPadding
    //              ㄴRow
    //                ㄴPartOtherFoodPlace
  */

  "맛집 리뷰"
  /*
    //    build
    //      ㄴSingleChildScrollView
    //        ㄴColumn
    //          ㄴPadding
    //            ㄴRow
    //              ㄴText
  */
];
String foodPlaceName = '맛집 이름';
String otherFoodPlaceName = '또 다른 맛집';
List TitleTextKor = [
  "메인 화면",
  "재학생의 꿀팁",

  "가천대 학생들을 위한 꿀팁",
  "첫 학기 계획 세우기",
  "시간표 짜기 꿀팁",

  "학교 근처 맛집",

  foodPlaceNameKor,
  otherFoodPlaceNameKor,

  "맛집 리뷰"
];
String foodPlaceNameKor = '맛집 이름';
String otherFoodPlaceNameKor = '또 다른 맛집'; // shift + f6 -> or alt + f7

// Mainpage.dart
List subTitleText = [
  "신입생",
  /*
    //    build
    //      ㄴSingleChildScrollView
    //        ㄴColumn
    //          ㄴPartFreshman
  */
  "신입생들을 위한 조언과 팁",
  /*
    //    build
    //      ㄴSingleChildScrollView
    //        ㄴColumn
    //          ㄴPartFreshman
  */

  "시간표",
  /*
    //    build
    //      ㄴSingleChildScrollView
    //        ㄴColumn
    //          ㄴPartTimetable
  */
  "시간표 짜는 방법 소개",
  /*
    //    build
    //      ㄴSingleChildScrollView
    //        ㄴColumn
    //          ㄴPartTimetable
  */

  "평점 : $rateFood",
  /*
    //    build
    //      ㄴSingleChildScrollView
    //        ㄴColumn
    //          ㄴInkWell
    //            ㄴPadding
    //              ㄴRow
  */
  "평점 : $otherRateFood",
  /*
    //    build
    //      ㄴSingleChildScrollView
    //        ㄴColumn
    //          ㄴInkWell
    //            ㄴPadding
    //              ㄴRow
    //                ㄴPartOtherFoodPlace
  */

  "리뷰 : $reviewCount개",
  /*
    //    build
    //      ㄴSingleChildScrollView
    //        ㄴColumn
    //          ㄴInkWell
    //            ㄴPadding
    //              ㄴRow
    //                ㄴText
  */
  "리뷰 : $otherReviewCount개",
  /*
      //    build
      //      ㄴSingleChildScrollView
      //        ㄴColumn
      //          ㄴInkWell
      //            ㄴPadding
      //              ㄴRow
      //                ㄴText
  */
  "맛집 리뷰",
  /*
      //    build
      //      ㄴSingleChildScrollView
      //        ㄴColumn
      //          ㄴPadding
      //            ㄴRow
      //              ㄴText
  */
];
double rateFood = 4.5;
double otherRateFood = 4.0;
int reviewCount = 100;
int otherReviewCount = 80;
List subTitleTextKor = [
  "신입생",
  "신입생들을 위한 조언과 팁",

  "시간표",
  "시간표 짜는 방법 소개",

  "평점 : $rateFood",
  "평점 : $otherRateFood",

  "리뷰 : $reviewCount개",
  "리뷰 : $otherReviewCount개",
];

// Mainpage.dart
List reviewerName = [
  newReviewerName,
  /*
      //    build
      //      ㄴSingleChildScrollView
      //        ㄴColumn
      //          ㄴScrollbar
      //            ㄴPadding
      //              ㄴSingleChildScrollView
      //                ㄴRow
      //                  ㄴInkWell
  */
  newReviewerName2,
  /*
      //    build
      //      ㄴSingleChildScrollView
      //        ㄴColumn
      //          ㄴScrollbar
      //            ㄴPadding
      //              ㄴSingleChildScrollView
      //                ㄴRow
      //                  ㄴInkWell
  */
  newReviewerName3,
  /*
      //    build
      //      ㄴSingleChildScrollView
      //        ㄴColumn
      //          ㄴScrollbar
      //            ㄴPadding
      //              ㄴSingleChildScrollView
      //                ㄴRow
      //                  ㄴInkWell
  */
];
String newReviewerName = '맛집 리뷰어 1'; // 변수로 받아올 예정
String newReviewerName2 = '맛집 리뷰어 2'; // 변수로 받아올 예정
String newReviewerName3 = '맛집 리뷰어 3'; // 변수로 받아올 예정
List reviewerNameKor = [
  newReviewerNameKor,
  newReviewerNameKor2,
  newReviewerNameKor3,
];
String newReviewerNameKor = '맛집 리뷰어 1'; // 변수로 받아올 예정
String newReviewerNameKor2 = '맛집 리뷰어 2'; // 변수로 받아올 예정
String newReviewerNameKor3 = '맛집 리뷰어 3'; // 변수로 받아올 예정

// Mainpage.dart
List ReviewerText = [
  newReviewerText,
  /*
      //    build
      //      ㄴSingleChildScrollView
      //        ㄴColumn
      //          ㄴScrollbar
      //            ㄴPadding
      //              ㄴSingleChildScrollView
      //                ㄴRow
      //                  ㄴInkWell
  */
  newReviewerText2,
  /*
      //    build
      //      ㄴSingleChildScrollView
      //        ㄴColumn
      //          ㄴScrollbar
      //            ㄴPadding
      //              ㄴSingleChildScrollView
      //                ㄴRow
      //                  ㄴInkWell
  */
  newReviewerText3,
  /*
      //    build
      //      ㄴSingleChildScrollView
      //        ㄴColumn
      //          ㄴScrollbar
      //            ㄴPadding
      //              ㄴSingleChildScrollView
      //                ㄴRow
      //                  ㄴInkWell
  */
];
String newReviewerText = '맛집 리뷰어 1'; // 변수로 받아올 예정
String newReviewerText2 = '맛집 리뷰어 2'; // 변수로 받아올 예정
String newReviewerText3 = '맛집 리뷰어 3'; // 변수로 받아올 예정
List reviewerTextKor = [
  newReviewerTextKor,
  newReviewerTextKor2,
  newReviewerTextKor3,
];
String newReviewerTextKor = "매우 만족"; // 변수로 받아올 예정
String newReviewerTextKor2 = "다소 만족"; // 변수로 받아올 예정
String newReviewerTextKor3 = "보통"; // 변수로 받아올 예정
// 사용 용도 :
// 사용 장소
// 1.
/*
//    build
//      ㄴSingleChildScrollView
//        ㄴColumn
//          ㄴRow
//            ㄴDropdownButton
//              ㄴsetState
//                ㄴif(_selectedValue == _valueList[0])
//                  - TitleText, TitleTextKor,
//                  - SubTitleText, subTitleTextKor,
//                  - reviewerName, ReviewerNameKor
//                  - ReviewerText, reviewerTextKor
*/

// Mainpage.dart
List TitleTextEng = [
  "Main Screen",
  "Senior Tip",
  "Tip for Gachon Univ Students",
  "To Plan First Semester",
  "To Plan TimeTable",
  "Delicious Near The Gachon Univ",
  foodPlaceNameEng,
  otherFoodPlaceNameEng,

  "Delicious Food Review"
];
String foodPlaceNameEng = 'Good Food Place Name';
String otherFoodPlaceNameEng = 'Another Food Place Name';

// Mainpage.dart
List subTitleTextEng = [
  "Freshman",
  "Comments and Tips For Freshman",
  "TimeTable",
  "Introduction of Writing TimeTable",
  "rate : $rateFood",
  "rate : $otherRateFood",
  "review : $reviewCount",
  "review : $otherReviewCount",
];

// Mainpage.dart
List reviewerNameEng = [
  newReviewerNameEng,
  newReviewerNameEng2,
  newReviewerNameEng3,
];
String newReviewerNameEng = 'Reviewer 1'; // 변수로 받아올 예정
String newReviewerNameEng2 = 'Reviewer 2'; // 변수로 받아올 예정
String newReviewerNameEng3 = 'Reviewer 3'; // 변수로 받아올 예정

// Mainpage.dart
List reviewerTextEng = [
  newReviewerTextEng,
  newReviewerTextEng2,
  newReviewerTextEng3,
];
String newReviewerTextEng = 'Very nice'; // 변수로 받아올 예정
String newReviewerTextEng2 = 'Sometime good'; // 변수로 받아올 예정
String newReviewerTextEng3 = 'Simple'; // 변수로 받아올 예정
// 사용 용도 :
// 사용 장소
// 1.
/*
//    build
//      ㄴSingleChildScrollView
//        ㄴColumn
//          ㄴRow
//            ㄴDropdownButton
//              ㄴsetState
//                ㄴif(_selectedValue == _valueList[1])
//                  - TitleTextKor,
//                  - SubTitleText, subTitleTextKor,
//                  - reviewerName, ReviewerNameKor
//                  - ReviewerText, reviewerTextKor
*/


String iconStudent = 'assets/img/icon/bell.png';
// 사용 용도 :
// 사용 장소
// 1.
/*
//    build
//      ㄴSingleChildScrollView
//        ㄴColumn
//          ㄴPartMain
*/
String iconBell = 'assets/img/icon/bell.png';
// 사용 용도 :
// 사용 장소
// 1.
/*
//    build
//      ㄴSingleChildScrollView
//        ㄴColumn
//          ㄴPartFreshman
*/
String iconMegaphone = 'assets/img/icon/megaphone.png';
// 사용 용도 :
// 사용 장소
// 1.
/*
//    build
//      ㄴSingleChildScrollView
//        ㄴColumn
//          ㄴPartTimetable
*/
String iconPin = 'assets/img/icon/pin.png';
// 사용 용도 :
// 사용 장소
// 1.

String iconPizza = 'assets/img/icon/pizza.png';
// 사용 용도 :
// 사용 장소
// 1.
/*
    //    build
    //      ㄴSingleChildScrollView
    //        ㄴColumn
    //          ㄴInkWell
    //            ㄴPadding
    //              ㄴRow
    //                ㄴPartOtherFoodPlace
*/