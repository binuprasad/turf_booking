import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_tickets/constant/color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../auth/login_home/view/login_page.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: ListView(
          children: [
            BigUserCard(
              cardColor: green,
              userName: 'Binu',
              userProfilePic: const AssetImage('assets/image/grass.jpg'),
              cardActionWidget: SettingsItem(
                icons: Icons.edit,
                iconStyle: IconStyle(
                  borderRadius: 50,
                  backgroundColor: Colors.yellow[600],
                ),
                title: "Update",
                titleStyle: const TextStyle(color: green),
                subtitle: "Tap to change your data",
                onTap: () {
                  if (kDebugMode) {
                    print("OK");
                  }
                },
              ),
            ),
            SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  onTap: () async {
                    
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.remove('token');
                    Get.offAll(() => LoginPage());
                  },
                  icons: Icons.exit_to_app_rounded,
                  titleStyle: const TextStyle(color: green),
                  title: "Sign Out",
                  subtitle: 'See You Later',
                  iconStyle: IconStyle(backgroundColor: red),
                ),
              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                    onTap: () {},
                    icons: CupertinoIcons.pencil_outline,
                    iconStyle: IconStyle(),
                    title: 'Privacy Policy',
                    subtitle: "© 2022 All Rights Reserved",
                    titleStyle: const TextStyle(color: green)),
              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'About',
                  titleStyle: const TextStyle(color: green),
                  subtitle: "Learn more about Estadio App",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
