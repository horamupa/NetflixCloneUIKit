//
//  Movie.swift
//  NetflixCloneUIKit
//
//  Created by MM on 28.06.2023.
//

import Foundation

struct TrandingTitlesResponse: Codable {
    
    let results: [Title]
    
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int?
    let release_data: String?
    let vote_average: Double?
}

/*
 
 {
adult = 0;
"backdrop_path" = "/idChPXPU7PbQ6an7BWkbSVCw47P.jpg";
"genre_ids" =             (
 14,
 28,
 12
);
id = 455476;
"media_type" = movie;
"original_language" = en;
"original_title" = "Knights of the Zodiac";
overview = "When a headstrong street orphan, Seiya, in search of his abducted sister unwittingly taps into hidden powers, he discovers he might be the only person alive who can protect a reincarnated goddess, sent to watch over humanity. Can he let his past go and embrace his destiny to become a Knight of the Zodiac?";
popularity = "227.387";
"poster_path" = "/qW4crfED8mpNDadSmMdi7ZDzhXF.jpg";
"release_date" = "2023-04-27";
title = "Knights of the Zodiac";
video = 0;
"vote_average" = "6.4";
"vote_count" = 117;
}
 
 */
