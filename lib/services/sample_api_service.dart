// import 'dart:developer';

// import 'package:icebox_cafe/constants/sample_api.dart';
// import 'package:icebox_cafe/model/location_model.dart';
// import 'package:icebox_cafe/model/sample_user_model.dart';

// import 'package:http/http.dart' as http;

// class SampleApiService{
//   Future<List<UserModel>?> getUsers()async{
//     try{
//       var url =await Uri.parse(SampleApiConstants.baseUrl + SampleApiConstants.usersEndpoint);
//       var response = await http.get(url);
//       print(response);
//       log(response.toString());
//       if(response.statusCode == 200){
//         List<UserModel> _model = userModelFromJson();

//       // List<LocationModel> locatioModel = LocationModel.fromJson(json)
//       }
//     }
//   }
// }