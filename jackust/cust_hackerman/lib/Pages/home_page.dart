import 'package:cust_hackerman/Widgets/HomePageWidgets/SearchBox.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController _tabController; 

  final List<Tab> _tab = <Tab>[
    Tab(text: 'Sweet'),
    Tab(text: 'Sour'),
    Tab(text: 'Salt'),
    Tab(text: 'Bit'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController= TabController(initialIndex: 0, length: _tab.length, vsync: this);
  }

  @override
 void dispose() {
   _tabController.dispose();
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            slivers: [
          SliverAppBar(
            collapsedHeight: 100,
            automaticallyImplyLeading: false,
            iconTheme: IconThemeData(
              color: Colors.green,
            ),
            backgroundColor: Colors.blue,
            expandedHeight: MediaQuery.of(context).size.height / 2,
            pinned: true,
            floating: true,
            flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('hamburger.jpg'), fit: BoxFit.cover),
                ),
                child: SearchBox()),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyTabBarDelegate(
              child: TabBar(
                labelColor: Colors.black,
                controller: this._tabController,
                tabs: _tab,
              ),
            ),
          )
        ]));
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
