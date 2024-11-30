/*
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_kksc_gachon_gil_project_error_complete/ui/main_ui/foodinformation.dart';
import 'package:project_kksc_gachon_gil_project_error_complete/ui/variable/variable.dart';

// StateNotifier 정의
class StringListNotifier extends StateNotifier<List<String>> {
  StringListNotifier() : super([]);

  void addString(String newString) {
    state = [...state, newString];
  }
}

// StateNotifierProvider 정의
final strNotifierProvider =
StateNotifierProvider<StringListNotifier, List<String>>((ref) {
  return StringListNotifier();
});

// MyHomePage2 위젯 정의
class MyHomePage2 extends ConsumerWidget {
  const MyHomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> randomStrList = ref.watch(strNotifierProvider);

    return Row(
      children: [
        // 동적 리스트 생성
        Row(
          children: randomStrList.map(
            (e) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // FoodInformation(ReviewerName, ReviewerText),
                GestureDetector(
                  child: const Icon(Icons.remove),
                  onTap: () {
                    // 아이템 제거 로직
                    ref.read(strNotifierProvider.notifier).state =
                    List.from(randomStrList)..remove(e);
                  },
                ),
              ],
            ),
          ).toList(),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            /*
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Create'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                ref.read(strNotifierProvider.notifier).addString("");
              },
            ),
            */
          ],
        ),
      ],
    );
  }
}
*/