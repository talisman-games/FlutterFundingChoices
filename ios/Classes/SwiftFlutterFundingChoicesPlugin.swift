import Flutter
import UIKit
import UserMessagingPlatform

public class SwiftFlutterFundingChoicesPlugin: NSObject, FlutterPlugin {
    /// The channel method name.
    static let channelName: String = "flutter_funding_choices"

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: channelName, binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterFundingChoicesPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "requestConsentInformation":
            let arguments: [String: Any?] = call.arguments as! [String: Any?]
            var debugGeography: DebugGeography = toUMPDebugGeography(id: arguments["debugGeography"] as? Int)
            requestConsentInformation(tagForUnderAgeOfConsent: arguments["tagForUnderAgeOfConsent"] as! Bool, testDevicesHashedIds: (arguments["testDevicesHashedIds"] as? [String]) ?? [], debugGeography: debugGeography, result: result)
        case "showConsentForm": showConsentForm(result: result)
        case "reset":
            ConsentInformation.shared.reset()
            result(true)
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    /// Requests the consent information.
    private func requestConsentInformation(tagForUnderAgeOfConsent: Bool, testDevicesHashedIds: [String], debugGeography: DebugGeography, result: @escaping FlutterResult) {
        let params = RequestParameters()
        params.isTaggedForUnderAgeOfConsent = tagForUnderAgeOfConsent

        if (testDevicesHashedIds.count > 0) {
            let debugSettings = DebugSettings()
            debugSettings.testDeviceIdentifiers = testDevicesHashedIds
            debugSettings.geography = debugGeography
            params.debugSettings = debugSettings
        }
        
        ConsentInformation.shared.requestConsentInfoUpdate(with: params) { error in
            if error == nil {
                var consentInfo: [String: Any] = [:]
                consentInfo["consentStatus"] = ConsentInformation.shared.consentStatus.rawValue
                consentInfo["isConsentFormAvailable"] = ConsentInformation.shared.formStatus == FormStatus.available
                result(consentInfo)
            } else {
                result(FlutterError(code: "request_error", message: error!.localizedDescription, details: nil))
            }
        }
    }

    /// Shows the consent form.
    private func showConsentForm(result: @escaping FlutterResult) {
        let viewController = UIApplication.shared.keyWindow?.rootViewController
        if viewController == nil {
            result(FlutterError(code: "view_controller_error", message: "View controller is null.", details: nil))
            return
        }

        ConsentForm.load { form, error in
            if error == nil {
                form!.present(from: viewController!) { dismissError in
                    if dismissError == nil {
                        result(true)
                    } else {
                        result(FlutterError(code: "form_dismiss_error", message: dismissError!.localizedDescription, details: nil))
                    }
                }
            } else {
                result(FlutterError(code: "form_error", message: error!.localizedDescription, details: nil))
            }
        }
    }
    
    /// Converts an integer to a UMPDebugGeography.
    private func toUMPDebugGeography(id: Int?) -> DebugGeography {
        switch id {
        case 1:
            return DebugGeography.EEA
        case 2:
            return DebugGeography.other
        default:
            return DebugGeography.disabled
        }
    }
}
