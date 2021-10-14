import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_bloom_test_ui/screens/auth-services.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {

    final email = FirebaseAuth.instance.currentUser!.email;

    final name = 'Pratham Satnalika';
    final urlImage = 'https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png';

    final authService = Provider.of<AuthService>(context);

    return Drawer(
      child: Material(
        color: Colors.deepPurple.shade100,
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email.toString(), onClicked: () {  },
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: "Medicines",
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Water Tracker',
                    icon: Icons.favorite_border,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 8),
                  buildMenuItem(
                    text: 'Workflow',
                    icon: Icons.workspaces_outline,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 8),
                  buildMenuItem(
                    text: 'Updates',
                    icon: Icons.update,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 24),
                  Divider(color: Colors.white70),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Settings',
                    icon: Icons.settings,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  const SizedBox(height: 8),
                  buildMenuItem(
                    text: 'Notifications',
                    icon: Icons.notifications_outlined,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  const SizedBox(height: 8),
                  buildMenuItem(
                    text: 'Sign Out',
                    icon: Icons.power_settings_new_rounded,
                    onClicked: () async {
                      authService.signOut();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.deepPurple),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  // Widget buildSearchField() {
  //   final color = Colors.white;
  //
  //   return TextField(
  //     style: TextStyle(color: color),
  //     decoration: InputDecoration(
  //       contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  //       hintText: 'Search',
  //       hintStyle: TextStyle(color: color),
  //       prefixIcon: Icon(Icons.search, color: color),
  //       filled: true,
  //       fillColor: Colors.white12,
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5),
  //         borderSide: BorderSide(color: color.withOpacity(0.7)),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(5),
  //         borderSide: BorderSide(color: color.withOpacity(0.7)),
  //       ),
  //     ),
  //   );
  // }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.deepPurpleAccent;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => PeoplePage(),
        // ));
        break;
      case 1:
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => FavouritesPage(),
        // ));
        break;
    }
  }
}