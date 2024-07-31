import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project/features/articles/view/widgets/cat_item.dart';
import 'package:graduation_project/Widgets/text_scale.dart';
import 'package:graduation_project/core/config/theme.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // late CameraPosition initialCameraPosition;
  final Location _location = Location();
  LatLng _initialCameraPosition = LatLng(0, 0);
  // final Location _locationController = Location();
  late GoogleMapController googleMapController;

  // Coordinates for Faculty of Computers and Informatics, Suez Canal University, Ismailia, Egypt
  // static const LatLng _facultyCoordinates = LatLng(30.6043, 32.2729);
  // LatLng? _currentP;

  @override
  void initState() {
    super.initState();
    // initialCameraPosition = const CameraPosition(
    //   target: LatLng(30.621172856691874, 32.268407380363826),
    //   zoom: 19);
    _getLocation();
  }

  Future<void> _getLocation() async {
    try {
      LocationData _locationData = await _location.getLocation();
      _initialCameraPosition =
          LatLng(_locationData.latitude!, _locationData.longitude!);
      setState(() {});
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        GoogleMap(
          onMapCreated: (controller) {
            googleMapController = controller;
          },
          initialCameraPosition: CameraPosition(
            target: _initialCameraPosition,
            zoom: 3,
          ),
          // markers: {
          //   if (_currentP != null)
          //     Marker(
          //       markerId: MarkerId("_currentLocation"),
          //       icon: BitmapDescriptor.defaultMarker,
          //       position: _currentP!,
          //     ),
          //   Marker(
          //     markerId: MarkerId("_facultyLocation"),
          //     icon: BitmapDescriptor.defaultMarker,
          //     position: _facultyCoordinates,
          //   ),
          // },
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
                onTap: () {
                  CameraPosition newCameraPosition = CameraPosition(
                      zoom: 19,
                      target: LatLng(30.621172856691874, 32.268407380363826));
                  googleMapController.animateCamera(
                      CameraUpdate.newCameraPosition(newCameraPosition));
                },
                child: const NearbyPlaceItem()),
          ],
        ),
      ]),
    );
  }

  // Future<void> _cameraToPosition(LatLng pos) async {
  //   final GoogleMapController controller = await _mapController.future;
  //   CameraPosition newCameraPosition = CameraPosition(
  //     target: pos,
  //     zoom: 15, // Adjust zoom level as needed
  //   );
  //   await controller.animateCamera(
  //     CameraUpdate.newCameraPosition(newCameraPosition),
  //   );
  // }

  // Future<void> getLocationUpdates() async {
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;

  //   _serviceEnabled = await _locationController.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await _locationController.requestService();
  //     if (!_serviceEnabled) {
  //       print("Location service not enabled");
  //       return;
  //     }
  //   }

  //   _permissionGranted = await _locationController.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await _locationController.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }

  //   _locationController.onLocationChanged.listen((LocationData currentLocation) {
  //     if (currentLocation.latitude != null && currentLocation.longitude != null) {
  //             print("Current location: ${currentLocation.latitude}, ${currentLocation.longitude}");

  //       setState(() {
  //         _currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
  //         _cameraToPosition(_currentP!);
  //       });
  //     }
  //   });
  // }
}

class NearbyPlaceItem extends StatelessWidget {
  const NearbyPlaceItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.symmetric(horizontal: 20.0).copyWith(bottom: 14.0),
      padding: const EdgeInsets.only(left: 10.0),
      width: double.infinity,
      height: 140.0,
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.asset(
              'assets/images/image.png',
              width: MediaQuery.sizeOf(context).width * 0.4,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '150m | 3min',
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, fontSize: 14.0),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Faculty of computers an..',
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, fontSize: 16.0),
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Text(
                  '30% of Space available',
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, fontSize: 14.0),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CatItem(
                      title: 'Plastic',
                      color: Colors.green,
                    ),
                    SizedBox(width: 20.0),
                    CatItem(
                      title: 'Paper',
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
