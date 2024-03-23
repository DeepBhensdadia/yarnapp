import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartx/dartx_io.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

class WebService {
  final Dio dio;
  final Connectivity connectivity;

  WebService({required this.dio, required this.connectivity});

  static Map<String, String> headersdd = {};
  static getCookie() {
    if (headersdd.containsKey("cookie")) return headersdd["cookie"];
    return "";
  }

  var headers = {
    // 'Content-Type': 'application/json; charset=UTF-8',
    "content-type": "application/x-www-form-urlencoded",
    'Cookie': getCookie().toString()
  };

  Future<Either<Response, ErrorModel>> getRequest({
    required String url,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParameters,
  }) async {
    logger.i(url.toString());
    try {
      if (queryParameters != null) {
        logger.d(queryParameters);
      }
    } catch (err) {
      logger.d(err.toString());
    }
    try {
      if ((await connectivity.checkConnectivity()) != ConnectivityResult.none) {
        Response response = await dio.get(
          url,
          queryParameters: queryParameters,
          options: Options(
            responseType: ResponseType.plain,
            contentType: 'application/json',
            headers: headers,
            receiveTimeout: const Duration(seconds: 60),
            sendTimeout: const Duration(seconds: 60),
          ),
        );
        try {
          logger.d(
            JsonEncoder.withIndent(" " * 4).convert(
              jsonDecode(response.data),
            ),
          );
        } catch (err) {
          logger.d(err.toString());
        }
        return _getTrueResponse(response).fold(
          (l) => left(l),
          (r) => right(r),
        );
      } else {
        return right(
          ErrorModel(message: 'Internet Not Available', status: 'false'),
        );
      }
    } catch (err) {
      return right(ErrorModel(message: err.toString()));
    }
  }

  Future<Either<Response, ErrorModel>> postFormRequest({
    required String url,
    Map<String, dynamic>? header,
    required FormData formData,
  }) async {
    logger.i(url.toString());
    try {
      logger.d(Map.fromEntries(formData.fields.toIterable()));
    } catch (err) {
      logger.d(err.toString());
    }
    try {
      if ((await connectivity.checkConnectivity()) != ConnectivityResult.none) {
        Response response = await dio.post(
          url,
          data: formData,
          options: Options(
            responseType: ResponseType.plain,
            contentType: 'application/json',
            headers: headers,
            receiveTimeout: const Duration(seconds: 60),
            sendTimeout: const Duration(seconds: 60),
          ),
        );
        try {
          logger.d(
            JsonEncoder.withIndent(" " * 4).convert(
              jsonDecode(response.data),
            ),
          );
        } catch (err) {
          logger.d(err.toString());
        }
        return _getTrueResponse(response).fold(
          (l) => left(l),
          (r) => right(r),
        );
      } else {
        return right(
          ErrorModel(message: 'Internet Not Available', status: 'false'),
        );
      }
    } catch (err) {
      return right(ErrorModel(message: err.toString()));
    }
  }

  Future<Either<Response, ErrorModel>> postStringRequest({
    required String url,
    Map<String, dynamic>? header,
    required String formData,
  }) async {
    logger.i(url.toString());
    // try {
    //   logger.d(Map.fromEntries(formData.fields.toIterable()));
    // } catch (err) {
    //   logger.d(err.toString());
    // }
    try {
      if ((await connectivity.checkConnectivity()) != ConnectivityResult.none) {
        Response response = await dio.post(
          url,
          data: formData,
          options: Options(
            responseType: ResponseType.plain,
            contentType: 'application/json',
            headers: headers,
            receiveTimeout: const Duration(seconds: 60),
            sendTimeout: const Duration(seconds: 60),
          ),
        );
        try {
          logger.d(
            JsonEncoder.withIndent(" " * 4).convert(
              jsonDecode(response.data),
            ),
          );
        } catch (err) {
          logger.d(err.toString());
        }
        return _getTrueResponse(response).fold(
          (l) => left(l),
          (r) => right(r),
        );
      } else {
        return right(
          ErrorModel(message: 'Internet Not Available', status: 'false'),
        );
      }
    } catch (err) {
      return right(ErrorModel(message: err.toString()));
    }
  }

  Future<Either<Response, ErrorModel>> deleteRequest({
    required String url,
    Map<String, dynamic>? header,
    Map<String, dynamic>? queryParameters,
  }) async {
    logger.i(url.toString());
    try {
      if (queryParameters != null) {
        logger.d(queryParameters);
      }
    } catch (err) {
      logger.d(err.toString());
    }
    try {
      if ((await connectivity.checkConnectivity()) != ConnectivityResult.none) {
        Response response = await dio.delete(
          url,
          queryParameters: queryParameters,
          options: Options(
            responseType: ResponseType.plain,
            contentType: 'application/json',
            headers: headers,
            receiveTimeout: const Duration(seconds: 60),
            sendTimeout: const Duration(seconds: 60),
          ),
        );
        try {
          logger.d(
            JsonEncoder.withIndent(" " * 4).convert(
              jsonDecode(response.data),
            ),
          );
        } catch (err) {
          logger.d(err.toString());
        }
        return _getTrueResponse(response).fold(
          (l) => left(l),
          (r) => right(r),
        );
      } else {
        return right(
          ErrorModel(message: 'Internet Not Available', status: 'false'),
        );
      }
    } catch (err) {
      return right(ErrorModel(message: err.toString()));
    }
  }

  Either<Response, ErrorModel> _getTrueResponse(Response response) {
    final int statusCode = response.statusCode!;
    if (statusCode == 500 || statusCode == 502 || statusCode == 504) {
      return right(
        ErrorModel(
          status: 'false',
          message: 'Internal Server Issue',
        ),
      );
    } else if (statusCode == 401) {
      /// Set Here your logout method
      ModelCommonAuthorised streams =
          ModelCommonAuthorised.fromJson(json.decode(response.data));
      return right(
        ErrorModel(
          status: 'false',
          message: streams.message,
        ),
      );
    } else if (statusCode == 403) {
      ModelCommonAuthorised streams =
          ModelCommonAuthorised.fromJson(json.decode(response.data));
      return right(
        ErrorModel(
          status: 'false',
          message: streams.message,
        ),
      );
    } else if (statusCode == 405) {
      String error = 'This Method Not Allowed';
      return right(
        ErrorModel(
          status: 'false',
          message: error,
        ),
      );
    } else if (statusCode == 400) {
      ModelCommonAuthorised streams = ModelCommonAuthorised.fromJson(
        json.decode(
          response.data,
        ),
      );
      return right(
        ErrorModel(
          message: streams.message,
          status: 'false',
        ),
      );
    } else if (statusCode < 200 || statusCode > 404) {
      String error = response.headers['message'].toString();
      return right(
        ErrorModel(
          status: 'false',
          message: error,
        ),
      );
    }
    return left(response);
  }
}

class ErrorModel {
  ErrorModel({
    this.message,
    this.status = 'false',
  });

  final String? message;
  final String? status;

  @override
  String toString() => "Message : $message Status : $status";
}

/// A [ModelCommonAuthorised] widget is a widget that describes part of the API Model Unauthorised
class ModelCommonAuthorised {
  String? message;
  bool? status;

  ModelCommonAuthorised({this.message, this.status});

  ModelCommonAuthorised.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
