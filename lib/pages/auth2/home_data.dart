import 'package:flutter_samet_aydin/pages/auth2/widgets/exit.dart';
import 'package:flutter_samet_aydin/pages/auth2/widgets/form_screen.dart';

import 'widgets/realtime_screen.dart';
import 'widgets/settings_screen.dart';
import 'widgets/status_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

import 'themes/app_theme.dart';

class SideMenuConfig {
  SideMenuConfig({this.icon, required this.name, required this.view});
  final String name;
  final IconData? icon;
  final Widget view;
}

final sidebarData = [
  SideMenuConfig(
      name: "Statü", icon: Icons.stacked_bar_chart, view: StatusScreen()),
  SideMenuConfig(name: "Konum", icon: Icons.person, view: UsersScreen()),
  SideMenuConfig(name: "Kazanan", icon: Icons.bolt, view: RealtimeScreen()),
  SideMenuConfig(name: "Ayarlar", icon: Icons.settings, view: SettingsScreen()),
  SideMenuConfig(name: "Çıkış", icon: Icons.exit_to_app, view: ExitScreen())
];
