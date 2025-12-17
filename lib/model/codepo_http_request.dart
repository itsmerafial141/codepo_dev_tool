import 'dart:io' show Cookie;

import 'package:codepo_dev_tool/model/codepo_form_data_field.dart';
import 'package:codepo_dev_tool/model/codepo_http_form_data_file.dart';
import 'package:equatable/equatable.dart';

/// Definition of http request data holder.
class CodepoHttpRequest with EquatableMixin {
  CodepoHttpRequest({
    this.size = 0,
    DateTime? time,
    this.headers = const <String, String>{},
    this.body = '',
    this.contentType = '',
    this.curl = '',
    this.cookies = const [],
    this.queryParameters = const <String, dynamic>{},
    this.formDataFiles,
    this.formDataFields,
  }) : time = time ?? DateTime.now();

  final int size;
  final DateTime? time;
  final Map<String, String> headers;
  final dynamic body;
  final String? contentType;
  final String curl;
  final List<Cookie> cookies;
  final Map<String, dynamic> queryParameters;
  final List<CodepoHttpFormDataFile>? formDataFiles;
  final List<codepoFormDataField>? formDataFields;

  CodepoHttpRequest copyWith({
    int? size,
    DateTime? time,
    Map<String, String>? headers,
    dynamic body,
    String? contentType,
    String? curl,
    List<Cookie>? cookies,
    Map<String, dynamic>? queryParameters,
    List<CodepoHttpFormDataFile>? formDataFiles,
    List<codepoFormDataField>? formDataFields,
  }) {
    return CodepoHttpRequest(
      size: size ?? this.size,
      time: time ?? this.time,
      headers: headers ?? this.headers,
      body: body ?? this.body,
      contentType: contentType ?? this.contentType,
      curl: curl ?? this.curl,
      cookies: cookies ?? this.cookies,
      queryParameters: queryParameters ?? this.queryParameters,
      formDataFiles: formDataFiles ?? this.formDataFiles,
      formDataFields: formDataFields ?? this.formDataFields,
    );
  }

  @override
  List<Object?> get props => [
        size,
        time,
        headers,
        body,
        contentType,
        cookies,
        queryParameters,
        formDataFiles,
        formDataFields,
      ];
}
