import 'package:flutter_spoogle_app/presentation/libraries/AppContents/ProgressLibs/LoaderOverlay.dart';
import 'package:flutter_spoogle_app/presentation/widgets/AppbarIcBack.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../common/extensions/CommonFun.dart';
import '../../data/core/api_constants.dart';
import '../../data/data_sources/api_functions.dart';
import '../../data/models/CountryApiModel.dart';
import 'AppContents/NoDataWidget.dart';

class CountryPicker extends StatefulWidget {
  const CountryPicker({Key? key}) : super(key: key);

  @override
  State<CountryPicker> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<CountryPicker> {
  List<String> listData = [];

  late Future<bool> _future;
  bool isApiDataAvailable = false;
  bool isInternetAvailable = true;
  CountryApiModel modelCountry = CountryApiModel();


  @override
  void initState() {
    super.initState();
    _future = getDataFromApi();
  }

  @override
  void dispose() {
    LoaderOverlay.hide();
    super.dispose();
  }

  Future<bool> getDataFromApi() async {
    try{
      isInternetAvailable = await isInternetConnectionAvailable();

      await ApiFun.apiGet("ApiConstants.county").then((jsonDecodeData) => {
        modelCountry = CountryApiModel.fromJson(jsonDecodeData),
      });

      if(modelCountry.status == 'Success') {
        isApiDataAvailable = true;
      }

    } catch(error){
      if (kDebugMode) {
        print("Error: $error");
      }
    }
    return isApiDataAvailable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _future,
        builder: (context, snapShot){
          if(snapShot.hasData && snapShot.connectionState == ConnectionState.done){

              if(isApiDataAvailable){
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //appBarIcBack(context, 'Select Country', Colors.transparent, false),
                    Flexible(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: modelCountry.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            contentPadding: const EdgeInsets.only(left: 36, right: 36, ),
                            leading:  Text(
                              modelCountry.data![index].emoji!,
                              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.normal, color: Colors.grey),
                            ),
                            title: Text(
                              modelCountry.data![index].name!.toUpperCase(),
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
                            ),

                            subtitle:  Text(
                              modelCountry.data![index].iso3!,
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey),
                            ),

                            trailing: Text(
                              modelCountry.data![index].phonecode!,
                              style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black),
                              maxLines: 4,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                            ),

                            onTap: (){
                              Map<String, String> myData = {};
                              myData['countryId'] = modelCountry.data![index].id.toString();
                              myData['country'] = modelCountry.data![index].name!;
                              myData['phoneCode'] = modelCountry.data![index].phonecode!;
                              myData['flag'] = modelCountry.data![index].emoji!;
                              Navigator.pop(context, myData);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
              else { return NoDataFound(txt: 'No Data Found', onRefresh: (){
                setState(() {
                  isApiDataAvailable = false;
                  isInternetAvailable = false;
                  _future = getDataFromApi();
                });
              });}

          } else {return showSimpleLoaderOverlay();}
        },
      ),
    );
  }
}
