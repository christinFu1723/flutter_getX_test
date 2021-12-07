import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';


class HomeViewTest extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, currentRoute) {
        //This router outlet handles the appbar and the bottom navigation bar
        final currentLocation = currentRoute?.location;

        print('查看嵌套路由内部：$currentLocation');
        var currentIndex = 0;
        if (currentLocation?.startsWith('/home/child/childTabbar') == true || currentLocation?.startsWith('/home/child') == true) {
          currentIndex = 0;
        }
        if (currentLocation?.startsWith('/home/child/childTabbar/test1') == true) {
          currentIndex = 0;
        }
        if (currentLocation?.startsWith('/home/child/childTabbar/test2') == true) {
          currentIndex = 1;
        }
        return Scaffold(
          body: GetRouterOutlet(
            initialRoute: '/home/child/childTabbar/test1',
            // anchorRoute: Routes.HOME,
            // key: Get.nestedKey('sec:$currentLocation'),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              switch (value) {
                case 0:
                  delegate.toNamed('/home/child/childTabbar/test1');
                  break;
                case 1:
                  delegate.toNamed('/home/child/childTabbar/test2');
                  break;

                default:
              }
            },
            items: [
              // _Paths.HOME + [Empty]
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '测试嵌套路由1',
              ),
              // _Paths.HOME + Routes.PROFILE
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box_rounded),
                label: '测试嵌套路由2',
              ),
              // _Paths.HOME + _Paths.PRODUCTS

            ],
          ),
        );
      },
    );
  }
}
