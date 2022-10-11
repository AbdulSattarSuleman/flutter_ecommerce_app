import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';

class LocationInputFieldWidget extends StatefulWidget {
  const LocationInputFieldWidget({
    Key? key,
    required this.inputLocationController,
  }) : super(key: key);

  final TextEditingController inputLocationController;

  @override
  State<LocationInputFieldWidget> createState() =>
      _LocationInputFieldWidgetState();
}

class _LocationInputFieldWidgetState extends State<LocationInputFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffF2F2F2),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      // margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        // focusNode: FocusNode(),
        controller: widget.inputLocationController,
        onEditingComplete: () {
          setState(() {
            print(widget.inputLocationController.text);
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Color(0xff49454F)),
            suffixIcon: widget.inputLocationController.text.isNotEmpty
                ? InkWell(
                    onTap: () {
                      widget.inputLocationController.clear();
                    },
                    child: Icon(
                      Icons.cancel_outlined,
                      color: ColorManager.greyColor,
                    ),
                  )
                : Text(''),
            labelText: "Enter Your Location"),
      ),
    );
  }
}
