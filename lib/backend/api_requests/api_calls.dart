import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LoginCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: 'http://borio.ddns.net:65080/MYBOR/LOGIN/${username}/${password}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
    );
  }
}

class ContextMyBORCall {
  static Future<ApiCallResponse> call({
    String? type = '',
    int? userid,
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ContextMyBOR',
      apiUrl: 'http://borio.ddns.net:65080/MYBOR/${type}/${userid}/${token}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
    );
  }
}

class TriggerCall {
  static Future<ApiCallResponse> call({
    String? type = '',
    int? userid,
    String? token = '',
    String? buttonid = '',
    String? newstate = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Trigger',
      apiUrl:
          'http://borio.ddns.net:65080/MYBOR/${type}/${userid}/${token}/${buttonid}/${newstate}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
    );
  }
}
