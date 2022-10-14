import 'package:flutter/material.dart';
import 'package:icebox_cafe/resources/color_manager.dart';
import 'package:icebox_cafe/resources/route_manager.dart';
import 'package:icebox_cafe/resources/style_manager.dart';
import 'package:icebox_cafe/screens/location-screen/explore-singlelocation-screen/explore_single_location_screen.dart';

import '../../../model/location_model.dart';
import '../../../resources/images_manager.dart';

class LocationListTile extends StatefulWidget {
  LocationListTile(
      {Key? key, required List<LocationModel>? locationModel, this.brnachId})
      : _locationModel = locationModel,
        super(key: key);

  final List<LocationModel>? _locationModel;
  int? brnachId;
  @override
  State<LocationListTile> createState() => _LocationListTileState();
}

class _LocationListTileState extends State<LocationListTile> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ListView.builder(
        itemCount: widget._locationModel!.length,
        itemBuilder: ((context, index) {
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: ListTile(
              onTap: () {
                print("branch Id:  ${widget._locationModel![index].branchId}");
                print("Machinename: ${widget._locationModel![index].name}");
                print("Distance: ${widget._locationModel![index].distance}");
                print("Distance: ${widget._locationModel![index].distance}");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExploreSingleLocationScreen(
                              machineName: widget._locationModel![index].name,
                              branchId: widget._locationModel![index].branchId,
                              distance: widget._locationModel![index].distance,
                              address: widget._locationModel![index].address,
                            )));
                // Navigator.pushNamed(context, Routes.machineDetailRoute);
                // Navigator.pushNamed(
                //   context, Routes.machineDetailRoute,
                //   // arguments: {
                //   //   'Branch Id': _locationModel![index].branchId,
                //   //   "Machine Name": _locationModel![index].name,
                //   //   "Distance": _locationModel![index].distance
                //   // }
                // );
              },
              horizontalTitleGap: 10,
              leading: Image(image: AssetImage(ImagesManager.vendingImg1)),
              title: Text(
                widget._locationModel![index].name,
                style: StyleManager().customTextStyle(
                    16, ColorManager.textColorDark, FontWeight.w500),
              ),
              subtitle: Text(
                  "Distance:  ${widget._locationModel![index].distance} km"),
            ),
          );
        }),
      ),
    );
  }
}
