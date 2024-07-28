import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'app_routes.dart';

// coverage:ignore-file
class AppInitHelper {
  static Future firstInitApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    // SSL handshake fix
    ByteData data =
        await PlatformAssetBundle().load('assets/ca/isrgrootx1.pem');
    SecurityContext.defaultContext
        .setTrustedCertificatesBytes(data.buffer.asUint8List());


    // await AppInitHelper._cacheSvgImages();

    final windowSize =
        MediaQueryData.fromView(WidgetsBinding.instance.window);
    final bool useTabletLayout = windowSize.size.shortestSide >= 600;
    if (useTabletLayout) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeLeft,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }


    //init appPhotoPath
  }

  static String getStartRoute() {
    return AppRoutes.startScreen;
  }

}
