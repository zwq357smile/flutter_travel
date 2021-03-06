import 'package:flutter_travel/redux/states/StateAuth.dart';
import 'package:flutter_travel/redux/states/StatePage.dart';
import 'package:flutter_travel/redux/states/StateWeather.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
    final StateAuth auth;
	final StatePage page;
	final StateWeather weather;

    AppState({StateWeather weather, StateAuth auth, StatePage page}): 
		auth = auth ?? StateAuth(), 
		weather = weather ?? StateWeather(), 
		page = page ?? StatePage();

	/// 将登录信息从本地缓存反序列化
    static AppState rehydrationJSON(dynamic json) => AppState(
        auth: StateAuth.fromJSON(json['auth'])
    );

	/// 登录信息转成JSON结构
    Map<String, dynamic> toJson() => {
        'auth': auth.toJSON()
    };

	/// 返回副本
    AppState copyWith({
        bool rehydrated,
        StateAuth auth,
    }) {
        return AppState(
            auth: auth ?? this.auth
        );
    }

    @override
    String toString() {
        return '''AppState{
            auth: $auth,
        }''';
    }
}