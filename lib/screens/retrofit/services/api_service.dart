import 'package:my_login_app/screens/retrofit/model/post_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class ApiService{
    factory ApiService(Dio dio)=_ApiService;

    @GET('posts')
  Future<List<PostModel>> getPosts();
    
    @POST('posts')
  Future<PostModel> addPost(@Body()  PostModel post);

    @DELETE('/posts/{id}')
  Future<void> deletePost(@Path('id') int postId);
}