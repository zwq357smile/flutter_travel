import 'package:flutter_travel/config/ConfigDefault.dart';

/// 生产环境配置
class ConfigProd extends ConfigDefault {

	ConfigProd(): super() {
		// 生产服务器URL配置
		this.serverUrlList[API_ENUM.API_OPEN] = ApiConfigVO(
			key: API_ENUM.API_OPEN,
			serverUrl: 'https://www.apiopen.top/'
		);
		this.serverUrlList[API_ENUM.TENCENT] = ApiConfigVO(
			key: API_ENUM.TENCENT,
			serverUrl: 'https://www.qq.com/'
		);
	}

}
