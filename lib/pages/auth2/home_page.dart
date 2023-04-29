import 'home_data.dart';
import 'themes/app_theme.dart';
import 'widgets/dashboard/dashboard.dart';
import 'widgets/dashboard/dashboard_topbar.dart';
import 'widgets/dashboard/dashboard_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedNavIndex = 0;
  bool collapsedNav = false;
  final GlobalKey<XDashState> _dashKey = new GlobalKey<XDashState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).primaryBackgroudColor,
      body: XDash(
        key: _dashKey,
        topbar: XDashTopbar(
            leading: IconButton(
              onPressed: () {
                if (_dashKey != null) {
                  _dashKey.currentState!.openSidenav();
                }
              },
              icon: Icon(
                Icons.list_outlined,
                color: AppTheme.of(context).primaryIconColor,
              ),
            ),
            title: Text(
              "Restoran Paneli",
              style: AppTheme.of(context).styles.title2,
            ),
            tailing: []),
        sidenav: XDashSideNav(
            collapsePosition: SidenavCollapsePosition.bottomCenter,
            size: XDashSidenavSize(collaped: 80, normal: 180),
            onCollapse: () {
              setState(() {
                collapsedNav = !collapsedNav;
              });
            },
            selectedNavIndex: selectedNavIndex,
            collapsedNav: collapsedNav,
            data: sidebarData,
            onSelected: (i) {
              setState(() {
                selectedNavIndex = i;
              });
            }),
        body: sidebarData[selectedNavIndex].view,
      ),
    );
  }
}
