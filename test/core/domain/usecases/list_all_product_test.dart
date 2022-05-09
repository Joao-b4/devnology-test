import 'package:devnology/core/domain/entities/product.dart';
import 'package:devnology/core/domain/repositories/product_repository_interface.dart';
import 'package:devnology/core/domain/usecases/list_all_products.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../utils/product_mock.dart';
import 'list_all_product_test.mocks.dart';

@GenerateMocks([IProductRepository])
void main() {
  final repository = MockIProductRepository();
  final usecase = ListAllProducts(repository);

  group('ListAllProducts usecase', () {
    test("should return list an instance of product", () async{
      when(repository.getAll()).thenAnswer((_)async => [productMock] as List<Product> );

      final result = await usecase();

      expect(result, equals([productMock]));
    });


    test("should return a error if repository failed", ()async {
      when(repository.getAll()).thenThrow(Exception("message error"));

      expect(()=> usecase(), throwsA(isA<Exception>()));
    });

  });
}