import 'dart:html';
import 'package:flutter/material.dart';

class BoardMain extends StatefulWidget {
  const BoardMain({super.key});

  @override
  State<BoardMain> createState() => _BoardMainState();
}

class _BoardMainState extends State<BoardMain> with TickerProviderStateMixin {
  late TabController tabController;

  // TitleText로 변경해야함
  List catName = [
    "학교 행사",
    '가천길잡이 업데이트 일정',
    '서비스 이용 안내',
    '이벤트 1',
    '이벤트 2',
    '이벤트 이용 안내',
    '새로운 이벤트 안내',
    '시스템 업그레이드 안내',
    '가천길잡이 이용 안내',
  ];

  // SubTitleText로 변경해야함
  List catNames2 = [
    "2021년 10월 이번트",
    '서비스 중단 예정',
    '새로운 기능 추가',
  ];

  final _valueList = [
    '컴퓨터공학과',
    '소프트웨어학과',
    '스마트보안학과'
  ];
  var _selectedValue = '컴퓨터공학과';

  List<Color> catColors = [
    Color(0xFFFFCF2F),
    Color(0xFF6FE08D),
  ];

  List<Icon> catIcons = [
    Icon(Icons.category, color: Colors.white, size: 30),
    Icon(Icons.video_library, color: Colors.white, size: 30),
    Icon(Icons.video_library, color: Colors.white, size: 30),
  ];

  final screens = [

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
        length: 2,
        vsync: this
    );
  }

  Widget _partNoticeHeader() {
    return Column(
      children: [
        SizedBox(
          width: 20,
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text(
                '공지사항',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
            ],
          ),
        ),
        Divider(
            color: Colors.grey[40],
            thickness: 1.0
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }

  Widget _partSchoolEvent() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: catColors[0],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: catIcons[0],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        catNames2[0],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '임시 설명입니다.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width-300,
                child: Text(
                    'End',
                    textAlign: TextAlign.end
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
          width: 20,
        ),
        Divider(
            color: Colors.grey[40],
            thickness: 1.0
        ),
      ],
    );
  }

  Widget _partGachonGilUpdate() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: catColors[0],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: catIcons[0],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        catNames2[0],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '임시 설명입니다.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width-300,
                child: Text(
                    'End',
                    textAlign: TextAlign.end
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
          width: 20,
        ),
        Divider(
            color: Colors.grey[40],
            thickness: 1.0
        ),
      ],
    );
  }

  Widget _partServiceUseNotice() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: catColors[0],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: catIcons[0],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        catNames2[0],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '임시 설명입니다.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width-300,
                child: Text(
                    'End',
                    textAlign: TextAlign.end
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
          width: 20,
        ),
        Divider(
            color: Colors.grey[40],
            thickness: 1.0
        ),
      ],
    );
  }

  Widget _partEvent1() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: catColors[0],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: catIcons[0],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        catNames2[0],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '임시 설명입니다.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width-300,
                child: Text(
                    'End',
                    textAlign: TextAlign.end
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
          width: 20,
        ),
        Divider(
            color: Colors.grey[40],
            thickness: 1.0
        ),
      ],
    );
  }

  Widget _partEvent2() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: catColors[0],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: catIcons[0],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        catNames2[0],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '임시 설명입니다.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width-300,
                child: Text(
                    'End',
                    textAlign: TextAlign.end
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
          width: 20,
        ),
        Divider(
            color: Colors.grey[40],
            thickness: 1.0
        ),
      ],
    );
  }

  Widget _partEvent3() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: catColors[0],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: catIcons[0],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        catNames2[0],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '임시 설명입니다.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width-300,
                child: Text(
                    'End',
                    textAlign: TextAlign.end
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
          width: 20,
        ),
        Divider(
            color: Colors.grey[40],
            thickness: 1.0
        ),
      ],
    );
  }

  Widget _partNewEventNotice() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: catColors[0],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: catIcons[0],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        catNames2[0],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '임시 설명입니다.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width-300,
                child: Text(
                    'End',
                    textAlign: TextAlign.end
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
          width: 20,
        ),
        Divider(
            color: Colors.grey[40],
            thickness: 1.0
        ),
      ],
    );
  }

  Widget _partSystemUpgradeNotice() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: catColors[0],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: catIcons[0],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        catNames2[0],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '임시 설명입니다.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width-300,
                child: Text(
                    'End',
                    textAlign: TextAlign.end
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
          width: 20,
        ),
        Divider(
            color: Colors.grey[40],
            thickness: 1.0
        ),
      ],
    );
  }

  Widget _partServiceUseNotice2() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: catColors[0],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: catIcons[0],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        catNames2[0],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '임시 설명입니다.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width-300,
                child: Text(
                    'End',
                    textAlign: TextAlign.end
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
          width: 20,
        ),
        Divider(
            color: Colors.grey[40],
            thickness: 1.0
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _partNoticeHeader(),
            Container(
              child: Column(
                children: [
                  // listview인가 그걸로 반복해서 깔끔하게 제작하기
                  Text('공지사항 목록'),
                  //
                  _partSchoolEvent(),

                  //
                  _partGachonGilUpdate(),

                  //
                  _partServiceUseNotice(),

                  // 학과 선택 버튼 구현 예정
                  DropdownButton(
                    value: _selectedValue,
                    items: _valueList.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                  /*
                  // 왜 오류나지
                  DropdownButton(
                    value: _selectedValue,
                      items: _valueList.map(
                          (value) => {
                            return DropdownMenuItem (
                          value: value,
                        child: Text(value),
                      );
                    }
                  ).toList(),
                  onChanged: (value) {
                      setState(() {
                        _selectedValue = value;
                      });
                  }
                  ),
                  */
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),

                  _partEvent1(),

                  _partEvent2(),

                  _partEvent3(),

                  SizedBox(
                    height: 20,
                    width: 20,
                  ),

                  Text('공지사항 목록'),

                  _partNewEventNotice(),

                  _partSystemUpgradeNotice(),

                  _partServiceUseNotice2(),
                ],
              ),
            ),
            SizedBox(
              height: 20,
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}