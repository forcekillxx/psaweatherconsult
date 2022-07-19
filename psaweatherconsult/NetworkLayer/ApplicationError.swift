//
//  ApplicationError.swift
//  psaweatherconsult
//
//  Created by mhd on 14/07/2022.
//

import Foundation

enum ApplicationError: Error {
    /// Generic error
    case unknow(error: Error? = nil)
    
    /// Unable to decode (eg: JSON decoding)
    case decoding
    
    /// The form is invalid
    case invalidForm

    
    /// Network connection error
    case networkConnection
    
    /// Server error
    case server
    
    /// Image picker source type error
    case imagePickerSourceType
    
    /// Server timedOut
    case networkTimedOut
    
    /// Connection error host
    case networkCannotConnectToHost
    
    /// Lost Connection
    case networkConnectionLost
    
    /// Error network
    case networkNotConnectedToInternet
    
    /// Network cancelled
    case networkCancelled
    
    /// Generic http error
    case errorCodeHttp
    
    /// 401 http error
    case errorCodeHttp401
    
    /// 403 http error
    case errorCodeHttp403
    
    /// 404 http error
    case errorCodeHttp404
    
    /// Cancel
    case errorCodeCancelled

    
    /// Making a bad request to the server
    case badRequest
    
    static func map(_ error: Error) -> ApplicationError {
        return (error as? ApplicationError) ?? .unknow(error: error)
      }
}

extension ApplicationError: LocalizedError {
    var errorDescription: String? {
//        switch self {
//        case .unknow(let error): return error?.localizedDescription ?? L10n.Error.unknow
//        case .decoding: return L10n.Error.decoding
//        case .invalidGrant: return NSLocalizedString("error.invalidRefreshToken", comment: "")
//        case .invalidToken: return NSLocalizedString("error.invalidToken", comment: "")
//        case .invalidForm: return NSLocalizedString("error.invalidForm", comment: "")
//        case .invalidTitle: return NSLocalizedString("error.invalidTitle", comment: "")
//        case .invalidMessage: return NSLocalizedString("error.invalidMessage", comment: "")
//        case .networkConnection: return NSLocalizedString("error.networkConnection", comment: "")
//        case .server: return NSLocalizedString("error.server", comment: "")
//        case .imagePickerSourceType: return NSLocalizedString("error.imagePickerSourceType", comment: "")
//        case .networkTimedOut: return NSLocalizedString("error.network.timedOut", comment: "")
//        case .networkConnectionLost: return NSLocalizedString("error.network.connectionLost", comment: "")
//        case .networkNotConnectedToInternet: return NSLocalizedString("error.network.notConnectedToInternet", comment: "")
//        case .networkCancelled: return NSLocalizedString("error.unknow", comment: "")
//        case .errorCodeHttp: return NSLocalizedString("error.unknow", comment: "")
//        case .errorCodeHttp401: return NSLocalizedString("error.http.401", comment: "")
//        case .errorCodeHttp403: return NSLocalizedString("error.http.403", comment: "")
//        case .errorCodeHttp404: return L10n.Error.notfound
//        case .errorCodeCancelled: return NSLocalizedString("error.cancelled", comment: "")
//        case .networkCannotConnectToHost: return NSLocalizedString("error.network.cannotConnectToHost", comment: "")
//        case .WrongCredentials : return L10n.LoginScreen.Error.badCredentials
//        case .UnauthorizedUsername : return L10n.LoginScreen.Error.unknownUser
//        case .deallocated : return NSLocalizedString("error.deallocated", comment: "")
//        case .emailFormat: return L10n.Error.emailFormat
//        case .invalidLogin : return L10n.Error.invalidLogin
//        case .fieldMandatory: return L10n.ForgotPassword.TextField.mandatory
//        case .termsNotAccepted(error: let error): return error?.message
//        case .badRequest : return "Error 400 : Bad Request"
//        case .duplicateWorkspace: return L10n.Create.Workspace.Duplicate.name
//        case .duplicateCategory: return L10n.Create.Cat.Duplicate.name
//        case .duplicateChannel: return L10n.Create.Channel.Duplicate.name
//        case .duplicatePage: return L10n.Create.Page.Duplicate.name
//        }
        return "error"
    }
}
