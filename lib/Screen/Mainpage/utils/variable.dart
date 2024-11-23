// 1. 이 부분 for문 구현 O －＞ ｆｏｒ문 구현은 안했고 그냥 뷰어 가능하게는 해서 나중에 추가 가능하게 해달라할 때 코딩은 해야함¡¡ （아마도）
// 2. 폰트 이슈 해결 O
// 3. 계획서나 카톡이나 영상 등등 기록한거 보면서 안한 부분 해결
// 주석 양식 통일!!

// + kksc 할 일 써놓은거 중 없는거 체크

// 3. 피그마 각자 다운하는 법 뭐지
// 4. 참고본 만들라고 한거 외부로 꺼내라고한거 꺼낼 때 트리 만들어야하나
// 5. 커밋 관련해서 할거 해놓기 ▲ (어느정도 함) 및 영상 내용 중요한거만 정리

import 'package:flutter/material.dart';
// part of main
double rate_food = 4.5;
double other_rate_food = 4.0;

int review_count = 100;
int other_review_count = 80;

String FoodPlaceName = '맛집 이름';
String OtherFoodPlaceName = '또 다른 맛집';

String FoodPlaceNameKor = '맛집 이름';
String OtherFoodPlaceNameKor = '또 다른 맛집';

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

List SubTitleText = [
  "신입생",
  "신입생들을 위한 조언과 팁",

  "시간표",
  "시간표 짜는 방법 소개",

  "평점 : $rate_food",
  "평점 : $other_rate_food",

  "리뷰 : $review_count개",
  "리뷰 : $other_review_count개",
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

  "평점 : $rate_food",
  "평점 : $other_rate_food",

  "리뷰 : $review_count개",
  "리뷰 : $other_review_count개",
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
  "rate : $rate_food",
  "rate : $other_rate_food",
  "review : $review_count",
  "review : $other_review_count",
];

String iconStudent = 'assets/images/icon/bell.png';
String iconBell = 'assets/images/icon/bell.png';
String iconMegaphone = 'assets/images/icon/megaphone.png';
String iconPin = 'assets/images/icon/pin.png';
String iconPizza = 'assets/images/icon/pizza.png';

// part of review
String NewReviewerName = ''; // 변수로 받아올 예정
String NewReviewerText = '';

List ReviewerName = [
  "맛집 리뷰어1",
  "맛집 리뷰어2",
  "맛집 리뷰어3",
];

List ReviewerText = [
  "매우 만족",
  "다소 만족",
  "보통",
  "불만족",
  "최악의 맛집",
];

// 그레이 색상
const greyColor1=Color(0xFFA7AFC0); // hintText 글자 색
const greyColor2=Color(0xFF98A1B4); // 글자 색
const greyColor3=Color(0xFFE0E4EB); // 버튼 배경색
const greyColor4=Color(0xFF6D7382); // style 버튼 글자 색
const greyColor5=Color(0xFFB6B6B6); // 휴지통 색
const greyColor6=Color(0xFFA4AEC2); // 바텀내비게이션 아이콘 색
const greyColor7=Color(0xFFD7DEED); // 채팅 리스트의 시간 글자 색

// 회색 글자
// 회색, 16px, 두꺼운 글자 : hintText 글꼴
const greyTextStyle1 = TextStyle(
  fontSize: 16,
  color: greyColor1,
  fontFamily: 'NotoSansKR',
  fontWeight: FontWeight.w700, // Bold
);

// 회색, 16px, 적당한 글자, 밑줄 : 아이디찾기, 비밀번호 찾기
const greyTextStyle2 = TextStyle(
  fontSize: 16,
  color: greyColor2,
  fontFamily: 'NotoSansKR',
  fontWeight: FontWeight.w500, // Medium
  decoration: TextDecoration.underline,
);

class Variable extends StatefulWidget {
  const Variable({super.key});

  @override
  State<Variable> createState() => _VariableState();
}

class _VariableState extends State<Variable> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}