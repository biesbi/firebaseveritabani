import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_samet_aydin/pages/auth/bonus_page.dart';
import 'package:flutter_samet_aydin/pages/auth/entry/first_page.dart';
import 'package:flutter_samet_aydin/pages/auth/entry/login_page.dart';
import 'package:flutter_samet_aydin/pages/auth/settings_screen.dart';

import '../../store/app/app.state.dart';
import '../../store/auth/auth.state.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          StoreConnector<AppState, AuthState>(
            converter: (store) => store.state.auth,
            builder: (context, authState) {
              return UserAccountsDrawerHeader(
                accountName: Text(authState.user?.displayName ?? "..."),
                accountEmail: Text(authState.user?.email ?? "..."),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      'https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0B_J2cX8c7keoMO1cTxcMgXSYAgtAxr-3CA&usqp=CAU')),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Kazandığım Bonuslarım'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BonusPage())),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Yakınımdaki Bonuslar'),
            onTap: () => null,
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Ayarlar'),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SettingsScreenPage1())),
          ),
          ListTile(
            leading: Icon(Icons.verified_user_sharp),
            title: Text('Adım Sayar'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('Çıkış'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FirstPage())),
          ),
        ],
      ),
    );
  }
}
