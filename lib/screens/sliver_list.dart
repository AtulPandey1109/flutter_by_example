import 'package:flutter/material.dart';
import 'package:my_login_app/screens/login.dart';
import 'package:my_login_app/utils/string_constants.dart';
class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
final _kFontFamily ='Arial' ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back)),
          title: const Text("SliverList Example"),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    StringConstants.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: _kFontFamily,
                    ),
                  ),
                ),
                IconButton(icon: const Icon(Icons.search), onPressed: () {}),
              ],
            ),
            SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomScrollView(
                  scrollDirection: Axis.horizontal,
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: index == 0
                                    ? const CircleAvatar(
                                        backgroundColor: Colors.black26,
                                        child: Icon(Icons.add))
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(360),
                                        child: Image.asset(
                                          'images/pic$index.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ),
                            ),
                            Text(index == 0 ? 'Add Story':StringConstants.names[index],style: TextStyle(fontFamily: _kFontFamily),)
                          ],
                        );
                      }, childCount: 11),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Chats',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {
                    debugPrint('more');
                  },
                ),
              ],
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return ListTile(
                        leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: index == 0
                              ? const CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'images/pic10.png',
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'images/pic$index.png',
                                  ),
                                ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(StringConstants.names[index],style: TextStyle(fontFamily: _kFontFamily),),
                            Text(
                              StringConstants.chatSubTitle[index],
                              overflow:TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 12,fontFamily: _kFontFamily),
                            )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            Text(
                                '${DateTime.now().minute}:${DateTime.now().second}'),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: index == 0 || index ==1
                                  ? CircleAvatar(
                                    radius: 8,
                                backgroundColor: Colors.white24,
                                    child: Text(
                                        '2',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          fontFamily: _kFontFamily
                                        ),
                                      ),
                                  )
                                  : null,
                            ),
                          ],
                        ),
                      );
                    }, childCount: 10),
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
            destinations: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            icon: const Icon(
              Icons.home,
              size: 30,
            ),
          ),
          TextButton(

            onPressed: () {
              debugPrint("New Chat");
            },
            style: TextButton.styleFrom(
                backgroundColor: Colors.black87, foregroundColor: Colors.white),
            child: const Text("+ New Chat"),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            icon: const Icon(
              Icons.person,
              size: 30,
            ),
          ),
        ]),
      ),
    );
  }
}
