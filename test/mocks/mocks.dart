import 'package:miio_test/app/modules/configuration/models/comment_model.dart';
import 'package:miio_test/app/modules/configuration/models/post_model.dart';
import 'package:miio_test/app/modules/configuration/models/user_model.dart';
import 'package:miio_test/app/modules/configuration/services/posts_services.dart';
import 'package:mocktail/mocktail.dart';

class PostServicesMock extends Mock implements PostServices {}

class PostModelMock extends Mock implements PostModel {}

class UserModelMock extends Mock implements UserModel {}

class CommentModelMock extends Mock implements CommentModel {}
