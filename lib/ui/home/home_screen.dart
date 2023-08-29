import 'package:cgv_clone/ui/widgets/image_slider.dart';
import 'package:cgv_clone/ui/widgets/label_icon.dart';
import 'package:cgv_clone/ui/widgets/movie_chart.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> menuItems = [
      '홈',
      '이벤트',
      '무비톡',
      '패스트오더',
      '기프트샵',
      '@CGV',
    ];

    List<String> bannerUrlItems = [
      'assets/images/banner_01.jpeg',
      'assets/images/banner_02.jpeg',
      'assets/images/banner_03.jpeg',
      'assets/images/banner_04.jpeg',
    ];

    return DefaultTabController(
      length: menuItems.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'CGV',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.airplane_ticket_outlined,
              ),
              color: Colors.red,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.movie_outlined,
              ),
              color: Colors.red,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
              ),
              color: Colors.red,
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Container(
              color: Colors.red,
              child: TabBar(
                tabs: List.generate(
                  menuItems.length,
                  (index) => Tab(
                    text: menuItems[index],
                  ),
                ),
                unselectedLabelColor: Colors.white,
                labelColor: Colors.white,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                ImageSlider(bannerUrlItems: bannerUrlItems),
                const MovieChart(),
                const Divider(
                  thickness: 8,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LabelIcon(
                        icon: Icon(Icons.phone_android),
                        label: 'MY CGV',
                      ),
                      LabelIcon(
                        icon: Icon(Icons.photo),
                        label: '포토플레이',
                      ),
                      LabelIcon(
                        icon: Icon(Icons.account_balance_wallet),
                        label: '할인정보',
                      ),
                      LabelIcon(
                        icon: Icon(Icons.music_note),
                        label: 'CGV 스토어',
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Center(
              child: Text('event'),
            ),
            const Center(
              child: Text('movie talk'),
            ),
            const Center(
              child: Text('fast order'),
            ),
            const Center(
              child: Text('gift shop'),
            ),
            const Center(
              child: Text('@cgv'),
            ),
          ],
        ),
      ),
    );
  }
}
