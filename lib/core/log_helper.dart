class LogHelper {
  static showLog({String? className,String? funcName, required String message}) {
    print('class name: $className method name: $funcName - message: $message');
  }
  static showLogDebug({required String className,required String funcName, required String message}) {
    print('class name: $className method name: $funcName - message: $message');
  }
}
