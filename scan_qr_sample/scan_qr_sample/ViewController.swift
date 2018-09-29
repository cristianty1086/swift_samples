//
//  ViewController.swift
//  scan_qr_sample
//
//  Created by Cristian Tinoco Yurivilca on 29/09/18.
//  Copyright © 2018 Cristian Tinoco Yurivilca. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , AVCaptureMetadataOutputObjectsDelegate {
    
    @IBOutlet weak var messageLabel: UILabel!
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var qrCodeFrameView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareInOutVideoStream()
        
        iniciarVideoPreviewLayer()
        
        captureSession?.startRunning()
        
        // Move the message label and top bar to the front
        view.bringSubviewToFront(messageLabel)
        //view.bringSubview(toFront: topbar)
        
        resaltarQRScaned()
        
    }
    
    func prepareInOutVideoStream()
    {
        
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualCamera, .builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back)
        
        guard let captureDevice = deviceDiscoverySession.devices.first else {
            print("Failed to get the camera device")
            return
        }
        
        captureSession = AVCaptureSession()
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession?.addInput(input)
        } catch {
            print(error)
            return
        }
        
        // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession?.addOutput(captureMetadataOutput)
        
        // Set delegate and use the default dispatch queue to execute the call back
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
    }
    
    func iniciarVideoPreviewLayer()
    {
        
        // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer!)
        
    }
    
    
    func resaltarQRScaned()
    {
        
        qrCodeFrameView = UIView.init() 
        
        if let qrCFV = qrCodeFrameView {
            qrCFV.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
            qrCFV.layer.borderColor = UIColor.green.cgColor
            qrCFV.layer.borderWidth = 2
            view.addSubview(qrCFV)
            view.bringSubviewToFront(qrCFV)
        }
        
    }

 
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            messageLabel.text = "No QR code is detected"
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObject.ObjectType.qr {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue != nil {
                messageLabel.text = metadataObj.stringValue
            }
        }
    }
    
    
}

