import 'package:flutter/material.dart';

class Signuppage extends StatefulWidget{
  const Signuppage({Key? key}): super(key: key);

  @override
  State<Signuppage> createState() => _Signuppage();
}

class _Signuppage extends State<Signuppage>{
  final PageController signupPageController = PageController();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController uniNumController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: PageView(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              controller: signupPageController,
              onPageChanged: (index){
                setState(() {
                  _currentPage = index;
                });
              },
              children: [

              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget InputCard ({
  required String step,
  required String title,
  required String label,
  required TextEditingController controller,
}) {
  return Container(
    child: Column(
      children: [
        Text(step),
        Text(title),

        Row(
          children: [
            Container(
              width: 80,
              child: FilledButton(onPressed: (){}, child: Text('이전')),
            ),
            Container(
              width: 80,
              child: FilledButton(onPressed: (){}, child: Text('다음')),
            ),
          ],
        )
      ],
    ),
  );
}