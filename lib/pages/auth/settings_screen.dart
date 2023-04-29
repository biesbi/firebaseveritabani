import 'package:flutter/material.dart';
import 'package:flutter_samet_aydin/pages/auth/maps_page.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_samet_aydin/widgets/settings_tile.dart';

class SettingsScreenPage1 extends StatefulWidget {
  const SettingsScreenPage1({Key? key}) : super(key: key);

  @override
  State<SettingsScreenPage1> createState() => _SettingsScreenPage1State();
}

class _SettingsScreenPage1State extends State<SettingsScreenPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Ayarlar",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              SettingsTile(
                color: Colors.blue,
                icon: Ionicons.pencil_outline,
                title: "Kullancı Adı Güncelleme",
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 40,
              ),
              SettingsTile(
                color: Colors.black,
                icon: Ionicons.moon_outline,
                title: "Tema",
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              SettingsTile(
                color: Color.fromARGB(255, 171, 50, 192),
                icon: Ionicons.person_add,
                title: "Avatar Değiştirme",
                onTap: () {},
              ),
              const SizedBox(
                height: 40,
              ),
              SettingsTile(
                color: Color.fromARGB(255, 255, 145, 137),
                icon: Ionicons.log_out_outline,
                title: "Geri Dön",
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Maps())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
