import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class GeoPage extends StatefulWidget {
  const GeoPage({super.key});

  @override
  State<GeoPage> createState() => _GeoPageState();
}

class _GeoPageState extends State<GeoPage> {
  final GeolocatorPlatform _geoLocatorPlatform = GeolocatorPlatform.instance;
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: '9SRBX_MlqJw',
    flags: const YoutubePlayerFlags(
      mute: false,
      autoPlay: true,
      disableDragSeek: false,
      loop: false,
      isLive: false,
      forceHD: false,
      enableCaption: true,
    ),
  );
  Position? position;
  @override
  void initState() {
    super.initState();
  }


  Future<void> _getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.whileInUse) {
        position = await _geoLocatorPlatform.getCurrentPosition(
            locationSettings:
                const LocationSettings(accuracy: LocationAccuracy.high));
        print(position);
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          children: [
            Text('position: $position'),
            TextButton(
                onPressed: () {
                  setState(() {
                    _getLocation();
                  });
                },
                child: const Text("Get Location")),
            Container(
              height: 400,
              child: YoutubePlayerBuilder(
                player: YoutubePlayer(controller: _controller),
                builder: (BuildContext, player) {
                  return ListView(
                    children: [
                      player
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
