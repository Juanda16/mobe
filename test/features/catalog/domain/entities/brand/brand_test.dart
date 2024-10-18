import 'package:flutter_test/flutter_test.dart';
import 'package:mobe/features/catalog/domain/entities/brand/brand.dart';
import 'package:mobe/features/catalog/domain/entities/vendor/store.dart';

void main() {
  group('Brand', () {
    test('should create a Brand instance with required fields', () {
      final brand = Brand(name: 'Test Brand');
      expect(brand.name, 'Test Brand');
      expect(brand.vendor, isNull);
    });

    test('should create a Brand instance with all fields', () {
      const Store store = Store(name: 'Test Store', id: 1);
      const Brand brand = Brand(name: 'Test Brand', vendor: store);
      expect(brand.name, 'Test Brand');
      expect(brand.vendor, store);
    });

    test('should convert Brand instance to JSON', () {
      final brand = Brand(name: 'Test Brand');
      final json = brand.toJson();
      expect(json['name'], 'Test Brand');
      expect(json['vendor'], isNull);
    });

    test('should convert JSON to Brand instance', () {
      final json = {'name': 'Test Brand'};
      final brand = Brand.fromJson(json);
      expect(brand.name, 'Test Brand');
      expect(brand.vendor, isNull);
    });

    test('should handle null vendor field in JSON', () {
      final json = {'name': 'Test Brand', 'vendor': null};
      final brand = Brand.fromJson(json);
      expect(brand.name, 'Test Brand');
      expect(brand.vendor, isNull);
    });

    test('should handle non-null vendor field in JSON', () {
      final json = {
        'name': 'Test Brand',
        'vendor': {'name': 'Test Store', 'id': 1}
      };
      final brand = Brand.fromJson(json);
      expect(brand.name, 'Test Brand');
      expect(brand.vendor, isNotNull);
      expect(brand.vendor!.name, 'Test Store');
    });
  });
}
