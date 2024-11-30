import 'package:flutter/material.dart';
import 'package:kksc_app_fe/Screen/Mypage/Mypage.dart';
import 'package:kksc_app_fe/Screen/Mainpage/variable.dart';

class GCG_TopAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final Function onLogoPressed; // 가천대 로고 클릭 시 호출할 콜백

  const GCG_TopAppbar({
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
            Row(
              children: [
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
