import 'package:flutter/material.dart';

String IconStudent = 'assets/img/icon/bell.png';
String IconBell = 'assets/img/icon/bell.png';
String IconMegaphone = 'assets/img/icon/megaphone.png';
String IconPin = 'assets/img/icon/pin.png';
String IconPizza = 'assets/img/icon/pizza.png';

// part of main

//
double RateFood = 4.5;
double OtherRateFood = 4.0;

int ReviewCount = 100;
int OtherReviewCount = 80;

// 사용 용도 : drawer에 사용자 정보 표시
// 사용 장소 : main.dart

String Id = '김한성'; // 구현되면 매개변수로 받아야할듯
String Email = 'gkstjd6097@gmail.com';
String ImageURL = 'assets/img/icon/kksc_logo.jpg';

String FoodPlaceNameKor = '맛집 이름';
String OtherFoodPlaceNameKor = '또 다른 맛집'; // shift + f6 -> or alt + f7

String FoodPlaceNameEng = 'Good Food Place Name';
String OtherFoodPlaceNameEng = 'Another Food Place Name';

List TitleText = [
  "메인 화면",
  "재학생의 꿀팁",

  "가천대 학생들을 위한 꿀팁",
  "첫 학기 계획 세우기",
  "시간표 짜기 꿀팁",

  "학교 근처 맛집",

  FoodPlaceName,
  OtherFoodPlaceName,

  "맛집 리뷰"
];

String FoodPlaceName = '맛집 이름';
String OtherFoodPlaceName = '또 다른 맛집';

String ImageURL_AppBar = 'assets/img/icon/gachon_logo.png';

String VersionInnerText = '1.0.0';
String Version = 'Version: $VersionInnerText';

var isLanguage = true;
// true : 한국어
// false : 영어

List SubTitleText = [
  "신입생",
  "신입생들을 위한 조언과 팁",

  "시간표",
  "시간표 짜는 방법 소개",

  "평점 : $RateFood",
  "평점 : $OtherRateFood",

  "리뷰 : $ReviewCount개",
  "리뷰 : $OtherReviewCount개",

  "맛집 리뷰",
];

List TitleTextKor = [
  "메인 화면",
  "재학생의 꿀팁",

  "가천대 학생들을 위한 꿀팁",
  "첫 학기 계획 세우기",
  "시간표 짜기 꿀팁",

  "학교 근처 맛집",

  FoodPlaceNameKor,
  OtherFoodPlaceNameKor,

  "맛집 리뷰"
];

List SubTitleTextKor = [
  "신입생",
  "신입생들을 위한 조언과 팁",

  "시간표",
  "시간표 짜는 방법 소개",

  "평점 : $RateFood",
  "평점 : $OtherRateFood",

  "리뷰 : $ReviewCount개",
  "리뷰 : $OtherReviewCount개",
];

List TitleTextEng = [
  "Main Screen",
  "Senior Tip",
  "Tip for Gachon Univ Students",
  "To Plan First Semester",
  "To Plan TimeTable",
  "Delicious Near The Gachon Univ",
  FoodPlaceNameEng,
  OtherFoodPlaceNameEng,

  "Delicious Food Review"
];

List SubTitleTextEng = [
  "Freshman",
  "Comments and Tips For Freshman",
  "TimeTable",
  "Introduction of Writing TimeTable",
  "rate : $RateFood",
  "rate : $OtherRateFood",
  "review : $ReviewCount",
  "review : $OtherReviewCount",
];

// part of review
String NewReviewerName = '맛집 리뷰어 1'; // 변수로 받아올 예정
String NewReviewerName2 = '맛집 리뷰어 2'; // 변수로 받아올 예정
String NewReviewerName3 = '맛집 리뷰어 3'; // 변수로 받아올 예정

String NewReviewerNameKor = '맛집 리뷰어 1'; // 변수로 받아올 예정
String NewReviewerNameKor2 = '맛집 리뷰어 2'; // 변수로 받아올 예정
String NewReviewerNameKor3 = '맛집 리뷰어 3'; // 변수로 받아올 예정

String NewReviewerNameEng = 'Food Reviewer 1'; // 변수로 받아올 예정
String NewReviewerNameEng2 = 'Food Reviewer 2'; // 변수로 받아올 예정
String NewReviewerNameEng3 = 'Food Reviewer 3'; // 변수로 받아올 예정

List ReviewerName = [
  NewReviewerName,
  NewReviewerName,
  NewReviewerName,
];

List ReviewerNameKor = [
  NewReviewerNameKor,
  NewReviewerNameKor2,
  NewReviewerNameKor3,
];

List ReviewerNameEng = [
  NewReviewerNameEng,
  NewReviewerNameEng2,
  NewReviewerNameEng3,
];

List ReviewerText = [
  NewReviewerText,
  NewReviewerText2,
  NewReviewerText3,
];

List ReviewerTextKor = [
  NewReviewerTextKor,
  NewReviewerTextKor2,
  NewReviewerTextKor3,
];

List ReviewerTextEng = [
  NewReviewerTextEng,
  NewReviewerTextEng2,
  NewReviewerTextEng3,
];

String NewReviewerText = '맛집 리뷰어 1'; // 변수로 받아올 예정
String NewReviewerText2 = '맛집 리뷰어 2'; // 변수로 받아올 예정
String NewReviewerText3 = '맛집 리뷰어 3'; // 변수로 받아올 예정

String NewReviewerTextKor = "매우 만족"; // 변수로 받아올 예정
String NewReviewerTextKor2 = "다소 만족"; // 변수로 받아올 예정
String NewReviewerTextKor3 = "보통"; // 변수로 받아올 예정

String NewReviewerTextEng = 'Very nice'; // 변수로 받아올 예정
String NewReviewerTextEng2 = 'Sometime good'; // 변수로 받아올 예정
String NewReviewerTextEng3 = 'Simple'; // 변수로 받아올 예정