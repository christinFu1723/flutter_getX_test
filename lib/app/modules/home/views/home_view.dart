import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, currentRoute) {
        //This router outlet handles the appbar and the bottom navigation bar
        final currentLocation = currentRoute?.location;
        print('查看$currentLocation');
        var currentIndex = 0;
        if (currentLocation?.startsWith(Routes.PRODUCTS) == true) {
          currentIndex = 2;
        }
        if (currentLocation?.startsWith(Routes.PROFILE) == true) {
          currentIndex = 1;
        }
        if (currentLocation?.startsWith('/home/child') == true) {
          currentIndex = 3;
        }
        print('查看$currentIndex');
        return Scaffold(
          body: GetRouterOutlet(
            initialRoute: Routes.DASHBOARD,
            // anchorRoute: Routes.HOME,

          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              switch (value) {
                case 0:
                  delegate.toNamed(Routes.HOME);
                  break;
                case 1:
                  delegate.toNamed(Routes.PROFILE);
                  break;
                case 2:
                  delegate.toNamed(Routes.PRODUCTS);
                  break;
                case 3:
                  print('查看111$currentLocation');
                  delegate.toNamed('/home/child');
                  break;
                default:
              }
            },
            items: [
              // _Paths.HOME + [Empty]
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Colors.blue),
              // _Paths.HOME + Routes.PROFILE
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_box_rounded),
                  label: 'Profile',
                  backgroundColor: Colors.blue),
              // _Paths.HOME + _Paths.PRODUCTS
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_box_rounded),
                  label: 'Products',
                  backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_box_rounded),
                  label: '测试嵌套路由',
                  backgroundColor: Colors.blue)
            ],
          ),
        );
      },
    );
  }
}
