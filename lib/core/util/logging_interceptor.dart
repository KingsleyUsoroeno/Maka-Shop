import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class LoggingInterceptor {
  static PrettyDioLogger loggingInterceptor() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    );
  }
}
