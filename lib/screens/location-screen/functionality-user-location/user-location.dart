import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icebox_cafe/screens/location-screen/components/location_list.dart';
import 'package:icebox_cafe/screens/location-screen/functionality-user-location/get_location_function.dart';
import 'package:icebox_cafe/utils/functionality/api_function.dart';
import 'package:shimmer/shimmer.dart';

import '../../../model/location_model.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/images_manager.dart';
import '../../../resources/style_manager.dart';
import '../../../services/api_service.dart';

class UserLocationScreen extends StatefulWidget {
  const UserLocationScreen({Key? key}) : super(key: key);
  // final TextEditingController getLocationController;
  @override
  State<UserLocationScreen> createState() => _UserLocationScreenState();
}

final TextEditingController getLocationController = TextEditingController();
ApiService apiService = ApiService();

@override
class _UserLocationScreenState extends State<UserLocationScreen> {
  String location = '';
  String address = 'Searching';
  // late List<LocationModel>? _locationModel = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      APIFunction().vendingMachingListUsingLatlong().then((_) {
        setState(() {
          //setstate
        });
      });
    });

    // getLocationCallBack();
    print("init state");
  }

  @override
  void dispose() {
    // getLocationController.dispose();
    super.dispose();
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
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Select Your Location"),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          // child: await VendingmachineListScreen(screenSize),
          child: VendingmachineListScreen(screenSize),
        ),
      ),
    );
  }

  VendingmachineListScreen(Size screenSize) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xffF2F2F2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          // margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
          child: TextFormField(
            toolbarOptions: ToolbarOptions(
                copy: true, selectAll: false, paste: true, cut: true),
            textInputAction: TextInputAction.done,
            keyboardAppearance: Brightness.light,
            // focusNode: FocusNode(),
            controller: getLocationController,
            onEditingComplete: () {
              setState(() {
                print(getLocationController.text);
                TextInputAction.done;
              });
            },
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Color(0xff49454F)),
                suffixIcon: InkWell(
                  onTap: () async {
                    // call latitude and longitude using function
                    Position position =
                        await GetLocationClass().determinePosition();
                    print(position.latitude);
                    print(position.longitude);
                    location =
                        'Lat: ${position.latitude}, Long: ${position.longitude}';

                    // Get Address fro lat and long using function
                    // GetLocationClass().GetAddressFromLatLong(position);
                    // setState(() {});
                    setState(() {
                      APIFunction().vendingMachingListUsingLatlong().then((_) {
                        setState(() {
                          //setstate
                        });
                      });
                    });
                    // APIFunction().vendingMachingListUsingLatlong();
                  },
                  child: Icon(
                    Icons.location_searching_outlined,
                    color: ColorManager.greyColor,
                  ),
                ),
                labelText: "Enter Your Location"),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // Text
        Text(
          "NEARBY",
          textAlign: TextAlign.left,
          style: StyleManager()
              .customTextStyle(14, ColorManager.textColorDark, FontWeight.w600),
        ),
        SizedBox(
          height: 20,
        ),
        // Spacer(),
        // List Display Not compatible with input field
        APIFunction.locationModel == null || APIFunction.locationModel!.isEmpty
            ? SingleChildScrollView(
                child: SizedBox(
                  height: screenSize.height * 0.5,
                  child: Center(
                    child: splashLoader(),
                  ),
                ),
              )
            : LocationListTile(
                locationModel: APIFunction.locationModel,
                brnachId: 4,
              )
      ],
    );
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
