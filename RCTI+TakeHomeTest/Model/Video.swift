//
//  Video.swift
//  RCTI+TakeHomeTest
//
//  Created by Abiyyu Firmansyah on 29/05/24.
//

import Foundation

struct Video: Identifiable, Codable, Hashable{
    let id: String
    let title: String
    let thumbnailUrl: String
    let duration: String
    let uploadTime: String
    let views: String
    let author: String
    let videoUrl: String
    let description: String
    let subscriber: String
}
