import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';



class GeoPage extends StatefulWidget {
  const GeoPage({super.key});

  @override
  State<GeoPage> createState() => _GeoPageState();
}

class _GeoPageState extends State<GeoPage> {
  final GeolocatorPlatform _geoLocatorPlatform = GeolocatorPlatform.instance;

  Position? position;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();

  }

  Future<void> _getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.whileInUse) {
        setState(() async {
          position = await _geoLocatorPlatform.getCurrentPosition(
              locationSettings:
              const LocationSettings(accuracy: LocationAccuracy.high));
        });
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
          ],
        ),
      ),
    ));
  }
}
