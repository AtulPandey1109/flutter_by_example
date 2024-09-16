import 'package:flutter/material.dart';
import 'package:my_login_app/message_service.dart';
import 'package:my_login_app/utils/constants.dart';
import '../model/topics.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const TextStyle myTextStyle = TextStyle(
      fontFamily: 'Montserrat',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      color: Color(0xff603F26),
      fontSize: 16);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MessagingService().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Flutter By Example",
            style: TextStyle(
                fontFamily: 'arial',
                color: ColorConstants.textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )),
          backgroundColor: ColorConstants.appBarColor,
        ),
        body: ListView.builder(
          physics: const ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final topics = Topics.getDetails();
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: ListTile(
                  titleTextStyle: HomeScreen.myTextStyle,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  leading: CircleAvatar(
                    radius: 18,
                    backgroundColor: ColorConstants
                        .circularAvatarBackgroundColor, // Orange color
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: ColorConstants.textColor,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  title: Text(
                    topics[index].title,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      color: ColorConstants.textColor,
                    ),
                  ),
                  tileColor: ColorConstants.tileColor,
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: ColorConstants.textColor,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, topics[index].route);
                    },
                  ),
                  subtitle: const Text(
                    "Tap for more detail",
                    style: TextStyle(color: ColorConstants.textColor, fontFamily: 'Montserrat',fontWeight: FontWeight.w200),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, topics[index].route);
                  },
                ),
              );
            },
            itemCount: Topics.getDetails().length),
      ),
    );
  }
}
