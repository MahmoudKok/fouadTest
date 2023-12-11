import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fouadtest/app/features/home/home_controller.dart';
import 'package:fouadtest/app/features/welcome/welcome_screen.dart';
import 'package:fouadtest/src/router/router.dart';
import 'package:fouadtest/src/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  if (pref.getString('token') != null) {
    Get.lazyPut(() => HomeController());
  }
  runApp(MyApp(
    pref: pref,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.pref});

  final SharedPreferences pref;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(590, 1280),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
            useMaterial3: true,
          ),
          builder: EasyLoading.init(),
          getPages: AppRouter.routes,
          home: FutureBuilder(
            future: Get.find<HomeController>().fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return const WelcomeScreen();
              } else {
                return Center(
                  child: SizedBox(
                      width: 100.sp,
                      height: 100.sp,
                      child: const CircularProgressIndicator()),
                );
              }
            },
          ),
        );
      },
    );
  }
}
/**pref.getString('token') != null
                    ? HomeScreen()
                    : const */