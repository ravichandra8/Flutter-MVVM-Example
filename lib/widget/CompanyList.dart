import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/viewmodel/CompanyViewModel.dart';
import 'package:provider/provider.dart';

class CompanyList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
        child: Consumer<CompanyViewModel>(
          builder: (context,companyViewModel,child) =>
              Container(
                child: ListView.builder(itemCount: companyViewModel.companyResponse.companies.length,
                    itemBuilder: (context,index){
                  return ListTile(
                    title: Text(companyViewModel.companyResponse.companies[index].company),
                    subtitle: Text(companyViewModel.companyResponse.companies[index].ceo),
                  );
                }),
              ),
        ),
      ),
    );
  }

}