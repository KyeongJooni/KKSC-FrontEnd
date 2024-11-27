import 'package:flutter/material.dart';

// 그레이 색상
const greyColor1=Color(0xFFA7AFC0);
const greyColor2=Color(0xFF98A1B4);
const greyColor3=Color(0xFFE0E4EB);
const greyColor4=Color(0xFF6D7382);
const greyColor5=Color(0xFFB6B6B6);
const greyColor6=Color(0xFFA4AEC2);
const greyColor7=Color(0xFFD7DEED);

// color : 사용해야할 색상 집어넣기, 안넣을시 검정색
// fontPath : "assets/fonts/[font name].ttf" 형식의 데이터가 들어감
// 안넣을 시 "assets/fonts/Roboto-Regular.ttf" (기본)

const String defaultFontsPath = "assets/fonts/Roboto-Regular.ttf";

TextStyle displayLarge
    ({Color colors = Colors.black, String fontPath = defaultFontsPath})
=> TextStyle(
  fontFamily: fontPath,
  color: colors,
  fontSize: 57,
  letterSpacing: -0.25,
  height: 64,
);

// 사용 시 style: displayLarge(), 이런 식으로 사용

final colorLightTheme = MaterialTheme.lightScheme();

// 사용 시

// 사용 용도 및 장소 :
const TextStyle3 = TextStyle(
  // fontSize: 16,
  // color: greyColor1,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w300, // Bold
);

// 사용 용도 및 장소 :
const TextStyle4 = TextStyle(
  // fontSize: 16,
  // color: greyColor2,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w400, // Medium
  // decoration: TextDecoration.underline,
);

// 사용 용도 및 장소 :
const TextStyleSub4 = TextStyle(
  fontSize: 16,
  // color: greyColor2,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w400, // Medium
  // decoration: TextDecoration.underline,
);

// 사용 용도 및 장소 :
const TextStyle5 = TextStyle(
  // fontSize: 16,
  // color: greyColor1,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w500, // Bold
);

// 사용 용도 및 장소 :
const TextStyleSub5 = TextStyle(
  // fontSize: 16,
  color: Colors.grey,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w500, // Bold
);

// 사용 용도 및 장소 :
const TextStyle6 = TextStyle(
  // fontSize: 16,
  // color: greyColor2,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w600, // Medium
  // decoration: TextDecoration.underline,
);

// 사용 용도 및 장소 :
const TextStyleMain6 = TextStyle(
  // fontSize: 16,
  // color: greyColor2,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w600, // Medium
  // decoration: TextDecoration.underline,
);

// 사용 용도 및 장소 :
const TextStyleRating6 = TextStyle(
  fontSize: 20,
  // color: greyColor2,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w600, // Medium
  // decoration: TextDecoration.underline,
);

// 사용 용도 및 장소 :
const TextStyleSub6 = TextStyle(
  fontSize: 18,
  // color: greyColor2,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w600, // Medium
  // decoration: TextDecoration.underline,
);

// 사용 용도 및 장소 :
const TextStyle7 = TextStyle(
  fontSize: 16,
  // color: greyColor1,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w700, // Bold
);

// 사용 용도 및 장소 :
const TextStyleMain7 = TextStyle(
  fontSize: 20,
  // color: greyColor1,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w700, // Bold
);

// 사용 용도 및 장소 :
const TextStyle8 = TextStyle(
  // fontSize: 16,
  // color: greyColor2,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w800, // Medium
  // decoration: TextDecoration.underline,
);

// 사용 용도 및 장소 :
const TextStyleMain8 = TextStyle(
  fontSize: 24,
  // color: greyColor1,
  fontFamily: 'Pretendard',
  fontWeight: FontWeight.w800, // Bold
);