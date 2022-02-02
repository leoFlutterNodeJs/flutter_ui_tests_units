import 'package:flutter_test/flutter_test.dart';
import 'package:ui_tests_units/src/utils/date_formart.dart';

void main() {
  test("ensure datetime returns an String formated", () {
    final datetime = DateTime(2022, 9, 9);
    final String date = datetime.format;
    expect(date, "09/09/2022");
  });

  test("ensure datetime returns an String formated where month > 9", () {
    final datetime = DateTime(2022, 10, 10);
    final String date = datetime.format;
    expect(date, "10/10/2022");
  });

  test("ensure datetime returns an String formated where day > 9", () {
    final datetime = DateTime(2022, 12, 11);
    final String date = datetime.format;
    expect(date, "11/12/2022");
  });
}
