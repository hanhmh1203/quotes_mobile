import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../fav/favourite_screen.dart';
import '../setting/setting_screen.dart';
import '../start/start_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Hàm này tạo danh sách các màn hình sẽ được hiển thị khi nhấn vào các mục của thanh điều hướng
    List<Widget> _buildScreens() {
      return [
        const StartScreen(),
        const SettingScreen(),
        const FavouriteScreen(),
      ];
    }

    // Hàm này tạo danh sách các mục của thanh điều hướng
    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home), // Biểu tượng của mục
          title: ("Home"), // Tiêu đề của mục
          activeColorPrimary: Colors.blue, // Màu khi mục được chọn
          inactiveColorPrimary: Colors.grey, // Màu khi mục không được chọn
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.favorite_border_rounded),
          title: ("Favorite"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),

        PersistentBottomNavBarItem(
          icon: const Icon(Icons.settings),
          title: ("Settings"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        // PersistentBottomNavBarItem(
        //   icon: const Icon(Icons.settings_outlined),
        //   title: ("Setting"),
        //   activeColorPrimary: Colors.blue,
        //   inactiveColorPrimary: Colors.grey,
        // ),
      ];
    }

    // Tạo bộ điều khiển cho thanh điều hướng với chỉ số ban đầu là 0
    PersistentTabController _controller =
        PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      // Truyền danh sách các màn hình vào thanh điều hướng
      items: _navBarsItems(),
      // Truyền danh sách các mục vào thanh điều hướng
      handleAndroidBackButtonPress: true,
      // Mặc định là true, xử lý nút quay lại trên Android
      resizeToAvoidBottomInset: true,
      // Mặc định là true, điều chỉnh kích thước khi bàn phím xuất hiện
      stateManagement: true,
      // Mặc định là true, quản lý trạng thái
      hideNavigationBarWhenKeyboardAppears: true,
      // Ẩn thanh điều hướng khi bàn phím xuất hiện
      padding: const EdgeInsets.only(top: 8),
      // Đệm trên cho thanh điều hướng
      backgroundColor: Colors.white,
      // Màu nền của thanh điều hướng
      isVisible: true,
      // Thanh điều hướng có hiển thị hay không
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400), // Thời gian cho hoạt ảnh
          curve: Curves.ease, // Đường cong hoạt ảnh
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          // Có chuyển động khi chuyển đổi tab không
          duration: Duration(milliseconds: 250),
          // Thời gian cho hoạt ảnh chuyển đổi
          screenTransitionAnimationType:
              ScreenTransitionAnimationType.slide, // Loại hoạt ảnh chuyển đổi
        ),
      ),
      confineToSafeArea: true,
      // Giới hạn trong khu vực an toàn của màn hình
      navBarHeight: kBottomNavigationBarHeight,
      // Chiều cao của thanh điều hướng
      navBarStyle: NavBarStyle.style1, // Kiểu của thanh điều hướng
    );
  }
}
