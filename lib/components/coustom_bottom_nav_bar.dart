
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../enums.dart';

import '../screens/home_screen.dart';
import '../screens/profile/profile_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.home,
                    color: MenuState.home == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => HomeScreen()));
                  }),
              IconButton(
                  icon: Icon(
                    Icons.calendar_month,
                    color: MenuState.calendar == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () {
                 
                    // Navigator.pop(context);
                    //Navigator.push(context, MaterialPageRoute(builder: (builder)=>CalendarScreen(uniID: "uniID")));
                  }),
              IconButton(
                icon: Icon(
                  Icons.add_circle,
                  color: MenuState.bag == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                 
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Conversation.svg",
                  color: MenuState.orders == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  //Navigator.pop(context);
                  //Navigator.pushNamed(context, MyOrders.routeName);
                },
              ),
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/User Icon.svg",
                    color: MenuState.profile == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => ProfileScreen()),
                        (route) => false);
                  }),
            ],
          )),
    );
  }
}
