import 'package:pondy/AuthScreens/sign_in/sign_in_screen.dart';
import 'package:pondy/Provider/provider.dart';
import 'package:pondy/components/coustom_bottom_nav_bar.dart';
import 'package:pondy/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
              onPressed: () async {
                await provider.logout();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (builder) => SignInScreen()),
                    (route) => false);
              },
              icon: Icon(Icons.logout)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
