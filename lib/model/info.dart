
class Information{
  final int id;
  final String title;
  final String route;

  Information({
    required this.id,
    required this.title,
    required this.route,
});
  static List<Information> getDetails(){
   return [
    Information(id:1,title: 'Form in Flutter',route: '/formPage'),
    Information(id:2,title: 'ListView',route: '/listPage'),
    Information(id:3,title: 'GridView',route: '/gridPage'),
    Information(id:4,title: 'Image Assets',route: '/imageAssets'),
    Information(id:5,title: 'Image Picker',route: '/imagePickerPage'),
    Information(id:6,title: 'Http',route: '/httpPage'),
    Information(id:7,title: 'SliverList',route: '/sliverListPage'),
    Information(id:8,title: 'Inherited Widgets',route: '/inheritedPage'),
   ];
}
}