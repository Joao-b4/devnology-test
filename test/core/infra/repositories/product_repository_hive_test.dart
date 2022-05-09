import 'package:devnology/core/infra/adapters/local_storage_adapter_interface.dart';
import 'package:devnology/core/infra/repositories/product_repository_hive.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../utils/product_mock.dart';
import 'product_repository_hive_test.mocks.dart';

@GenerateMocks([ILocalStorageAdapter])
void main() {
  final adapter = MockILocalStorageAdapter();
  final repository = ProductRepositoryHive(adapter);

  group('ProductRepositoryHive repository', () {
    test("should return list an instance of product", () async{
      when(adapter.getAll("products")).thenAnswer((_)async => [productModelMock]);

      final result = await repository.getAll();

      expect(result[0].id, equals(productMock.id));
    });


    test("should return a error if adapter failed", ()async {
      when(adapter.getAll("products")).thenThrow(Exception("message error"));

      expect(()=> repository.getAll(), throwsA(isA<Exception>()));
    });

  });
}