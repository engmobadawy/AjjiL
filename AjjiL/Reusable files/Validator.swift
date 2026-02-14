//
//  ValidationType.swift
//  AjjiL
//
//  Created by mohamed mahmoud sobhy badawy on 14/02/2026.
//


enum ValidationType {
    case optional
    case mandatory
    case email
    case password
    case confirmPassword(password: String)

    var errorMessage: String {
        switch self {
        case .optional:
            return ""

        case .mandatory:
            return "This field is mandatory."

        case .email:
            return "Invalid email format."

        case .password:
            return "Password should be at least 8 characters long."

        case .confirmPassword(password: let password):
            return "Passwords do not match. Please try again."
        }
    }
}
