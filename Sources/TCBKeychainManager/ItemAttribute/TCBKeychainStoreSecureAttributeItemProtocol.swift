//
//  TCBKeychainStoreSecureAttributeItemProtocol.swift
//  Pods-TCBKeychainManager_Example
//
//  Created by Neil Francis Hipona on 4/25/22.
//

import Foundation

/**
 * Protocol Values
 * https://developer.apple.com/documentation/security/keychain_services/keychain_items/item_attribute_keys_and_values#1678890
 */

public enum TCBKeychainStoreSecureAttributeItemProtocol: TCBKeychainStoreItemValueAttributeProtocol {

    /// FTP protocol.
    case kFTP
    /// A client side FTP account.
    case kFTPAccount
    /// HTTP protocol.
    case kHTTP
    /// IRC protocol.
    case kIRC
    /// NNTP protocol.
    case kNNTP
    /// POP3 protocol.
    case kPOP3
    /// SMTP protocol.
    case kSMTP
    /// SOCKS protocol.
    case kSOCKS
    /// IMAP protocol.
    case kIMAP
    /// LDAP protocol.
    case kLDAP
    /// AFP over AppleTalk.
    case kAppleTalk
    /// AFP over TCP.
    case kAFP
    /// Telnet protocol.
    case kTelnet
    /// SSH protocol.
    case kSSH
    /// FTP over TLS/SSL.
    case kFTPS
    /// HTTP over TLS/SSL.
    case kHTTPS
    /// HTTP proxy.
    case kHTTPProxy
    /// HTTPS proxy.
    case kHTTPSProxy
    /// FTP proxy.
    case kFTPProxy
    /// SMB protocol.
    case kSMB
    /// RTSP protocol.
    case kRTSP
    /// RTSP proxy.
    case kRTSPProxy
    /// DAAP protocol.
    case kDAAP
    /// Remote Apple Events.
    case kEPPC
    /// IPP protocol.
    case kIPP
    /// NNTP over TLS/SSL.
    case kNNTPS
    /// LDAP over TLS/SSL.
    case kLDAPS
    /// Telnet over TLS/SSL.
    case kTelnetS
    /// IMAP over TLS/SSL.
    case kIMAPS
    /// IRC over TLS/SSL.
    case kIRCS
    /// POP3 over TLS/SSL.
    case kPOP3S
}

public extension TCBKeychainStoreSecureAttributeItemProtocol {
    var attributeKey: String {
        switch self {
        case .kFTP:
            return String(kSecAttrProtocolFTP)

        case .kFTPAccount:
            return String(kSecAttrProtocolFTPAccount)

        case .kHTTP:
            return String(kSecAttrProtocolHTTP)

        case .kIRC:
            return String(kSecAttrProtocolIRC)

        case .kNNTP:
            return String(kSecAttrProtocolNNTP)

        case .kPOP3:
            return String(kSecAttrProtocolPOP3)

        case .kSMTP:
            return String(kSecAttrProtocolSMTP)

        case .kSOCKS:
            return String(kSecAttrProtocolSOCKS)

        case .kIMAP:
            return String(kSecAttrProtocolIMAP)

        case .kLDAP:
            return String(kSecAttrProtocolLDAP)

        case .kAppleTalk:
            return String(kSecAttrProtocolAppleTalk)

        case .kAFP:
            return String(kSecAttrProtocolAFP)

        case .kTelnet:
            return String(kSecAttrProtocolTelnet)

        case .kSSH:
            return String(kSecAttrProtocolSSH)

        case .kFTPS:
            return String(kSecAttrProtocolFTPS)

        case .kHTTPS:
            return String(kSecAttrProtocolHTTPS)

        case .kHTTPProxy:
            return String(kSecAttrProtocolHTTPProxy)

        case .kHTTPSProxy:
            return String(kSecAttrProtocolHTTPSProxy)

        case .kFTPProxy:
            return String(kSecAttrProtocolFTPProxy)

        case .kSMB:
            return String(kSecAttrProtocolSMB)

        case .kRTSP:
            return String(kSecAttrProtocolRTSP)

        case .kRTSPProxy:
            return String(kSecAttrProtocolRTSPProxy)

        case .kDAAP:
            return String(kSecAttrProtocolDAAP)

        case .kEPPC:
            return String(kSecAttrProtocolEPPC)

        case .kIPP:
            return String(kSecAttrProtocolIPP)

        case .kNNTPS:
            return String(kSecAttrProtocolNNTPS)

        case .kLDAPS:
            return String(kSecAttrProtocolLDAPS)

        case .kTelnetS:
            return String(kSecAttrProtocolTelnetS)

        case .kIMAPS:
            return String(kSecAttrProtocolIMAPS)

        case .kIRCS:
            return String(kSecAttrProtocolIRCS)

        case .kPOP3S:
            return String(kSecAttrProtocolPOP3S)
        }
    }
}

internal extension TCBKeychainStoreSecureAttributeItemProtocol {
    var attributeValue: Any {
        switch self {
        case .kFTP:
            return kSecAttrProtocolFTP

        case .kFTPAccount:
            return kSecAttrProtocolFTPAccount

        case .kHTTP:
            return kSecAttrProtocolHTTP

        case .kIRC:
            return kSecAttrProtocolIRC

        case .kNNTP:
            return kSecAttrProtocolNNTP

        case .kPOP3:
            return kSecAttrProtocolPOP3

        case .kSMTP:
            return kSecAttrProtocolSMTP

        case .kSOCKS:
            return kSecAttrProtocolSOCKS

        case .kIMAP:
            return kSecAttrProtocolIMAP

        case .kLDAP:
            return kSecAttrProtocolLDAP

        case .kAppleTalk:
            return kSecAttrProtocolAppleTalk

        case .kAFP:
            return kSecAttrProtocolAFP

        case .kTelnet:
            return kSecAttrProtocolTelnet

        case .kSSH:
            return kSecAttrProtocolSSH

        case .kFTPS:
            return kSecAttrProtocolFTPS

        case .kHTTPS:
            return kSecAttrProtocolHTTPS

        case .kHTTPProxy:
            return kSecAttrProtocolHTTPProxy

        case .kHTTPSProxy:
            return kSecAttrProtocolHTTPSProxy

        case .kFTPProxy:
            return kSecAttrProtocolFTPProxy

        case .kSMB:
            return kSecAttrProtocolSMB

        case .kRTSP:
            return kSecAttrProtocolRTSP

        case .kRTSPProxy:
            return kSecAttrProtocolRTSPProxy

        case .kDAAP:
            return kSecAttrProtocolDAAP

        case .kEPPC:
            return kSecAttrProtocolEPPC

        case .kIPP:
            return kSecAttrProtocolIPP

        case .kNNTPS:
            return kSecAttrProtocolNNTPS

        case .kLDAPS:
            return kSecAttrProtocolLDAPS

        case .kTelnetS:
            return kSecAttrProtocolTelnetS

        case .kIMAPS:
            return kSecAttrProtocolIMAPS

        case .kIRCS:
            return kSecAttrProtocolIRCS

        case .kPOP3S:
            return kSecAttrProtocolPOP3S
        }
    }
}
