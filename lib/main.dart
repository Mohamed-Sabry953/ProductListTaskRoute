

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1_rout/fetures/products/data/repos/product_repo_impl.dart';
import 'package:task1_rout/fetures/products/data/services/api_service.dart';
import 'package:task1_rout/fetures/products/ui/manager/product_cubit/products_cubit.dart';
import 'package:task1_rout/fetures/products/ui/view/products_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utilis/service locator/service_locator.dart';
import 'fetures/products/ui/view/widgets/product_list_view.dart';

void main() {
  initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
       return ProductsCubit(sl<ProductRepoimpl>()
        )..fetchProducts();
      },
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ProductListView(),
        ),
      ),


      );

  }
}
