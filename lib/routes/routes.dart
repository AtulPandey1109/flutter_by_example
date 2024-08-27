import 'package:flutter/material.dart';
import 'package:my_login_app/screens/bloc%20example/home/bloc_home_screen.dart';
import 'package:my_login_app/screens/bottom_tab_example.dart';
import 'package:my_login_app/screens/drawer_example.dart';
import 'package:my_login_app/screens/image_assets.dart';
import 'package:my_login_app/screens/gallery_image.dart';
import 'package:my_login_app/screens/home_screen.dart';
import 'package:my_login_app/screens/inheritedWidgets/demo_color_change_with_inherited.dart';
import 'package:my_login_app/screens/local_storage.dart';
import 'package:my_login_app/screens/my_dairy.dart';
import 'package:my_login_app/screens/navigation_with_data.dart';
import 'package:my_login_app/screens/slider_example.dart';
import 'package:my_login_app/screens/sliver_list.dart';
import 'package:my_login_app/screens/time_picker_example.dart';
import 'package:my_login_app/screens/todo_api.dart';
import 'package:my_login_app/screens/video.dart';
import 'package:my_login_app/utils/handle_login.dart';
import '../screens/grid.dart';
import '../screens/list_view.dart';
import '../screens/login.dart';

// class AppRoutes{
//   static const String formPage='/formPage';
//   static const String listPage='/listPage';
//   static const String gridPage='/gridPage';
//   static const String inheritedPage='/inheritedPage';
//   static const String imagePickerPage='/imagePickerPage';
//   static const String httpPage='/httpPage';
// }
// case AppRoutes.formPage:
// return MaterialPageRoute(builder: (_)=>const Login());
// case AppRoutes.formPage:
// return MaterialPageRoute(builder: (_)=>const Login());

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case '/listPage':
        return MaterialPageRoute(builder: (_) => const MyList());

      case '/formPage':
        return MaterialPageRoute(builder: (_) => const Login());

      case '/gridPage':
        return MaterialPageRoute(builder: (_) => const Grid());

      case '/imageAssets':
        return MaterialPageRoute(builder: (_) => const ImageAssets());

      case '/httpPage':
        return MaterialPageRoute(builder: (_) => const TodoApi());

      case '/imagePickerPage':
        return MaterialPageRoute(builder: (_) => const GalleryImage());

      case '/inheritedPage':
        return MaterialPageRoute(
            builder: (_) => const DemoColorChangeWithInherited());

      case '/sliverListPage':
        return MaterialPageRoute(builder: (_) => const ChatPage());

      case '/videoPage':
        return MaterialPageRoute(builder: (_) => const VideoExample());

      case '/navigationPage':
        return MaterialPageRoute(builder: (_) => const NavigationWithData());

      case '/appDrawerPage':
        return MaterialPageRoute(builder: (_) => const DrawerExample());

      case '/bottomSheetPage':
        return MaterialPageRoute(builder: (_) => const BottomTabExample());

      case '/sliderPage':
        return MaterialPageRoute(builder: (_) => const SliderExample());

      case '/timePickerPage':
        return MaterialPageRoute(builder: (_) => const TimePickerExample());

        case '/sharedPreferencePage':
        return MaterialPageRoute(builder: (_) => const HandleLogIn());

        case '/localStoragePage':
        return MaterialPageRoute(builder: (_) => const LocalStorage());

        case '/sqlDatabase':
        return MaterialPageRoute(builder: (_) => const MyDairy());

        case '/flutterBloc':
        return MaterialPageRoute(builder: (_) => const BlocHomeScreen());

      case '/newScreen':
        var formData = settings.arguments as Map<String, String>;
        return MaterialPageRoute(
            builder: (_) => NewScreen(
                  name: formData['name'].toString(),
                  dob: formData['dob'].toString(),
                ));

      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text("404"),
              ),
              body: const Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 200,
                  child: Text(
                    "Not Found",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          );
        });
    }
  }
}
