
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
   ];
}
}