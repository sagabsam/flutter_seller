import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/data/models/add_product_response_model.dart';
import 'package:flutter_app/data/models/image_response_model.dart';
import 'package:flutter_app/common/global_variables.dart';
import 'package:flutter_app/data/models/product_response_model.dart';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ProductRemoteDatasource {
  Future<Either<String, ProductsResponseModel>> getProducts() async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/products'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return Right(ProductsResponseModel.fromJson(response.body));
    } else {
      return const Left('Server Error, please contact admin');
    }
  }
  Future<Either<String, ProductsResponseModel>> getProductsByCategory(int categoryId) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/products?category_id=$categoryId'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return Right(ProductsResponseModel.fromJson(response.body));
    } else {
      return const Left('Server Error, please contact admin');
    }
  }
}