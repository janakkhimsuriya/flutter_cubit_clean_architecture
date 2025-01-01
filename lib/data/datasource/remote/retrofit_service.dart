import 'package:dio/dio.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_service.g.dart';

@RestApi()
// ignore: one_member_abstracts
abstract class RetrofitService {
  factory RetrofitService(Dio dio, {required String baseUrl}) =
      _RetrofitService;

  @POST(epLogin)
  Future<HttpResponse<GenericResponse<UserProfile>>> login(
      @Body() LoginParams params);
}
