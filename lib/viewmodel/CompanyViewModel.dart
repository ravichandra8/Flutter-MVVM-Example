import 'package:flutter/material.dart';
import 'package:flutter_app/repository/CompanyRepository.dart';
import 'package:flutter_app/repository/model/CompanyResponse.dart';
class CompanyViewModel with ChangeNotifier{
 CompanyResponse companyResponse = CompanyResponse();
  String response;
  Future<void> fetchPostInformation() async{
    companyResponse = await CompanyRepository().getCompanyDetails();
    print("company response"+companyResponse.toJson().toString());
   notifyListeners();
  }
}