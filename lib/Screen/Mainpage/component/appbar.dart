// lib/widgets/app_bar.dart
import 'package:flutter/material.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/Screen/reference_ui/my_page/mypage.dart';
import 'package:projecr_kksc_gachon_gil_project_recent_flutter_project/util/variable.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final String title;
  // final List<Widget>? actions;
  final Color backgroundColor;

  const CustomAppBar({
    Key? key,
    // required this.title,
    // this.actions,
    this.backgroundColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0, // 뭐하는거지
      title: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.popUntil(
                    context, (route) => route.isFirst
                ); // 첫번째 페이지까지 이전 페이지로 이동
              },
              // 가천대 로고 지정
              // ImageURL_AppBar 변수 사용
              child: Image(
                image: AssetImage(ImageURL_AppBar),
                // 가천대 로고 지정
                // 사이즈 안맞아서 변수로 바꾼 다음 이미지 링크도 전환 예정
                width: 100,
                height: 100,
                // fit: BoxFit.cover,
                // 이미지 또는 위젯을 컨테이너에 비율을 유지한 채로 잘 맞게 채우도록 조정할 때 사용하는 BoxFit 열거형 값으로 했으나 변경
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyPage(),
                        ),
                      );
                    },
                    icon: Icon(Icons.account_circle)
                ),
              ],
            ),
          ],
        ),
      ),
      centerTitle: true,
      // actions: ,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
