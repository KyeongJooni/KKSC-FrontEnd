import 'package:flutter/material.dart';

class Notice extends StatefulWidget {
  const Notice({super.key});

  @override
  State<Notice> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  String selectedDepartment = '경영학부'; // 초기 값: 경영학부

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '공지사항',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '공지사항 목록',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const NoticeSection(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '학과 공지사항 목록',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // 학과 선택 드롭다운
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedDepartment,
                items: const [
                  DropdownMenuItem(
                    value: '경영학부',
                    child: Text('경영학부'),
                  ),
                  DropdownMenuItem(
                    value: '빅데이터 경영학부',
                    child: Text('빅데이터 경영학부'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedDepartment = value!;
                  });
                },
              ),
            ),
            // 학과 공지사항 리스트
            DepartmentNoticeSection(selectedDepartment: selectedDepartment),
          ],
        ),
      ),
    );
  }
}

class NoticeSection extends StatelessWidget {
  const NoticeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> noticeList = [
      {
        "title": "학교 행사 ~~",
        "date": "2021년 10월 이벤트",
        "duration": "10월 1일 - 10월 15일",
      },
      {
        "title": "가천길잡이 업데이트 일정",
        "date": "서비스 공지사항",
        "duration": "지속적인 업데이트 중",
      },
      {
        "title": "서비스 이용 안내",
        "date": "새로운 기능 추가",
        "duration": "지속적인 업데이트 중",
      },
    ];

    return Column(
      children: noticeList.map((notice) {
        return Column(
          children: [
            ListTile(
              leading: const Icon(Icons.notifications),
              title: Row(
                children: [
                  Expanded(
                    child: Text(notice['title']!),
                  ),
                  Text(
                    notice['date']!,
                    textAlign: TextAlign.end,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              subtitle: Text(notice['duration']!),
              isThreeLine: true,
            ),
            const Divider(), // 구분선 추가
          ],
        );
      }).toList(),
    );
  }
}

class DepartmentNoticeSection extends StatelessWidget {
  final String selectedDepartment;

  const DepartmentNoticeSection({required this.selectedDepartment, super.key});

  @override
  Widget build(BuildContext context) {
    // 학과별 공지사항 데이터
    final Map<String, List<Map<String, String>>> departmentNoticeData = {
      '경영학부': [
        {
          "title": "경영학부 졸업 프로젝트 설명회",
          "date": "2024년 9월 15일",
          "duration": "오전 10시 - 12시",
        },
        {
          "title": "경영학부 학과 세미나 공지",
          "date": "2024년 10월 5일",
          "duration": "오후 2시 - 4시",
        },
      ],
      '빅데이터 경영학부': [
        {
          "title": "빅데이터 경영학부 졸업 프로젝트 설명회",
          "date": "2024년 9월 20일",
          "duration": "오전 10시 - 12시",
        },
        {
          "title": "빅데이터 경영학부 학과 세미나 공지",
          "date": "2024년 10월 10일",
          "duration": "오후 3시 - 5시",
        },
      ],
    };

    // 선택된 학과의 공지사항 리스트
    final notices = departmentNoticeData[selectedDepartment] ?? [];

    return Column(
      children: notices.map((notice) {
        return Column(
          children: [
            ListTile(
              leading: const Icon(Icons.school),
              title: Row(
                children: [
                  Expanded(
                    child: Text(notice['title']!),
                  ),
                  Text(
                    notice['date']!,
                    textAlign: TextAlign.end,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              subtitle: Text(notice['duration']!),
              isThreeLine: true,
            ),
            const Divider(), // 구분선 추가
          ],
        );
      }).toList(),
    );
  }
}
