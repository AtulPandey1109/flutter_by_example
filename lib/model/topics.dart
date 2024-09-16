
class Topics{
  final int id;
  final String title;
  final String route;

  Topics({
    required this.id,
    required this.title,
    required this.route,
});
  static List<Topics> getDetails(){
   return [
    Topics(id:1,title: 'Form in Flutter',route: '/formPage'),
    Topics(id:2,title: 'ListView',route: '/listPage'),
    Topics(id:3,title: 'GridView',route: '/gridPage'),
    Topics(id:4,title: 'Image Assets',route: '/imageAssets'),
    Topics(id:5,title: 'Image Picker',route: '/imagePickerPage'),
    Topics(id:6,title: 'Http',route: '/httpPage'),
    Topics(id:7,title: 'SliverList',route: '/sliverListPage'),
    Topics(id:8,title: 'Inherited Widgets',route: '/inheritedPage'),
    Topics(id:9,title: 'Video Player',route: '/videoPage'),
    Topics(id:10,title: 'Navigation With Data',route: '/navigationPage'),
    Topics(id:11,title: 'AppDrawer Example',route: '/appDrawerPage'),
    Topics(id:12,title: 'BottomSheet Example',route: '/bottomSheetPage'),
    Topics(id:13,title: 'Slider Example',route: '/sliderPage'),
    Topics(id:14,title: 'Time Picker Example',route: '/timePickerPage'),
    Topics(id:15,title: 'Login With Shared Preferences',route: '/sharedPreferencePage'),
    Topics(id:16,title: 'Local Database',route: '/localDatabase'),
    Topics(id:17,title: 'Local Database using SqlLite',route: '/sqlDatabase'),
    Topics(id:18,title: 'Flutter BLoC',route: '/flutterBloc'),
    Topics(id:19,title: 'Flutter Staggered Grid View',route: '/staggeredView'),
    Topics(id:20,title: 'Timer Bloc',route: '/timerBloc'),
    Topics(id:21,title: 'Login Bloc',route: '/loginBloc'),
    Topics(id:22,title: 'Searchable List Using Bloc',route: '/searchableList'),
    Topics(id:23,title: 'GeoLocator example',route: '/geoPage'),
    Topics(id:24,title: 'Dio Example',route: '/dioPage'),
    Topics(id:25,title: 'Hive Example',route: '/hivePage'),
    Topics(id:26,title: 'Retrofit Example',route: '/retrofitPage'),
    Topics(id:27,title: 'ChangeNotifier Example',route: '/changeNotifier'),
    Topics(id:28,title: 'Providers Example',route: '/valueNotifier'),
    Topics(id:30,title: 'RiverPod Example',route: '/riverPod'),
    Topics(id:31,title: 'RxDart Example',route: '/rxdart'),
    Topics(id:32,title: 'GetX Example',route: '/getX'),
    Topics(id:33,title: 'GetX Login Form',route: '/getLoginForm'),
   ];
}
}