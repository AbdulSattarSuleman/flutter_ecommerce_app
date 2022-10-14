import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icebox_cafe/model/location_model.dart';
import 'package:icebox_cafe/screens/location-screen/functionality-user-location/get_location_function.dart';
import 'package:icebox_cafe/services/api_service.dart';

import '../../resources/color_manager.dart';
import '../../resources/images_manager.dart';
import '../../resources/style_manager.dart';
import 'components/input_field.dart';
import 'components/location_list.dart';

// This Screen Is Not Used in Application

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late List<LocationModel>? _locationModel = [];
  TextEditingController inputLocationController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("call data before function");
    _getData();
    print("call data After function");
  }

  void _getData() async {
    Position position = await GetLocationClass().determinePosition();
    double latitude = position.latitude;
    double longitude = position.longitude;
    _locationModel =
        (await ApiService().getLocationDetail(latitude, longitude))!;
    Future.delayed(const Duration(seconds: 0)).then((value) {
      setState(() {});
    });
  }

  int _counter = 0;
  int selectedIndex = 0;

  void _increaseIndex() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Select Your Location"),
        ),
        bottomNavigationBar: NavigationBar(
            selectedIndex: selectedIndex,
            onDestinationSelected: (value) => setState(() {
                  selectedIndex = value;
                }),
            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset(ImagesManager.vendIcon),
                // icon: Icon(CustomIcons.accessibility),
                label: 'Order',
                selectedIcon: SvgPicture.asset(ImagesManager.orderIcon),
              ),
              NavigationDestination(
                icon: Icon(Icons.watch_later_outlined),
                label: 'Recent',
                // selectedIcon: SvgPicture.asset(ImagesManager.orderIcon),
              ),
              NavigationDestination(
                icon: Icon(Icons.card_giftcard),
                label: 'Gift Card',
                // selectedIcon: SvgPicture.asset(ImagesManager.orderIcon),
              ),
              NavigationDestination(
                icon: Icon(Icons.account_circle_outlined),
                label: 'Account',
                // selectedIcon: SvgPicture.asset(ImagesManager.orderIcon),
              ),
            ]),
        body: _locationModel == null || _locationModel!.isEmpty
            ? Center(
                child: splashLoader(),
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Input Field
                    LocationInputFieldWidget(
                        inputLocationController: inputLocationController),
                    SizedBox(
                      height: 20,
                    ),
                    // Text
                    Text(
                      "NEARBY aaa",
                      textAlign: TextAlign.left,
                      style: StyleManager().customTextStyle(
                          14, ColorManager.textColorDark, FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // Api Data Display
                    LocationListTile(locationModel: _locationModel),
                  ],
                ),
              ));
  }

  Widget splashLoader() {
    print("loading screen");
    final screenSize = MediaQuery.of(context).size;
    return Align(
        alignment: Alignment.center,
        child: Container(
            padding: EdgeInsets.all(10),
            // color: Colors.black38,
            child: SizedBox(
              width: screenSize.width * 0.16,
              height: screenSize.width * 0.16,
              child: CircularProgressIndicator(
                backgroundColor: ColorManager.primaryColor,
                color: Colors.white,
              ),
            )));
  }
}
