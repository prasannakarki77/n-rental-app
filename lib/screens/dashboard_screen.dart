import 'package:flutter/material.dart';
import "package:curved_navigation_bar/curved_navigation_bar.dart";
import 'package:nrental/screens/home_screen.dart';
import 'package:nrental/screens/testScreen.dart';

import '../components/customShape.dart';

class DashboardScreem extends StatefulWidget {
  const DashboardScreem({Key? key}) : super(key: key);

  @override
  State<DashboardScreem> createState() => _DashboardScreemState();
}

class _DashboardScreemState extends State<DashboardScreem> {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 2;

  final screens = const [
    HomeScreen(),
    TestScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    const username = "Prasanna Karki";
    const email = "pkarki44@gmail.com";
    const profileImg =
        "https://i.pinimg.com/564x/4a/83/2c/4a832c89d14710986b9c85a3fed4e526--detective-avatar.jpg";

    final items = <Widget>[
      const Icon(
        Icons.person,
        size: 30,
      ),
      const Icon(
        Icons.search,
        size: 30,
      ),
      const Icon(
        Icons.home,
        size: 30,
      ),
      const Icon(
        Icons.bookmark_added_rounded,
        size: 30,
      ),
      const Icon(
        Icons.settings,
        size: 30,
      ),
    ];
    return SafeArea(
      child: Scaffold(
        // drawer: const NavDrawerWidget(),
        drawer: Drawer(
          child: Material(
            color: const Color.fromARGB(255, 77, 67, 65),
            child: ListView(
              children: [
                buildHeader(
                  profileImg: profileImg,
                  username: username,
                  email: email,
                ),
                Container(
                  padding: padding,
                  child: Column(
                    children: [
                      buildMenuItem(
                        text: "Home",
                        icon: Icons.home,
                        onClicked: () => setState(() {
                          Navigator.of(context).pop();
                          index = 2;
                        }),
                      ),
                      buildMenuItem(
                        text: "Search",
                        icon: Icons.search,
                        onClicked: () => setState(() {
                          Navigator.of(context).pop();
                          index = 1;
                        }),
                      ),
                      buildMenuItem(
                        text: "Profile",
                        icon: Icons.person,
                        onClicked: () => setState(() {
                          Navigator.of(context).pop();
                          index = 0;
                        }),
                      ),
                      buildMenuItem(
                        text: "Bookings",
                        icon: Icons.car_rental,
                        onClicked: () => setState(() {
                          Navigator.of(context).pop();
                          index = 3;
                        }),
                      ),
                      buildMenuItem(
                        text: "Favourites",
                        icon: Icons.bookmark_added,
                        onClicked: () => setState(() {
                          Navigator.of(context).pop();
                          index = 4;
                        }),
                      ),
                      const Divider(
                        color: Colors.white70,
                      ),
                      buildMenuItem(
                        text: "Settings",
                        icon: Icons.settings,
                        onClicked: () => setState(() {
                          Navigator.of(context).pop();
                          index = 5;
                        }),
                      ),
                      buildMenuItem(
                        text: "Logout",
                        icon: Icons.logout_outlined,
                        // onClicked: () => selectedItem(context, 6),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        // extendBody: true,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              // automaticallyImplyLeading: false,
              toolbarHeight: 125,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: ClipPath(
                clipper: CustomShape(),
                child: Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  color: const Color.fromRGBO(255, 114, 94, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        "assets/images/logo-sm.png",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
          body: screens[index],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
          child: CurvedNavigationBar(
            key: navigationKey,
            index: index,
            height: 60,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: const Color.fromRGBO(255, 114, 94, 1),
            color: Color.fromARGB(255, 77, 67, 65),
            items: items,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 500),
            onTap: (index) {
              setState(() {
                this.index = index;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget buildHeader({
    required String profileImg,
    required String username,
    required String email,
  }) =>
      Container(
        padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(profileImg),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text,
          style: const TextStyle(
            color: color,
            fontSize: 18,
          )),
      onTap: onClicked,
    );
  }

  // void selectedItem(BuildContext context, int index) {
  //   Navigator.of(context).pop();
  //   int navDrawerIndex;
  //   switch (index) {
  //     case 0:
  //       navDrawerIndex = 0;
  //       Navigator.pushNamed(context, "/dashboardScreen",
  //           arguments: navDrawerIndex);
  //       break;
  //     case 1:
  //       // navDrawerIndex = 1;
  //       setState(() {
  //         index = 1;
  //       });

  //       break;
  //   }
  // }
}
