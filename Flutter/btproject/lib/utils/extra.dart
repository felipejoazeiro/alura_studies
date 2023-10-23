import 'package:btproject/utils/utils.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

final Map<DeviceIdentifier, StreamControllerReemit<bool>> _global = {};

extension Extra on BluetoothDevice {
  StreamControllerReemit<bool> get _stream {
    _global[remoteId] ??= StreamControllerReemit(initialValue: false);
    return _global[remoteId]!;
  }

  Future<void> connectAndUpdateStream() async {
    _stream.add(true);
    try {
      await connect();
    } finally {
      _stream.add(false);
    }
  }
}
