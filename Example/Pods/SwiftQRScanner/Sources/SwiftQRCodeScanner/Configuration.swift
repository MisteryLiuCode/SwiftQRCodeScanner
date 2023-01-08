//
//  QRScannerFrameConfig.swift
//  SwiftQRScanner
//
//  Created by Vinod Jagtap on 07/05/22.
//

#if os(iOS)
import Foundation
import UIKit

public struct QRScannerConfiguration {
    public var title: String
    public var hint: String?
    public var invalidQRCodeAlertTitle: String
    public var invalidQRCodeAlertActionTitle: String
    public var uploadFromPhotosTitle: String
    public var cameraImage: UIImage?
    public var flashOnImage: UIImage?
    public var galleryImage: UIImage?
    public var length: CGFloat
    public var color: UIColor
    public var radius: CGFloat
    public var thickness: CGFloat
    public var readQRFromPhotos: Bool
    public var cancelButtonTitle: String
    public var cancelButtonTintColor: UIColor?
    
    public init(title: String = "扫描二维码",
                hint: String = "",
                uploadFromPhotosTitle: String = "上传图片",
                invalidQRCodeAlertTitle: String = "无效二维码",
                invalidQRCodeAlertActionTitle: String = "OK",
                cameraImage: UIImage? = nil,
                flashOnImage: UIImage? = nil,
                length: CGFloat = 20.0,
                color: UIColor = .white,
                radius: CGFloat = 10.0,
                thickness: CGFloat = 5.0,
                readQRFromPhotos: Bool = false,
                cancelButtonTitle: String = "",
                cancelButtonTintColor: UIColor? = nil) {
        self.title = title
        self.hint = hint
        self.uploadFromPhotosTitle = uploadFromPhotosTitle
        self.invalidQRCodeAlertTitle = invalidQRCodeAlertTitle
        self.invalidQRCodeAlertActionTitle = invalidQRCodeAlertActionTitle
        self.cameraImage = cameraImage
        self.flashOnImage = flashOnImage
        self.length = length
        self.color = color
        self.radius = radius
        self.thickness = thickness
        self.readQRFromPhotos = readQRFromPhotos
        self.cancelButtonTitle = cancelButtonTitle
        self.cancelButtonTintColor = cancelButtonTintColor
    }
}

extension QRScannerConfiguration {
    public static var `default`: QRScannerConfiguration {
        QRScannerConfiguration(title: "扫描二维码",
                               hint: "",
                               uploadFromPhotosTitle: "",
                               invalidQRCodeAlertTitle: "Invalid QR Code",
                               invalidQRCodeAlertActionTitle: "OK",
                               cameraImage: nil,
                               flashOnImage: nil,
                               length: 20.0,
                               color: .white,
                               radius: 10.0,
                               thickness: 5.0,
                               readQRFromPhotos: false,
                               cancelButtonTitle: "退出",
                               cancelButtonTintColor: nil)
    }
}
#endif
