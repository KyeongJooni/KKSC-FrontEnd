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
/*
      //    Scaffold
      //    ㄴDrawer
      //      ㄴListView
      //        ㄴUserAccountsDrawerHeader
      //          ㄴCircleAvatar
      //            ㄴImageURL

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

// appbar.dart
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

// main_ui.dart
var isLanguage = true;

// main_ui.dart
List titleText = [
  "메인 화면",
  "재학생의 꿀팁",
  "가천대 학생들을 위한 꿀팁",
  "첫 학기 계획 세우기",
  "시간표 짜기 꿀팁",
  "학교 근처 맛집",

  foodPlaceName,
  otherFoodPlaceName,

  "맛집 리뷰"
];
String foodPlaceName = '맛집 이름';
String otherFoodPlaceName = '또 다른 맛집';
List titleTextKor = [
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

// main_ui.dart
List subTitleText = [
  "신입생",
  "신입생들을 위한 조언과 팁",

  "시간표",
  "시간표 짜는 방법 소개",

  "평점 : $rateFood",
  "평점 : $otherRateFood",

  "리뷰 : $reviewCount개",
  "리뷰 : $otherReviewCount개",
  "맛집 리뷰",
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

// main_ui.dart
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
  newReviewerName3,
  newReviewerName3,
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

// main_ui.dart
List reviewerText = [
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
  newReviewerText3,
  newReviewerText3,
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

// main_ui.dart
List titleTextEng = [
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

// main_ui.dart
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

// main_ui.dart
List reviewerNameEng = [
  newReviewerNameEng,
  newReviewerNameEng2,
  newReviewerNameEng3,
];
String newReviewerNameEng = 'Reviewer 1'; // 변수로 받아올 예정
String newReviewerNameEng2 = 'Reviewer 2'; // 변수로 받아올 예정
String newReviewerNameEng3 = 'Reviewer 3'; // 변수로 받아올 예정

// main_ui.dart
List reviewerTextEng = [
  newReviewerTextEng,
  newReviewerTextEng2,
  newReviewerTextEng3,
];
String newReviewerTextEng = 'Very nice'; // 변수로 받아올 예정
String newReviewerTextEng2 = 'Sometime good'; // 변수로 받아올 예정
String newReviewerTextEng3 = 'Simple'; // 변수로 받아올 예정
