import 'package:flutter_test/flutter_test.dart';
import 'package:ui_tests_units/src/data/models/user.dart';
import 'package:ui_tests_units/src/helpers/get.dart';

void main() {
  test("ensure GET.i is AssertionError", () {
    bool catchCalled = false;
    try {
      Get.i.find<String>(tag: "apiKey");
    } catch (e) {
      if (e is AssertionError) catchCalled = true;
    }
    expect(catchCalled, true);
  });

  test("ensure GET.i find tagless is AssertionError", () {
    bool catchCalled = false;
    try {
      Get.i.find<String>();
    } catch (e) {
      if (e is AssertionError) catchCalled = true;
    }
    expect(catchCalled, true);
  });

  test("ensure GET.i put and find API_KEY", () {
    Get.i.put<String>("API_KEY", tag: "apiKey");
    final apiKey = Get.i.find<String>(tag: "apiKey");
    expect(apiKey, "API_KEY");
  });

  test("ensure GET.i put and find GOOGLE_MAPS_API_KEY", () {
    Get.i.put<String>("GOOGLE_MAPS_API_KEY");
    final googleMapsApiKey = Get.i.find<String>();
    expect(googleMapsApiKey, "GOOGLE_MAPS_API_KEY");
  });

  test("ensure GET.i remove String key", () {
    Get.i.put<String>("GOOGLE_MAPS_API_KEY");
    bool isRemove = Get.i.remove<String>();
    expect(isRemove, true);
  });

  test("ensure GET.i remove String key returns false if not found", () {
    bool isRemove = Get.i.remove<String>();
    expect(isRemove, false);
  });

  test("ensure GET.i find lazyPut returns AssertionError if not found", () {
    bool catchCalled = false;
    try {
      Get.i.find<User>(lazy: true);
    } catch (e) {
      if (e is AssertionError) catchCalled = true;
    }
    expect(catchCalled, true);
  });

  test("ensure GET.i find lazyPut returns AssertionError if not found with tag",
      () {
    bool catchCalled = false;
    try {
      Get.i.find<User>(lazy: true, tag: "user");
    } catch (e) {
      if (e is AssertionError) catchCalled = true;
    }
    expect(catchCalled, true);
  });

  test("ensure GET.i lazyPut is called corretly with user", () {
    final userObj = User(
        id: "12345",
        email: 'leocardosodev@gmail.com',
        name: 'Leonardo',
        lastName: 'Silva',
        birthday: DateTime(1982, 1, 9));
    bool userCreated = false;
    Get.i.lazyPut<User>(() {
      userCreated = true;
      return userObj;
    });
    Get.i.find<User>(lazy: true);
    expect(userCreated, true);
  });

  test("ensure GET.i lazyPut is called corretly with tag", () {
    final userObj = User(
        id: "123452",
        email: 'leocardosodev@gmail.com',
        name: 'Leonardo',
        lastName: 'Silva',
        birthday: DateTime(1982, 1, 9));
    bool userCreated = false;
    Get.i.lazyPut<User>(() {
      userCreated = true;
      return userObj;
    }, tag: "user2");
    Get.i.find<User>(lazy: true, tag: "user2");
    expect(userCreated, true);
  });

  test("ensure GET.i lazyPut return data if is called before", () {
    Get.i.remove<User>();
    final userObj = User(
        id: "12345",
        email: 'leocardosodev@gmail.com',
        name: 'Leonardo',
        lastName: 'Silva',
        birthday: DateTime(1982, 1, 9));
    int counter = 0;
    Get.i.lazyPut<User>(() {
      counter++;
      return userObj;
    });
    Get.i.find<User>(lazy: true);
    expect(counter, 1);
  });
}
