import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              // collapseMode: CollapseMode.parallax,
              expandedTitleScale: 2,
              title:const Text('Your Profile',
                  style: TextStyle(
                    // backgroundColor: Colors.white,
                    // decorationColor: Colors.amber,
                      color: Colors.black, fontWeight: FontWeight.w900)),
              background: Image.asset(
                'assets\\images\\burger-pixel-art_4x.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ), 
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Orders and stuff $index'),
                    ],
                  ),
                );
              },
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}
