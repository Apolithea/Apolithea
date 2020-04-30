//
//  Song.swift
//  NewAPolithea
//
//  Created by Fabian Cooper on 4/14/20.
//  Copyright © 2020 Fabian Cooper. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON



class Song {
    
    struct SongData {
        var id: String
        var name: String
        var artist: String
        var duration: String
        var durationInSeconds: Double
        var imageURL: String
        var songURL: String
    }
    
    
    var songArray = [SongData]()
    var searchURL: String!
    var mood: Float = 0.0
    
    var validURL = true
    
    
    func getSongDetails(completed: @escaping () -> ()) {
        let auth = SPTAuth.defaultInstance()!
        
        //empty array after each search request
        var midSongArray = [SongData]()
        songArray = []
        
        Alamofire.request(searchURL, method: .get, parameters: ["q":"", "type":"track"], encoding: URLEncoding.default, headers: ["Authorization": "Bearer " + auth.session.accessToken]).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let JSONSongsArray = json["tracks"]["items"]
                let numberOfSongs = JSONSongsArray.count
                
                //if query is invalid let user know and tell them to try again
                if numberOfSongs == 0 {
                    self.showAlert()
                    print("Please try another search query.")
                    return
                }
                
                for index in 0...numberOfSongs-1 {
                    
                    let songId = json["tracks"]["items"][index]["id"].stringValue
                    
                    let name = json["tracks"]["items"][index]["name"].stringValue
                    
                    let artist = json["tracks"]["items"][index]["album"]["artists"][0]["name"].stringValue
                    
                    let durationInMS = json["tracks"]["items"][index]["duration_ms"].doubleValue
                    let durationInSeconds = Int(durationInMS).msToSeconds
                    let duration = durationInSeconds.minuteSecondMS
                    
                    let imageURL = json["tracks"]["items"][index]["album"]["images"][0]["url"].stringValue
                    
                    let songURL = json["tracks"]["items"][index]["uri"].stringValue
                    
                    
                    midSongArray.append(SongData(id: songId, name: name, artist: artist, duration: duration, durationInSeconds: durationInSeconds, imageURL: imageURL, songURL: songURL))

                }
                
                
            case .failure(let error):
                print("ERROR: \(error) failed to get data from url \(self.searchURL)")
            }
            
            for song in midSongArray{

                Alamofire.request("https://api.spotify.com/v1/audio-features/\(song.id)", headers: ["Authorization": "Bearer " + auth.session.accessToken]).responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        
                        let valence = json["valence"].floatValue
                        
                        if abs((valence * 100)-(self.mood * 100)) <= 10{
                            self.songArray.append(song)
                        }
                    
                    case .failure(_):
                        print("failed")
                    }
                    completed()
                }
            }
        }
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "No search results found", message: "Please try another search keyword.", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
    }
    
}

//used to convert song duration from ms to minutes
extension TimeInterval {
    var minuteSecondMS: String {
        return String(format:"%d:%02d", minute, second)
    }
    var minute: Int {
        return Int((self/60).truncatingRemainder(dividingBy: 60))
    }
    var second: Int {
        return Int(truncatingRemainder(dividingBy: 60))
    }
}

extension Int {
    var msToSeconds: Double {
        return Double(self) / 1000
    }
}

extension UIApplication {
    static func topViewController(base: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        
        return base
    }
}

