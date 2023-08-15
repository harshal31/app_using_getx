import 'package:app_using_getx/generated/json/base/json_convert_content.dart';
import 'package:app_using_getx/app/data/models/user_profile_entity.dart';

UserProfileEntity $UserProfileEntityFromJson(Map<String, dynamic> json) {
	final UserProfileEntity userProfileEntity = UserProfileEntity();
	final int? page = jsonConvert.convert<int>(json['page']);
	if (page != null) {
		userProfileEntity.page = page;
	}
	final int? perPage = jsonConvert.convert<int>(json['per_page']);
	if (perPage != null) {
		userProfileEntity.perPage = perPage;
	}
	final int? total = jsonConvert.convert<int>(json['total']);
	if (total != null) {
		userProfileEntity.total = total;
	}
	final int? totalPages = jsonConvert.convert<int>(json['total_pages']);
	if (totalPages != null) {
		userProfileEntity.totalPages = totalPages;
	}
	final List<UserProfileData>? data = jsonConvert.convertListNotNull<UserProfileData>(json['data']);
	if (data != null) {
		userProfileEntity.data = data;
	}
	final UserProfileSupport? support = jsonConvert.convert<UserProfileSupport>(json['support']);
	if (support != null) {
		userProfileEntity.support = support;
	}
	return userProfileEntity;
}

Map<String, dynamic> $UserProfileEntityToJson(UserProfileEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['page'] = entity.page;
	data['per_page'] = entity.perPage;
	data['total'] = entity.total;
	data['total_pages'] = entity.totalPages;
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	data['support'] = entity.support?.toJson();
	return data;
}

UserProfileData $UserProfileDataFromJson(Map<String, dynamic> json) {
	final UserProfileData userProfileData = UserProfileData();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		userProfileData.id = id;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		userProfileData.email = email;
	}
	final String? firstName = jsonConvert.convert<String>(json['first_name']);
	if (firstName != null) {
		userProfileData.firstName = firstName;
	}
	final String? lastName = jsonConvert.convert<String>(json['last_name']);
	if (lastName != null) {
		userProfileData.lastName = lastName;
	}
	final String? avatar = jsonConvert.convert<String>(json['avatar']);
	if (avatar != null) {
		userProfileData.avatar = avatar;
	}
	return userProfileData;
}

Map<String, dynamic> $UserProfileDataToJson(UserProfileData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['email'] = entity.email;
	data['first_name'] = entity.firstName;
	data['last_name'] = entity.lastName;
	data['avatar'] = entity.avatar;
	return data;
}

UserProfileSupport $UserProfileSupportFromJson(Map<String, dynamic> json) {
	final UserProfileSupport userProfileSupport = UserProfileSupport();
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		userProfileSupport.url = url;
	}
	final String? text = jsonConvert.convert<String>(json['text']);
	if (text != null) {
		userProfileSupport.text = text;
	}
	return userProfileSupport;
}

Map<String, dynamic> $UserProfileSupportToJson(UserProfileSupport entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['url'] = entity.url;
	data['text'] = entity.text;
	return data;
}