import 'dart:convert';
import 'dart:core';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../router.dart';
import '../utils/base_equatable.dart';
import '../utils/contants.dart';
import '../utils/preference_helpher.dart';
import '../utils/singleton.dart';
import 'dio_client.dart';

class APIRepository {
  Future<dynamic> dynamicRequest(
      String url, {
        ApiRequestMethod? method,
        dynamic userArguments,
        BuildContext? context,
        bool isBearerTokenNeed = true,
      }) async {
    String bearertoken = '';
    await PreferenceHelper.getBearer().then((value) {
      if (value != null && isBearerTokenNeed) {
        bearertoken = value;
         // AidivaFlashSingleton.instance.bearerToken=value;
      }
    });
  

    dynamic returnableValues;
    var dynamicApiRequest = DioClient.dioConfig();
    String? pbKey;
    try {
      Response response;

      switch (method) {
        case ApiRequestMethod.delete:
          {
            response = await dynamicApiRequest.delete(
              url,
              data: userArguments,
            );
            break;
          }
        case ApiRequestMethod.get:
          {
            response = await dynamicApiRequest.get(
              url,
            );
        
            break;
          }
        case ApiRequestMethod.put:
          {
            response = await dynamicApiRequest.put(
              url,
              data: userArguments!,
            );
           
            break;
          }
        case ApiRequestMethod.post:
          {
            response = await dynamicApiRequest.post(
              url,
              data: userArguments,
            );
           
            break;
          }
        case ApiRequestMethod.patch:
          {
            response = await dynamicApiRequest.patch(
              url,
              data: userArguments,
            );
            break;
          }
        default:
          {
            response = await dynamicApiRequest.get(
              url,
            );
          }
      }
      debugPrint(
          'url-> $url\n req body--> $userArguments \n response--> ${response.data}');

      // if (response.data is String && pbKey != null) {
      //   returnableValues = jsonDecode(await decryptData(pbKey, response.data));
      // } else {
        if (ApiRequestMethod.get != method &&
            response.data['message'] != null &&
            response.data['message'] != '') {
       //   showToast(AidivaFlashSingleton.instance.errorMapValues?[response.data['message']] ?? response.data['message']);
        }

        returnableValues = response.data;
      // }
    } on DioError catch (e) {
      dynamic errorValues;
      if (e.response != null) {
        errorValues = DioClient.errorHandling(e);
      } else {
        debugPrint('dio response ${e.response}');
        debugPrint('dio message ${e.message}');
        debugPrint('dio error ${e.error}');
        returnableValues = 'Error sending request!';
      }
      debugPrint('DioError--> $returnableValues');
      if (e.response != null) {
        if (e.response!.statusCode == 500) {
          showToast('Please try after sometimes');
          // returnableValues = AidivaFlashSingleton
          //     .instance.errorMapValues![e.response!.data['message']] ??
          //     e.response!.data['message'];
          // showToast(returnableValues);
          // returnableValues = e.response!;

        }
        if (e.response!.statusCode == 401) {
        }
        if (e.response!.statusCode == 405) {
        
          showToast(returnableValues);
        }
        // if (e.response!.statusCode == 201) {
        //   returnableValues = AidivaFlashSingleton
        //           .instance.errorMapValues![e.response!.data['message']] ??
        //       e.response!.data['message'];
        //
        //   showToast(returnableValues);
        // }
        if (e.response!.statusCode == 404) {
        
          showToast(returnableValues);
        }
        else if (e.response!.statusCode == 400) {
           showToast('Please try again');
         
          showToast(returnableValues);
        }
      } else {
        showToast(e.response!.data['message']);
      }
    }
    return returnableValues;
  }

}


class RenewSession {
  String? status;
  String? data;
  String? message;

  RenewSession({this.status, this.data, this.message});

  RenewSession.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    data['message'] = this.message;
    return data;
  }
}
