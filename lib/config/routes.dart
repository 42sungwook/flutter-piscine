// lib/config/routes.dart

import 'package:flutter/material.dart';
import 'package:flutter_piscine/screens/home.dart';

class AppRoutes {
  // 라우트 이름 상수 정의
  static const String home = '/';

  // 라우트 설정
  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
  };

  // 페이지 전환 애니메이션이 있는 라우트 생성
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      default:
        // 정의되지 않은 라우트에 대한 처리
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('${settings.name} 라우트를 찾을 수 없습니다'),
            ),
          ),
        );
    }
  }

  static void navigateToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, home);
  }
}
