// import 'package:coba_fusia/color/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/server/arguments_pass/temp_pass_detail_outlet.dart';
import 'package:fusia/widget/custom_appbar.dart';

import '../../color/colors_theme.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({Key? key}) : super(key: key);

  @override
  _RewardPageState createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  
  List<String> dummyQuery = [
    "Gandaria City",
    "Grand Indonesia",
    "Kota Kasablangka",
    "Lippo Kemang",
    "Pacific Place",
    "PIK Avenue",
    "Pondok Indah Mall",
  ];
  List<String> temporaryResetData = [];
  
  TextStyle headerStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: ColorsTheme.white,
  );

  TextStyle contentStyle1 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorsTheme.black,
  );

  TextStyle itemListTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: ColorsTheme.black,
  );

  TextStyle textFormTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: ColorsTheme.neutralDark,
  );

  searchInput(query) {
    List<String> temporarySearch = [];
    if(query.isNotEmpty) {
      setState(() {
        for(var i = 0; i < dummyQuery.length; i++) {
          temporaryResetData.add(dummyQuery[i]);
          if(dummyQuery[i].contains(query)) {
            temporarySearch.add(dummyQuery[i]);
          }
        }
        dummyQuery.clear();
        dummyQuery = temporarySearch;
      });
    } else {
      setState(() {
        dummyQuery = temporaryResetData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget appbar() => CustomAppBar(title: "Outlets", isAccessDetail: false);

    Widget itemList(datalist) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => Navigator.pushNamed(context, '/detail_outlet',arguments: DetailOutletArgumentPass(name: datalist)), 
          child: Padding(
            padding: EdgeInsets.only(top: 21.h,bottom: 21.h,right: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(datalist,style: itemListTextStyle),
                RotatedBox(
                  quarterTurns: 2,
                  child: SizedBox(
                    width: 6.w,
                    height: 12.h,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('assets/icons/ic_arrow_back.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(color: ColorsTheme.grey),
      ],
    );

    Widget searchForm() => TextFormField(
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      onFieldSubmitted: (value) => searchInput(value),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: ColorsTheme.neutralDark!, width: 1.w),
        ),
        prefixIcon: Image.asset('assets/icons/ic_search.png'),
        hintText: "Search Outlet",
        hintStyle: textFormTextStyle,
      ),
      style: textFormTextStyle,
    );

    Widget body() => Padding(
      padding: EdgeInsets.only(top: 9.h,left: 20.w,right: 20.w),
      child: Column(
        children: [
          searchForm(),
          Expanded(
            child: ListView.builder(
                itemCount: dummyQuery.length,
                shrinkWrap: true,
                itemBuilder: (context,index) => itemList(dummyQuery[index]),
              ),
          ),
        ],
      ),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: SafeArea(
        child: Scaffold(
          body: body(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(78.h),
            child: appbar(),
          ),
        ),
      ),
      value: SystemUiOverlayStyle(statusBarColor: ColorsTheme.primary),
    );
  }
}
