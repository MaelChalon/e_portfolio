import 'package:dio/dio.dart';
import 'package:e_porfolio/foundation/client/dio.client.dart';
import 'package:injectable/injectable.dart';

@singleton
class HeaderInterceptor {
  final DioClient _dioClient;

  HeaderInterceptor({required DioClient dioClient}) : _dioClient = dioClient {
    _init();
  }

  void _init() {
    _dioClient.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        options.headers.addAll(
          <String, dynamic>{'Content-Type': 'application/json'},
        );
        handler.next(options);
      },
    ));
  }
}
