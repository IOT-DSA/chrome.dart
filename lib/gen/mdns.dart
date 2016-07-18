/* This file has been generated from mdns.idl - do not edit */

/**
 * Use the `chrome.mdns` API to discover services over mDNS. This comprises a
 * subset of the features of the NSD spec: http://www.w3.org/TR/discovery-api/
 */
library chrome.mdns;

import '../src/common.dart';

/**
 * Accessor for the `chrome.mdns` namespace.
 */
final ChromeMdns mdns = new ChromeMdns._();

class ChromeMdns extends ChromeApi {
  JsObject get _mdns => chrome['mdns'];

  Stream<List<MdnsService>> get onServiceList => _onServiceList.stream;
  ChromeStreamController<List<MdnsService>> _onServiceList;

  ChromeMdns._() {
    var getApi = () => _mdns;
    _onServiceList = new ChromeStreamController<List<MdnsService>>.oneArg(getApi, 'onServiceList', (e) => listify(e, _createMDnsService));
  }

  bool get available => _mdns != null;

  /**
   * Immediately issues a multicast DNS query for all service types. [callback]
   * is invoked immediately. At a later time, queries will be sent, and any
   * service events will be fired.
   */
  Future forceDiscovery() {
    if (_mdns == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _mdns.callMethod('forceDiscovery', [completer.callback]);
    return completer.future;
  }

  void _throwNotAvailable() {
    throw new UnsupportedError("'chrome.mdns' is not available");
  }
}

/**
 * Represents a mDNS/DNS-SD service.
 */
class MdnsService extends ChromeObject {
  MdnsService({String serviceName, String serviceHostPort, String ipAddress, List<String> serviceData}) {
    if (serviceName != null) this.serviceName = serviceName;
    if (serviceHostPort != null) this.serviceHostPort = serviceHostPort;
    if (ipAddress != null) this.ipAddress = ipAddress;
    if (serviceData != null) this.serviceData = serviceData;
  }
  MdnsService.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get serviceName => jsProxy['serviceName'];
  set serviceName(String value) => jsProxy['serviceName'] = value;

  String get serviceHostPort => jsProxy['serviceHostPort'];
  set serviceHostPort(String value) => jsProxy['serviceHostPort'] = value;

  String get ipAddress => jsProxy['ipAddress'];
  set ipAddress(String value) => jsProxy['ipAddress'] = value;

  List<String> get serviceData => listify(jsProxy['serviceData']);
  set serviceData(List<String> value) => jsProxy['serviceData'] = jsify(value);
}

MdnsService _createMDnsService(JsObject jsProxy) => jsProxy == null ? null : new MdnsService.fromProxy(jsProxy);
