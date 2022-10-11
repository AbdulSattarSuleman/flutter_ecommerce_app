import 'package:geolocator/geolocator.dart';

import '../../model/location_model.dart';
import '../../screens/location-screen/functionality-user-location/get_location_function.dart';
import '../../services/api_service.dart';

class APIFunction {
  static late List<LocationModel>? locationModel = [];
  // static Future<dynamic> List<LocationModel>? locationModel = [];

  // get latitude => null;

  // get longitude => null;
  vendingMachingListUsingLatlong() async {
    Position position = await GetLocationClass().determinePosition();
    double latitude = position.latitude;
    double longitude = position.longitude;
    print(latitude);
    print(longitude);
    locationModel =
        (await ApiService().getLocationDetail(latitude, longitude))!;
    Future.delayed(const Duration(seconds: 0)).then((value) {
      // setState(() {});
    });
    print("API fetched successfully");
    // setState(() {});
  }

  getProductsByCategories() async {}
}
