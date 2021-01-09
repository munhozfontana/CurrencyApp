import 'dart:io';

class FakeRequest {
  String fixture(String name) =>
      File('/lib/services/fixture/$name').readAsStringSync();
}
