import 'dart:convert';

ErrorMessage errorMessageFromJson(String str) => ErrorMessage.fromJson(json.decode(str));

String errorMessageToJson(ErrorMessage data) => json.encode(data.toJson());

class ErrorMessage {
    String? message;
    Errors? errors;

    ErrorMessage({
        this.message,
        this.errors,
    });

    ErrorMessage copyWith({
        String? message,
        Errors? errors,
    }) => 
        ErrorMessage(
            message: message ?? this.message,
            errors: errors ?? this.errors,
        );

    factory ErrorMessage.fromJson(Map<String, dynamic> json) => ErrorMessage(
        message: json["message"],
        errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "errors": errors?.toJson(),
    };
}

class Errors {
    List<String>? name;
    List<String>? email;
    List<String>? password;

    Errors({
        this.name,
        this.email,
        this.password,
    });

    Errors copyWith({
        List<String>? name,
        List<String>? email,
        List<String>? password,
    }) => 
        Errors(
            name: name ?? this.name,
            email: email ?? this.email,
            password: password ?? this.password,
        );

    factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        name: json["name"] == null ? [] : List<String>.from(json["name"]!.map((x) => x)),
        email: json["email"] == null ? [] : List<String>.from(json["email"]!.map((x) => x)),
        password: json["password"] == null ? [] : List<String>.from(json["password"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? [] : List<dynamic>.from(name!.map((x) => x)),
        "email": email == null ? [] : List<dynamic>.from(email!.map((x) => x)),
        "password": password == null ? [] : List<dynamic>.from(password!.map((x) => x)),
    };
}
