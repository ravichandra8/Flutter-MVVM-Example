import 'package:flutter/material.dart';
import 'package:flutter_app/viewmodel/CompanyViewModel.dart';
import 'package:flutter_app/widget/CompanyList.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (context) => CompanyViewModel(),
      child:
      MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  void didChangeDependencies() {
    Provider.of<CompanyViewModel>(context,listen: false)
        .fetchPostInformation()
        .then((value) {
          setState(() {
            _isLoading = false;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:_isLoading? Center(child: CircularProgressIndicator()):
    // Center(
    //     child:Consumer<CompanyViewModel>(
    // builder: (context,companyViewModel,child)
    //     => Expanded(
    //       child: Column(
    //         children: <Widget>[
    //         ListView.builder(
    //             itemCount: 20,
    //             itemBuilder: (context,index) {
    //             return ListTile(
    //               title: Text("ravi"),
    //             );
    //         }),
    //         ],
    //       ),
    //     ),
    //     )
    // ),
      CompanyList()
    );
  }
}
