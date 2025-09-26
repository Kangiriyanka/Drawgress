

import UIKit
import AVFoundation

enum CameraPermission {
    enum CameraError: Error, LocalizedError {
        case unauthorized
        case unavailable
        
        var errorDescription: String? {
            switch self {
            case .unauthorized:
                return NSLocalizedString("You have not authorized camera use", comment: "")
            case .unavailable:
                return NSLocalizedString("A camera is not available for this device", comment: "")
            }
        }
        
        var recoverySuggestion: String? {
            switch self {
            case .unauthorized:
                return "Open Settings > Privacy and Security > Camera and turn on for this app."
            case .unavailable:
                return "Use the photo album instead."
            }
        }
        
    }
    
    /// Checks if the device supports camera access and whether permission is granted.
    /// - Returns:
    ///   - `nil` if the camera is available and either authorized, not yet determined, or restricted.
    ///   - A `CameraError` (.unauthorized or .unavailable) if access is denied or the device has no camera.
    static func checkPermissions() -> CameraError? {
        // isSourceTypeAvailable checks if the device has an available camera
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // This checks if the user has given Drawgress access to the camera.
            let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
            switch authStatus {
            case .notDetermined:
                return nil
            case .restricted:
                return nil
            case .denied:
                return .unauthorized
            case .authorized:
                return nil
            @unknown default:
                return nil
            }
        } else {
            return .unavailable
        }
    }
}
