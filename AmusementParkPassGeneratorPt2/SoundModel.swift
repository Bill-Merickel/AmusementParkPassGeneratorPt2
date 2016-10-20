//
//  SoundModel.swift
//  AmusementParkPassGeneratorPt2
//
//  Created by Bill Merickel on 10/15/16.
//  Copyright © 2016 Bill Merickel. All rights reserved.
//

import Foundation
import AudioToolbox

// Here are the two sounds for the swiper
var grantedSound: SystemSoundID = 0
var deniedSound: SystemSoundID = 1

// Paths to sound files
var grantedSoundURL: URL {
    let pathToGrantedSound = Bundle.main.path(forResource: "AccessGranted", ofType: "wav")!
    return URL(fileURLWithPath: pathToGrantedSound)
}
var deniedSoundURL: URL {
    let pathToDeniedSound = Bundle.main.path(forResource: "AccessDenied", ofType: "wav")!
    return URL(fileURLWithPath: pathToDeniedSound)
}

// And functions to play those sounds
func playGrantedSound(_ url: URL) {
    AudioServicesCreateSystemSoundID(url as CFURL, &grantedSound)
    AudioServicesPlaySystemSound(grantedSound)
}

func playDeniedSound(_ url: URL) {
    AudioServicesCreateSystemSoundID(url as CFURL, &deniedSound)
    AudioServicesPlaySystemSound(deniedSound)
}
