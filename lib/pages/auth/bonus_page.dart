import 'package:flutter/material.dart';
import 'package:flutter_samet_aydin/pages/auth/maps_page.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_samet_aydin/widgets/settings_tile.dart';

class BonusPage extends StatefulWidget {
  const BonusPage({Key? key}) : super(key: key);

  @override
  State<BonusPage> createState() => _BonusPageState();
}

class _BonusPageState extends State<BonusPage> {
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
                "Kazandığım Bonus",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              SettingsTile(
                color: Color.fromARGB(255, 107, 33, 243),
                icon: Ionicons.balloon,
                title: "null kişisi 1.Bonusu elde etti",
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 40,
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
