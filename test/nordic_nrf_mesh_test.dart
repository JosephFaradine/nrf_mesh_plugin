import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

void main() {
  // variables
  const channel = MethodChannel('com.faradine.nordic_nrf_mesh_faradine/methods');
  late final NordicNrfMesh nordicNrfMesh;
  late final MeshManagerApi meshManagerApi;
  TestWidgetsFlutterBinding.ensureInitialized();
  // init/dispose
  setUpAll(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
    nordicNrfMesh = NordicNrfMesh();
    meshManagerApi = nordicNrfMesh.meshManagerApi;
  });
  tearDownAll(() {
    channel.setMockMethodCallHandler(null);
    meshManagerApi.dispose();
  });
  // tests
  test('getPlatformVersion', () async {
    expect(await NordicNrfMesh().platformVersion, '42');
  });
  test('mesh network is null by default', () {
    expect(meshManagerApi.meshNetwork, isNull);
  });
}
