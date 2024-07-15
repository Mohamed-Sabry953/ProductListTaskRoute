import 'package:either_dart/src/either.dart';
import 'package:task1_rout/core/errors/faliure.dart';
import 'package:task1_rout/core/utilis/api_constance.dart';
import 'package:task1_rout/fetures/products/data/models/product.dart';
import 'package:task1_rout/fetures/products/data/repos/product_repo.dart';
import 'package:task1_rout/fetures/products/data/services/api_service.dart';

class ProductRepoimpl implements ProductRepo {
  final ApiService apiService;

  ProductRepoimpl(this.apiService);

  @override
  Future<Either<Failure, List<Product>>> fetchProducts() async {
    try {
      var data = await apiService.get(url: ApiConstance.apiUrl);
      List<Product> products =[];
      for(var item in data['products']){
        products.add(Product.fromJson(item));
      }
      return Right(products);
    } on Exception catch (e) {
     return Left(ServerFailure(e.toString()));
    }

  }
}
