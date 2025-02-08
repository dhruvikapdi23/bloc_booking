import '../../environment.dart';

class ApiMethods {
  static String createUser = '${Environment.apiUrl}/users/createUser';
  static String sendOtp = '${Environment.apiUrl}/authentication/sendOtp';
  static String verifyOtp = '${Environment.apiUrl}/authentication/verifyOtp';
  static String city = '${Environment.apiUrl}/cities/getCityList';
  static String getCurrentUser = '${Environment.apiUrl}/users/getCurrentUser';
  static String users(id) => '${Environment.apiUrl}/users/$id';
  static String usersUpdate = '${Environment.apiUrl}/users/update';
  static String createTempPost = '${Environment.apiUrl}/posts/createTempPost';
  static String updateTempPost(id) => '${Environment.apiUrl}/posts/$id';
  static String getAllTempSellItem = '${Environment.apiUrl}/sells/getAll';
  static String getPosts = '${Environment.apiUrl}/posts/getPosts';
  static String createMeetup = '${Environment.apiUrl}/meetups/createMeetup';
  static String updateMeetup(id) => '${Environment.apiUrl}/meetups/update/$id';
  static String getMeetups = '${Environment.apiUrl}/meetups/getPosts';
  static String createTempSellItem = '${Environment.apiUrl}/sells/createTempSellItem';
  static String updateTempSellItem(id) => '${Environment.apiUrl}/sells/update/$id';
  static String savePost = '${Environment.apiUrl}/posts/update';
  static String getHomePosts(query) => '${Environment.apiUrl}/home/getPostables?$query';
  static String getMyPostables(query) => '${Environment.apiUrl}/users/myPostables?$query';
  static String getMyReactions(query) => '${Environment.apiUrl}/reactions/myReactions?$query';
  static String deletePost(id) => '${Environment.apiUrl}/posts/$id';
  static String addComments = '${Environment.apiUrl}/reactions/currentUser/addComment';
  static String removeComment = '${Environment.apiUrl}/reactions/currentUser/removeComment';
  static String addLike(postId, type) => '${Environment.apiUrl}/reactions/currentUser/addOrRemoveLike?postableId=$postId&type=$type';
  static String saveMeetUp = '${Environment.apiUrl}/meetups/update';
  static String deleteMeetUp(id) => '${Environment.apiUrl}/meetups/$id';
  static String saveSell = '${Environment.apiUrl}/sells/update';
  static String deleteSell(id) => '${Environment.apiUrl}/sells/$id';
  static String getBusinessCategory = '${Environment.apiUrl}/serviceprovider/getBusinessCategories';
  static String getSpecializations = '${Environment.apiUrl}/serviceprovider/businessCategory/specializations';
  static String saveServiceprovider = '${Environment.apiUrl}/serviceprovider/update';
}
