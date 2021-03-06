import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_travel/core/navigation/NavigationTabCore.dart';
import 'package:flutter_travel/modules/home/views/pages/PageSearchResult.dart';
import 'package:flutter_travel/modules/login/LoginPage.dart';
import 'package:flutter_travel/modules/profile/ProfilePage.dart';
import 'package:flutter_travel/modules/profile/views/pages/PageFormSubmit.dart';
import 'package:flutter_travel/modules/splash/SplashPage.dart';
import 'package:flutter_travel/redux/states/StateApp.dart';
import 'package:redux/redux.dart';

/// 路由结构
class Routers {
	Store<AppState> store;
	
	Routers({Store<AppState> store}) {
		this.store = store;
	}

	static String homePage = '/';
	static String loginPage = '/login';
	static String mainPage = '/main';
	static String searchPage = '/search';
	static String profileEditPage = '/edit';
	static String profilePage = '/profile';

	/// 初始化路由
	Map<String, WidgetBuilder> init() {
		return <String, WidgetBuilder> {
			// 首页
			Routers.homePage: (BuildContext context) => StoreConnector<AppState, dynamic>( 
				converter: (store) => store.state.auth.isAuthenticated, 
				builder: (BuildContext context, isAuthenticated) => isAuthenticated ? SplashPage() : LoginPage()
			),

			// 登录页
			Routers.loginPage: (BuildContext context) => LoginPage(),

			// 主页
			Routers.mainPage: (BuildContext context) {
				return NavigationTabCore();
			},

			// 搜索结果页
			Routers.searchPage: (BuildContext context) => PageSearchResult(),

			// 个人信息编辑页
			Routers.profileEditPage: (BuildContext context) => PageFormSubmit(),

			// 个人信息页
			Routers.profilePage: (BuildContext context) => ProfilePage()
		};
	}
}
