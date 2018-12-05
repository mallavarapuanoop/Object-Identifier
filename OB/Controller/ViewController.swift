//
//  ViewController.swift
//  OB
//
//  Created by Anoop Mallavarapu on 12/5/18.
//  Copyright © 2018 Anoop Mallavarapu. All rights reserved.
//

import UIKit
import AVFoundation
//AVFoundation - Work with audiovisual assets, control device cameras, process audio, and configure system audio interactions.

class ViewController: UIViewController {

    var captureSession: AVCaptureSession!
    var cameraOutput: AVCapturePhotoOutput!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    @IBOutlet weak var roundedLblView: RoundedShadowView!
    
    @IBOutlet weak var cameraView: UIView!
    
    @IBOutlet weak var identificationLabel: UILabel!
    
    @IBOutlet weak var confidenceLabel: UILabel!
    
    @IBOutlet weak var captureImageview: RoundedImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer.frame = cameraView.bounds
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = AVCaptureSession.Preset.hd1920x1080
        
        let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
        
        do{
            let input = try AVCaptureDeviceInput(device: backCamera!)
            
            if captureSession.canAddInput(input) == true{
                captureSession.addInput(input)
            }
            
            cameraOutput = AVCapturePhotoOutput()
            
            if captureSession.canAddOutput(cameraOutput) == true {
                captureSession.addOutput(cameraOutput!)
            }
            
            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            previewLayer.videoGravity = AVLayerVideoGravity.resizeAspect
            previewLayer.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
            
            cameraView.layer.addSublayer(previewLayer!)
            captureSession.startRunning()
            
        }catch {
            
            debugPrint(error)
        }
        
        
    }


}

