class Utils {
	factory Utils() => _getInstance();
	static Utils get instance => _getInstance();
	static Utils _instance;
	static Utils _getInstance() {
		if (_instance == null) {
			_instance = new Utils._internal();
		}

		return _instance;
	}

	Utils._internal() {
		// hole
	}

	/// 首字母大写转换
	/// * [String input] 转换字符串
	static toUppercase(String input) {
		input = input.trim();
		if (input == null) {
			throw new ArgumentError("string: $input");
		}
		if (input.length == 0) {
			return input;
		}

		return input[0].toUpperCase() + input.substring(1);
	}
}
