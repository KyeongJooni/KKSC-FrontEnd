// Album 클래스는 앨범 정보를 표현하는 모델 클래스입니다.
// 이 클래스는 서버에서 받은 JSON 데이터를 기반으로 앨범 객체를 생성하는 데 사용됩니다.
class Album {
  // 앨범의 고유 ID를 저장하는 변수
  final int id;

  // 앨범의 제목을 저장하는 변수
  final String title;

  // 생성자: `id`와 `title`을 반드시 받아서 `Album` 객체를 생성합니다.
  // `required` 키워드는 이 필드들이 필수로 전달되어야 함을 의미합니다.
  const Album({required this.id, required this.title});

  // 팩토리 생성자: JSON 데이터를 받아서 `Album` 객체로 변환합니다.
  // 서버에서 받아온 JSON 데이터를 기반으로 Album 객체를 생성합니다.
  // `json`은 Map<String, dynamic> 타입의 데이터로, 서버에서 받은 JSON 데이터를 나타냅니다.
  factory Album.fromJson(Map<String, dynamic> json) {
    // `json['id']`와 `json['title']`에서 각각 `id`와 `title` 값을 추출하여,
    // 새로운 `Album` 객체를 반환합니다.
    // 반환된 객체는 `id`와 `title` 속성을 갖습니다.
    return Album(
      id: json['id'],        // 서버에서 받은 `id`를 `Album` 객체의 `id`로 설정
      title: json['title'],  // 서버에서 받은 `title`을 `Album` 객체의 `title`로 설정
    );
  }
}
