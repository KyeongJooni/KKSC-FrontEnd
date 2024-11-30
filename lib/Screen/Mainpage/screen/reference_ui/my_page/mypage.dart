import 'package:flutter/material.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/reference_ui/login_ui/login_page.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/ui/main_ui/main_ui.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with TickerProviderStateMixin {
  late TabController tabController;

  List catNames = [
    "아이디 변경",
    'Edit Information',
  ];

  List catNames2 = [
    "프로필 사진 변경",
    '회원정보수정',
  ];

  List<Color> catColors = [
    Color(0xFFFFCF2F),
    Color(0xFF6FE08D),
  ];

  List<Icon> catIcons = [
    Icon(Icons.category, color: Colors.white, size: 30),
    Icon(Icons.video_library, color: Colors.white, size: 30),
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

  Widget _imformation() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),

              /*
              Image(
                  image: image
              ),
              */

              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Student Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Student ID : 12345',
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menu() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 7,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  color: const Color(0xffdedede),
                ),
              ),
              child: const Text(
                '학생증 보기',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          // 로그인
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
            child: Text("로그인"),
          ),
          // 로그아웃
          Container(
            padding: const EdgeInsets.all(
              4,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color: const Color(0xffdedede),
              ),
              color: Colors.blue,
            ),
            child:
            Text(
              '로그아웃',
              style: TextStyle(
                color: Colors.white60,
              ),
            ),
            /*
            ImageData(
              IconsPath.addFriend,
            ),
            */
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 20,
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.arrow_back_ios),
                      ),
                    ],
                  ),
                  Text(
                    'My Page',
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
              height: 20,
            ),
            _imformation(),
            _menu(),
            const SizedBox(
              height: 20,
            ),

            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                    child: Row(
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
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: catColors[1],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: catIcons[1],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              catNames2[1],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
              width: 20,
            ),

            GridView.builder(
              itemCount: 2,
              // Grid에 표시할 항목의 개수를 imgList의 길이로 설정
              shrinkWrap: true,
              // ListView나 GridView의 크기를 내부 항목에 맞게 축소 (스크롤뷰 내부에서 사용 시 필요)
              physics: NeverScrollableScrollPhysics(),
              // 스크롤 기능 비활성화 (외부 스크롤뷰에서만 스크롤되도록 설정)
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // 각 행에 표시될 항목의 개수 (2개의 열로 설정)
                childAspectRatio:
                (MediaQuery.of(context).size.height - 50 - 25) /
                    (4 * 240),
                // 항목의 가로와 세로 비율 조정 (화면 크기에 따라 자동 계산)
                mainAxisSpacing: 10,
                // 항목 간의 세로 간격 (열 사이)
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                // 코스 아이템 클릭 시 상세 페이지로 이동
                return InkWell(
                  onTap: () {
                    /*
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CourseScreen(imgList[index]),
                        )
                    );
                    */
                  },
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFF5F3FF),
                    ),
                    child: Column(
                      children: [
                        // 코스 이미지
                        Padding(
                          padding: EdgeInsets.all(10),
                          child:
                            Text(
                              "예시입니다.",
                            ),
                          /*
                          Image.asset(
                            "images/${imgList[index]}.png",
                            width: 100,
                            height: 100,
                          ),
                          */
                        ),
                        SizedBox(height: 10),
                        // 코스 이름
                        Text(
                          // imgList[index],
                          '임시입니다.',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                        SizedBox(height: 10),
                        // 코스 비디오 수 표시
                        Text(
                          "55 Videos",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}