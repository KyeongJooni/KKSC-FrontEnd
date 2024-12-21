import 'package:flutter/material.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Mainpage/AlarmPage.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/Mypage/Mypage.dart';

class GCG_CustomTopAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final Function onLogoPressed; // 가천대 로고 클릭 시 호출할 콜백

  const GCG_CustomTopAppbar({
    Key? key,
    this.backgroundColor = Colors.blue,
    required this.onLogoPressed, // 콜백 함수 필수
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      title: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            /*
            TextButton(
              onPressed: () {
                onLogoPressed(); // 콜백 함수 호출
              },
              child: Image(
                image: AssetImage(ImageURL_AppBar),
                width: 100,
                height: 100,
              ),
            ),
            */
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlarmPageScreen(),
                        ),
                      );
                    },
                    icon: Icon(Icons.alarm),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyPageScreen(),
                      ),
                    );
                  },
                  icon: Icon(Icons.account_circle),
                ),
              ],
            ),
          ],
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
