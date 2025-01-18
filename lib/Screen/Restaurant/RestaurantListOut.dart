import 'package:flutter/material.dart';
import 'package:kksc_app_fe/util/text_styles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kksc_app_fe/util/color_theme.dart';

class RestaurantOutView extends StatefulWidget {
  const RestaurantOutView({super.key});

  @override
  State<RestaurantOutView> createState() => _RestaurantOutViewState();
}

class _RestaurantOutViewState extends State<RestaurantOutView> {
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              print("이전 화면이 없습니다.");
            }
          },
        ),
        title: Text("학교 외부식당", style: textTheme.headlineMedium),
        actions: [
          SizedBox(
            width: 25,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: const RestaurantListOutScreen(),
    );
  }
}

class RestaurantListOutScreen extends StatefulWidget {
  const RestaurantListOutScreen({super.key});

  @override
  State<RestaurantListOutScreen> createState() =>
      _RestaurantListOutScreenState();
}

class _RestaurantListOutScreenState extends State<RestaurantListOutScreen> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  LatLng? selectedLatLng;

  final List<Map<String, dynamic>> markerLocations = [
    {
      'id': 'restaurant_1',
      'position': const LatLng(37.453537, 127.127274),
      'title': '화로상회',
      'rating': '4.5',
      'userReview': '279',
      'address': '경기도 성남시 수정구 복정동 번지 1층 714-2',
      'imageUrls': [
        'assets/img/chinaSpoonExample1.png',
        'assets/img/chinaSpoonExample2.png'
      ],
    },
    {
      'id': 'restaurant_2',
      'position': const LatLng(37.457057, 127.126873),
      'title': '스타동',
      'rating': '3.9',
      'userReview': '12',
      'address': ' 경기도 성남시 수정구 복정동 689-5번지 KR 1층',
      'imageUrls': [
        'assets/img/chinaSpoonExample4.png',
        'assets/img/chinaSpoonExample2.png',
        'assets/img/chinaSpoonExample1.png',
        'assets/img/chinaSpoonExample2.png',
        'assets/img/chinaSpoonExample1.png',
        'assets/img/chinaSpoonExample2.png',
        'assets/img/chinaSpoonExample1.png',
        'assets/img/chinaSpoonExample2.png'
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    markers = markerLocations
        .map((location) => Marker(
              markerId: MarkerId(location['id']),
              position: location['position'],
              onTap: () {
                showRestaurantModal(location['position']);
                mapController?.showMarkerInfoWindow(MarkerId(location['id']));
              },
            ))
        .toSet();
  }

  void showRestaurantModal(LatLng latLng) {
    selectedLatLng = latLng;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(top: 16.0, right: 30, left: 30),
          height: MediaQuery.of(context).size.height * 0.4,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '식당 목록',
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                for (var location in markerLocations
                    .where((loc) => loc['position'] == selectedLatLng))
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          location['title'],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.star, color: Colors.amber),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(color: Colors.black),
                                children: [
                                  const TextSpan(text: '리뷰 '),
                                  TextSpan(
                                    text: '${location['rating']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const TextSpan(text: '   '),
                                  const TextSpan(text: '사용자 리뷰 '),
                                  TextSpan(
                                    text: '${location['userReview']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        if ((location['imageUrls'] ?? []).isEmpty)
                          Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey[300],
                            child: const Center(child: Text('Img')),
                          )
                        else
                          Container(
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ...((location['imageUrls'] ?? [])
                                    .take(3)
                                    .map<Widget>(
                                  (url) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      child: url is String && url.isNotEmpty
                                          ? Image.asset(
                                              url,
                                              width: 84,
                                              height: 84,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Container(
                                                  width: 84,
                                                  height: 84,
                                                  color: Colors.grey[200],
                                                  child: const Center(
                                                    child: Text(
                                                      "Load Failed",
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            )
                                          : Container(
                                              width: 84,
                                              height: 84,
                                              color: Colors.grey[200],
                                              child: const Center(
                                                child: Text(
                                                  "No Image",
                                                  style: TextStyle(
                                                    color: Color(0xFF757575),
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                    );
                                  },
                                ).toList()),
                                if ((location['imageUrls'] ?? []).length > 3)
                                  Container(child: Text('  더보기')),
                              ],
                            ),
                          ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.location_on,
                                color: Color(0xFFD31C1F)),
                            Flexible(
                              child: Text(
                                location['address'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                softWrap: true,
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 16),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('닫기'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '내부 식당',
                style: textTheme.titleLarge,
              )),
        ),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                RestaurantButton(name: '제순식당'),
                const SizedBox(width: 10),
                RestaurantButton(name: '치미치미'),
                const SizedBox(width: 10),
                RestaurantButton(name: '신역혼점'),
                const SizedBox(width: 10),
                RestaurantButton(name: '차이니스트'),
                const SizedBox(width: 10),
                RestaurantButton(name: '신의한컵'),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.only(top: 70, left: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "지도로 확인하기",
                  style: textTheme.titleLarge,
                  textAlign: TextAlign.left,
                ),
                Container(
                  height: 300,
                  padding: const EdgeInsets.only(top: 16, right: 16),
                  width: double.infinity,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    myLocationButtonEnabled: false,
                    myLocationEnabled: false,
                    markers: markers,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(37.4507128, 127.1283560),
                      zoom: 14.3,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                    },
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class RestaurantButton extends StatelessWidget {
  final String name;
  const RestaurantButton({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 30,
            child: const Icon(
              Icons.restaurant,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
