import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:suitmedia/app/data/models/user_model.dart';
import 'package:suitmedia/app/data/services/api_service.dart';

class ThirdScreenController extends GetxController {
  final ApiService _apiService = ApiService();

  var userList = <User>[].obs;
  var isLoading = true.obs;
  var currentPage = 1;
  var hasMoreData = true;

  final RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
      hasMoreData = true;
      userList.clear();
      isLoading.value = true;
    }

    if (!hasMoreData) return;

    try {
      final newUsers = await _apiService.fetchUsers(page: currentPage);
      if (newUsers.isEmpty) {
        hasMoreData = false;
        refreshController.loadNoData();
      } else {
        userList.addAll(newUsers);
        currentPage++;
        refreshController.loadComplete();
      }

      if (isRefresh) {
        refreshController.refreshCompleted();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch users: ${e.toString()}', backgroundColor: Colors.red, colorText: Colors.white);
      if (isRefresh) {
        refreshController.refreshFailed();
      } else {
        refreshController.loadFailed();
      }
    } finally {
      if (isLoading.value) {
        isLoading.value = false;
      }
    }
  }

  void onRefresh() async {
    await fetchUsers(isRefresh: true);
  }

  void onLoading() async {
    await fetchUsers();
  }

  void selectUser(User user) {
    Get.back(result: user);
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }
}