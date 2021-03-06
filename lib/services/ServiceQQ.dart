import 'package:flutter_travel/core/api/ApiEnum.dart';
import 'package:flutter_travel/core/http/HttpServiceCore.dart';
import 'package:flutter_travel/services/ServiceEnviroment.dart';

/// 腾讯API服务
class ServiceQQ extends HttpServiceCore {
	factory ServiceQQ() => _getInstance();
	static ServiceQQ get instance => _getInstance();
	static ServiceQQ _instance;
	static ServiceQQ _getInstance() {
		if (_instance == null) {
			_instance = new ServiceQQ._internal();
		}

		return _instance;
	}

	ServiceQQ._internal(): super() {
		// 初始化
		this.apiKey = API_ENUM.TENCENT;
		this.enviroment = ServiceEnviroment.getCurrentEnviroment();
		this.baseUrl = this.enviroment.getEnv().getServerUrl(this.apiKey);

		super.init();
	}
}
