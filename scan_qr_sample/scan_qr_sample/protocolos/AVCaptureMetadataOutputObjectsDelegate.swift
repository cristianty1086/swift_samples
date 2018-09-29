//
//  protocolos.swift
//  scan_qr_sample
//
//  Created by Cristian Tinoco Yurivilca on 29/09/18.
//  Copyright © 2018 Cristian Tinoco Yurivilca. All rights reserved.
//

import AVFoundation

protocol nameAVCaptureMetadataOutputObjectsDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection)
    
}
