// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    Data data;
    int statusCode;
    String message;

    User({
        required this.data,
        required this.statusCode,
        required this.message,
    });

    User copyWith({
        Data? data,
        int? statusCode,
        String? message,
    }) => 
        User(
            data: data ?? this.data,
            statusCode: statusCode ?? this.statusCode,
            message: message ?? this.message,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        data: Data.fromJson(json["data"]),
        statusCode: json["status_code"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "status_code": statusCode,
        "message": message,
    };
}

class Data {
    UserClass user;
    String token;

    Data({
        required this.user,
        required this.token,
    });

    Data copyWith({
        UserClass? user,
        String? token,
    }) => 
        Data(
            user: user ?? this.user,
            token: token ?? this.token,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: UserClass.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
    };
}

class UserClass {
    String name;
    String email;
    DateTime updatedAt;
    DateTime createdAt;
    int id;

    UserClass({
        required this.name,
        required this.email,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    UserClass copyWith({
        String? name,
        String? email,
        DateTime? updatedAt,
        DateTime? createdAt,
        int? id,
    }) => 
        UserClass(
            name: name ?? this.name,
            email: email ?? this.email,
            updatedAt: updatedAt ?? this.updatedAt,
            createdAt: createdAt ?? this.createdAt,
            id: id ?? this.id,
        );

    factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        name: json["name"],
        email: json["email"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
