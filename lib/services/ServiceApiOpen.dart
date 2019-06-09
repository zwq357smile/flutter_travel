import 'package:dio/dio.dart';
import 'package:flutter_travel/config/ConfigDefault.dart';
import 'package:flutter_travel/core/http/HttpServiceCore.dart';

import 'ServiceEnviroment.dart';

/// 公众API服务
class ServiceApiOpen extends HttpServiceCore {
	factory ServiceApiOpen() => _getInstance();
	static ServiceApiOpen get instance => _getInstance();
	static ServiceApiOpen _instance;
	static ServiceApiOpen _getInstance() {
		if (_instance == null) {
			_instance = new ServiceApiOpen._internal();
		}

		return _instance;
	}

	ServiceApiOpen._internal(): super() {
		// 初始化
		this.apiKey = API_ENUM.API_OPEN;
		this.enviroment = ServiceEnviroment.getCurrentEnviroment();
		this.baseUrl = this.enviroment.getEnv().getServerUrl(this.apiKey);
	}

	/// 返回热点信息
	/// url https://www.apiopen.top/journalismApi
	Future<Response<dynamic>> getJournalismData() async {
		return await this.get('journalismApi');
	}
}
