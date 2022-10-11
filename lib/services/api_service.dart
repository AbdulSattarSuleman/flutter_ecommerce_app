import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:icebox_cafe/constants/api_constant.dart';
import 'package:icebox_cafe/model/location_model.dart';
import 'package:http/http.dart' as http;
import 'package:icebox_cafe/model/product_category_model.dart';

class ApiService {
  // Nearest Machine List Using API
  Future<List<LocationModel>?> getLocationDetail(
      double latitude, double longitude) async {
    try {
      // double longitude = -80.153206;
      // double latitude = 25.987219;

      Map<String, String> qParams = {
        'longitude': "$longitude",
        'latitude': "$latitude",
      };
      Map<String, String> header = {
        HttpHeaders.contentTypeHeader: "application/json"
      };
      final String locationUrlApi =
          ApiConstants.baseUrl + ApiConstants.locationEndPoint;
      Uri uri = Uri.parse(locationUrlApi);
      final finalUri = uri.replace(queryParameters: qParams);
      // var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.locationEndPoint);
      // var uri = Uri.https(ApiConstants.baseUrl + ApiConstants.locationEndPoint,
      // queryParameters.toString());
      var response = await http.get(
        finalUri,
        headers: header,
      );
      print("Nearest API before if condition");
      print(response.body);
      var decodeJson = jsonDecode(response.body);
      print(decodeJson);
      if (response.statusCode == 200) {
        print(response.statusCode);
        log(response.statusCode.toString());
        List<LocationModel> _model = locationModelFromJson(response.body);
        print("try body");

        log(response.body.toString());
        print("Nearest API Successful Hit");
        return _model;
      }
    } catch (e) {
      log(e.toString());
      Future.error(e);
      print("Nearest API failed ");
    }
  }

  // Get Products By categories Using API
  // List<ProductModel>
  Future<List<ProductsModel>?> getProductByCategoryAPI(int branchId) async {
    try {
      Map<String, int> qParams = {
        'branchId': branchId,
      };
      Map<String, String> header = {
        HttpHeaders.contentTypeHeader: "application/json"
      };
      final String url = ApiConstants.baseUrl + ApiConstants.productsEndPoint;

      Uri uri = Uri.parse(url);
      final finalUri = uri.replace(queryParameters: qParams);

      var response = await http.get(finalUri, headers: header);
      // On Success Condition
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.body);

        // List<ProductsModel> _model = productsModelFromJson(response.body);
      }
    }
    // On failed Condition
    catch (e) {
      Future.error(e.toString());
    }
  }
}
