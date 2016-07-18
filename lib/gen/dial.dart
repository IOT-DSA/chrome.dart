/* This file has been generated from dial.idl - do not edit */

/**
 * Use the `chrome.dial` API to discover devices that support DIAL. Protocol
 * specification: http://www.dial-multiscreen.org/
 */
library chrome.dial;

import '../src/common.dart';

/**
 * Accessor for the `chrome.dial` namespace.
 */
final ChromeDial dial = new ChromeDial._();

class ChromeDial extends ChromeApi {
  JsObject get _dial => chrome['dial'];

  Stream<List<DialDevice>> get onDeviceList => _onDeviceList.stream;
  ChromeStreamController<List<DialDevice>> _onDeviceList;

  Stream<DialError> get onError => _onError.stream;
  ChromeStreamController<DialError> _onError;

  ChromeDial._() {
    var getApi = () => _dial;
    _onDeviceList = new ChromeStreamController<List<DialDevice>>.oneArg(getApi, 'onDeviceList', (e) => listify(e, _createDialDevice));
    _onError = new ChromeStreamController<DialError>.oneArg(getApi, 'onError', _createDialError);
  }

  bool get available => _dial != null;

  /**
   * Requests that DIAL discovery happen immediately. The request may not be
   * honored as discovery may already be happening in the background. The
   * callback is invoked with [true] if discovery was initiated or [false]
   * otherwise.
   */
  Future<bool> discoverNow() {
    if (_dial == null) _throwNotAvailable();

    var completer = new ChromeCompleter<bool>.oneArg();
    _dial.callMethod('discoverNow', [completer.callback]);
    return completer.future;
  }

  void _throwNotAvailable() {
    throw new UnsupportedError("'chrome.dial' is not available");
  }
}

class DialErrorCode extends ChromeEnum {
  static const DialErrorCode NO_LISTENERS = const DialErrorCode._('no_listeners');
  static const DialErrorCode NO_VALID_NETWORK_INTERFACES = const DialErrorCode._('no_valid_network_interfaces');
  static const DialErrorCode NETWORK_DISCONNECTED = const DialErrorCode._('network_disconnected');
  static const DialErrorCode CELLULAR_NETWORK = const DialErrorCode._('cellular_network');
  static const DialErrorCode SOCKET_ERROR = const DialErrorCode._('socket_error');
  static const DialErrorCode UNKNOWN = const DialErrorCode._('unknown');

  static const List<DialErrorCode> VALUES = const[NO_LISTENERS, NO_VALID_NETWORK_INTERFACES, NETWORK_DISCONNECTED, CELLULAR_NETWORK, SOCKET_ERROR, UNKNOWN];

  const DialErrorCode._(String str): super(str);
}

/**
 * Represents a unique device that responded to a DIAL discovery request.
 */
class DialDevice extends ChromeObject {
  DialDevice({String deviceLabel, String deviceDescriptionUrl, int configId}) {
    if (deviceLabel != null) this.deviceLabel = deviceLabel;
    if (deviceDescriptionUrl != null) this.deviceDescriptionUrl = deviceDescriptionUrl;
    if (configId != null) this.configId = configId;
  }
  DialDevice.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get deviceLabel => jsProxy['deviceLabel'];
  set deviceLabel(String value) => jsProxy['deviceLabel'] = value;

  String get deviceDescriptionUrl => jsProxy['deviceDescriptionUrl'];
  set deviceDescriptionUrl(String value) => jsProxy['deviceDescriptionUrl'] = value;

  int get configId => jsProxy['configId'];
  set configId(int value) => jsProxy['configId'] = value;
}

class DialError extends ChromeObject {
  DialError({DialErrorCode code}) {
    if (code != null) this.code = code;
  }
  DialError.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  DialErrorCode get code => _createDialErrorCode(jsProxy['code']);
  set code(DialErrorCode value) => jsProxy['code'] = jsify(value);
}

DialDevice _createDialDevice(JsObject jsProxy) => jsProxy == null ? null : new DialDevice.fromProxy(jsProxy);
DialError _createDialError(JsObject jsProxy) => jsProxy == null ? null : new DialError.fromProxy(jsProxy);
DialErrorCode _createDialErrorCode(String value) => DialErrorCode.VALUES.singleWhere((ChromeEnum e) => e.value == value);
