//
//  NetLayer.swift
//  becsdk
//
//  Created by Kalvyn Rasquinha on 11/15/15.
//  Copyright © 2015 Adobe Systems Inc. All rights reserved.
//

import UIKit

class NetLayer: NSObject {
    
    let behanceEndpoint = "https://api.behance.net"
    let behancePath = "/v2"
    let behanceProjectsPath = "/projects"
    let clientId = "FillInLater"
    
    let sessionConfig = NSURLSessionConfiguration.ephemeralSessionConfiguration()
    
/*
    let response = [
        "http_code" : 200,
        "projects" : [
            [
                "covers" : [
                    "115" : "https://a3.behance.net/img//covers/115-blocked.png",
                    "202" : "https://a3.behance.net/img//covers/202-blocked.png",
                    "230" : "https://a3.behance.net/img//covers/230-blocked.png",
                    "404" : "https://a3.behance.net/img//covers/404-blocked.png",
                    "original" : "https://a3.behance.net/img//covers/original-blocked.png"
                ],
                "fields" : [
                    "Fashion",
                    "Photography",
                    "Retouching"
                ],
                "name" : "Modeltest with Sofia",
                "owners" : [
                    [
                        "display_name" : "Thomas Agatz",
                    ]
                ],
            ],
            [
                "covers" : [
                    "115" : "https://mir-s3-cdn-cf.behance.net/projects/115/dad52230341405.561e7dbca86ee.jpg",
                    "202" : "https://mir-s3-cdn-cf.behance.net/projects/202/dad52230341405.561e7dbca86ee.jpg",
                    "230" : "https://mir-s3-cdn-cf.behance.net/projects/230/dad52230341405.561e7dbca86ee.jpg",
                    "404" : "https://mir-s3-cdn-cf.behance.net/projects/404/dad52230341405.561e7dbca86ee.jpg",
                    "original" : "https://mir-s3-cdn-cf.behance.net/projects/original/dad52230341405.561e7dbca86ee.jpg"
                ],
                "fields" : [
                    "Character Design",
                    "Illustration",
                    "Motion Graphics"
                ],
                "name" : "A bit of character animation",
                "owners" : [
                    [
                        "display_name" : "Emanuele Colombo",
                    ]
                ]
            ],
            [
                "covers" : [
                    "115" : "https://mir-s3-cdn-cf.behance.net/projects/115/b7640c31017051.Y3JvcCw4MjAsNjQyLDk4LDY.jpg",
                    "202" : "https://mir-s3-cdn-cf.behance.net/projects/202/b7640c31017051.Y3JvcCw4MjAsNjQyLDk4LDY.jpg",
                    "230" : "https://mir-s3-cdn-cf.behance.net/projects/230/b7640c31017051.Y3JvcCw4MjAsNjQyLDk4LDY.jpg",
                    "404" : "https://mir-s3-cdn-cf.behance.net/projects/404/b7640c31017051.Y3JvcCw4MjAsNjQyLDk4LDY.jpg",
                    "original" : "https://mir-s3-cdn-cf.behance.net/projects/original/b7640c31017051.Y3JvcCw4MjAsNjQyLDk4LDY.jpg"
                ],
                "fields" : [
                    "MakeUp Arts (MUA)",
                    "Fine Arts",
                    "Photography"
                ],
                "name" : "agency test with Kate",
                "owners" : [
                    [
                        "display_name" : "Marta Bevacqua",
                    ]
                ]
            ],
            [
                "covers" : [
                    "115" : "https://mir-s3-cdn-cf.behance.net/projects/115/c214c728723563.55d2000bdf327.jpg",
                    "202" : "https://mir-s3-cdn-cf.behance.net/projects/202/c214c728723563.55d2000bdf327.jpg",
                    "230" : "https://mir-s3-cdn-cf.behance.net/projects/230/c214c728723563.55d2000bdf327.jpg",
                    "404" : "https://mir-s3-cdn-cf.behance.net/projects/404/c214c728723563.55d2000bdf327.jpg",
                    "original" : "https://mir-s3-cdn-cf.behance.net/projects/original/c214c728723563.55d2000bdf327.jpg"
                ],
                "fields" : [
                    "Art Direction",
                    "Digital Art",
                    "Graphic Design"
                ],
                "name" : "Scoreboard Designs",
                "owners" : [
                    [
                        "display_name" : "Mustafa Bayral\\U0131",
                    ]
                ]
            ],
            [
                "covers" : [
                    "115" : "https://mir-s3-cdn-cf.behance.net/projects/115/8cae5529743937.Y3JvcCwxNzk0LDE0MDQsMzQsNjM.jpg",
                    "202" : "https://mir-s3-cdn-cf.behance.net/projects/202/8cae5529743937.Y3JvcCwxNzk0LDE0MDQsMzQsNjM.jpg",
                    "230" : "https://mir-s3-cdn-cf.behance.net/projects/230/8cae5529743937.Y3JvcCwxNzk0LDE0MDQsMzQsNjM.jpg",
                    "404" : "https://mir-s3-cdn-cf.behance.net/projects/404/8cae5529743937.Y3JvcCwxNzk0LDE0MDQsMzQsNjM.jpg",
                    "original" : "https://mir-s3-cdn-cf.behance.net/projects/original/8cae5529743937.Y3JvcCwxNzk0LDE0MDQsMzQsNjM.jpg"
                ],
                "fields" : [
                    "Art Direction",
                    "Illustration",
                    "Motion Graphics"
                ],
                "name" : "ENEM 2015 - animations",
                "owners" : [
                    [
                        "display_name" : "Leo Natsume"
                    ]
                ]
            ],
            [
                "covers" : [
                    "115" : "https://mir-s3-cdn-cf.behance.net/projects/115/74867e28726337.55cec94185900.jpg",
                    "202" : "https://mir-s3-cdn-cf.behance.net/projects/202/74867e28726337.55cec94185900.jpg",
                    "230" : "https://mir-s3-cdn-cf.behance.net/projects/230/74867e28726337.55cec94185900.jpg",
                    "404" : "https://mir-s3-cdn-cf.behance.net/projects/404/74867e28726337.55cec94185900.jpg",
                    "original" : "https://mir-s3-cdn-cf.behance.net/projects/original/74867e28726337.55cec94185900.jpg"
                ],
                "fields" : [
                    "Branding",
                    "Editorial Design",
                    "Graphic Design"
                ],
                "name" : "Comic Sans For Cancer | Campaign & Exhibition",
                "owners" : [
                    [
                        "display_name" : "Chris Flack"
                    ],
                    [
                        "display_name" : "Strategy Design & Advertising"
                    ]
                ]
            ],
            [
                "covers" : [
                    "115" : "https://mir-s3-cdn-cf.behance.net/projects/115/c3397328196961.55b3a3dc9f8ba.png",
                    "202" : "https://mir-s3-cdn-cf.behance.net/projects/202/c3397328196961.55b3a3dc9f8ba.png",
                    "230" : "https://mir-s3-cdn-cf.behance.net/projects/230/c3397328196961.55b3a3dc9f8ba.png",
                    "404" : "https://mir-s3-cdn-cf.behance.net/projects/404/c3397328196961.55b3a3dc9f8ba.png",
                    "original" : "https://mir-s3-cdn-cf.behance.net/projects/original/c3397328196961.55b3a3dc9f8ba.png"
                ],
                "fields" : [
                    "Digital Art",
                    "Landscape Design",
                    "Motion Graphics"
                ],
                "name" : "3DPixel Landscapes",
                "owners" : [
                    [
                        "display_name" : "Pierpaolo Mantuano"
                    ]
                ]
            ],
            [
                "covers" : [
                    "115" : "https://mir-s3-cdn-cf.behance.net/projects/115/72a2d031096049.Y3JvcCw2NjgsNTIzLDc0LDA.jpg",
                    "202" : "https://mir-s3-cdn-cf.behance.net/projects/202/72a2d031096049.Y3JvcCw2NjgsNTIzLDc0LDA.jpg",
                    "230" : "https://mir-s3-cdn-cf.behance.net/projects/230/72a2d031096049.Y3JvcCw2NjgsNTIzLDc0LDA.jpg",
                    "404" : "https://mir-s3-cdn-cf.behance.net/projects/404/72a2d031096049.Y3JvcCw2NjgsNTIzLDc0LDA.jpg",
                    "original" : "https://mir-s3-cdn-cf.behance.net/projects/original/72a2d031096049.Y3JvcCw2NjgsNTIzLDc0LDA.jpg"
                ],
                "fields" : [
                    "Icon Design",
                    "Illustration",
                    "Interaction Design"
                ],
                "name" : "ROGER VOICE",
                "owners" : [
                    [
                        "display_name" : "Fe Ribeiro"
                    ]
                ]
            ],
            [
                "covers" : [
                    "115" : "https://mir-s3-cdn-cf.behance.net/projects/115/0923c731076271.Y3JvcCwzMDY5LDI0MDIsMCww.jpg",
                    "202" : "https://mir-s3-cdn-cf.behance.net/projects/202/0923c731076271.Y3JvcCwzMDY5LDI0MDIsMCww.jpg",
                    "230" : "https://mir-s3-cdn-cf.behance.net/projects/230/0923c731076271.Y3JvcCwzMDY5LDI0MDIsMCww.jpg",
                    "404" : "https://mir-s3-cdn-cf.behance.net/projects/404/0923c731076271.Y3JvcCwzMDY5LDI0MDIsMCww.jpg",
                    "original" : "https://mir-s3-cdn-cf.behance.net/projects/original/0923c731076271.Y3JvcCwzMDY5LDI0MDIsMCww.jpg"
                ],
                "fields" : [
                    "Art Direction",
                    "Graphic Design",
                    "Web Design"
                ],
                "name" : "HEIMAT",
                "owners" : [
                    [
                        "display_name" : "Dennis de Vries"
                    ]
                ]
            ],
            [
                "covers" : [
                    "115" : "https://mir-s3-cdn-cf.behance.net/projects/115/2ebf6329480705.55f8191bb8f09.jpg",
                    "202" : "https://mir-s3-cdn-cf.behance.net/projects/202/2ebf6329480705.55f8191bb8f09.jpg",
                    "230" : "https://mir-s3-cdn-cf.behance.net/projects/230/2ebf6329480705.55f8191bb8f09.jpg",
                    "404" : "https://mir-s3-cdn-cf.behance.net/projects/404/2ebf6329480705.55f8191bb8f09.jpg",
                    "original" : "https://mir-s3-cdn-cf.behance.net/projects/original/2ebf6329480705.55f8191bb8f09.jpg"
                ],
                "fields" : [
                    "Branding",
                    "Editorial Design",
                    "Illustration"
                ],
                "name" : "Who Is Best For My App?",
                "owners" : [
                    [
                        "display_name" : "Patrick Mariathasan"
                    ],
                    [
                        "display_name" : "Burkhard M\\U00fcller"
                    ]
                ]
            ]
        ]
    ]
*/

    static let sharedInstance = NetLayer()
    
    func createCacheForResults() {
        let cachePath = "/MyCacheDirectory"
        
        let myPathList = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let myPath = myPathList[0]
        
        let bundleIdentifier = NSBundle.mainBundle().bundleIdentifier
        
        let fullCachePath = stringByAppendingPathComponent(stringByAppendingPathComponent(myPath, path: bundleIdentifier!), path: cachePath)
        NSLog("Cache path: %@\n", fullCachePath);
        
        let myCache = NSURLCache(memoryCapacity: 16384, diskCapacity: 268435456, diskPath: cachePath)
        sessionConfig.URLCache = myCache
        sessionConfig.requestCachePolicy = NSURLRequestCachePolicy.UseProtocolCachePolicy
    }
    
    func stringByAppendingPathComponent(base: String, path: String) -> String {
        
        let nsSt = base as NSString
        
        return nsSt.stringByAppendingPathComponent(path)
    }
    
    func getResultsForQuery(query: String, callback: (NSError?, NSDictionary?) -> Void) {
        let queryStr = behanceEndpoint + behancePath + behanceProjectsPath + "?q=" + query + "&client_id=" + clientId
        let queryUrl = NSURL(string: queryStr)
        
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: NSOperationQueue.mainQueue())

        let dataTask = session.dataTaskWithURL(queryUrl!) { (data, response, error) -> Void in
            
            if (response != nil) && (response!.isKindOfClass(NSHTTPURLResponse)) {
                
                let httpResponse = response as! NSHTTPURLResponse
                NSLog("%u", httpResponse.statusCode)
                
                switch (httpResponse.statusCode) {
                case 200: NSLog("Great success!")
                case 403: NSLog("Returned when your API key is invalid.")
                case 404: NSLog("Returned when you make a request to an endpoint that does not exist, or if you are requesting a specific thing that does not exist (such as a user).")
                case 429: NSLog("Returned when you have exceeded your rate limit.")
                case 500: NSLog("Something went wrong! Please file a ticket so we can investigate the problem.")
                case 503: NSLog("Behance is up, but overloaded with requests. Try again later.")
                default: NSLog("Unexpected status code")
                }
            }
            
            if error == nil {
                
                if data != nil {
                    
                    let jsonData = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
                    if (jsonData != nil) {
                        
                        let projects = jsonData as! NSDictionary
                        NSLog("%@", projects)
                        
                        callback(nil, projects)
                    } else {
                        callback(NSError.init(domain: "Behance CSDK", code: -1, userInfo: nil), nil)
                    }
                } else {
                    callback(NSError.init(domain: "Behance CSDK", code: -1, userInfo: nil), nil)
                }
            } else {
                callback(error, nil)
            }
        }
        
        dataTask.resume()
/*
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            callback(nil, self.response)
        }
*/
    }
    
    func getImageForUrl(url: String, callback: (NSError?, NSData?) -> Void) {
        let imageUrl = NSURL(string: url)
        
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: NSOperationQueue.mainQueue())
        
        let dataTask = session.dataTaskWithURL(imageUrl!) { (data, response, error) -> Void in
            
            if (response != nil) && (response!.isKindOfClass(NSHTTPURLResponse)) {
                
                let httpResponse = response as! NSHTTPURLResponse
                NSLog("%u", httpResponse.statusCode)
                
                switch (httpResponse.statusCode) {
                case 200: NSLog("Great success!")
                case 403: NSLog("Returned when your API key is invalid.")
                case 404: NSLog("Returned when you make a request to an endpoint that does not exist, or if you are requesting a specific thing that does not exist (such as a user).")
                case 429: NSLog("Returned when you have exceeded your rate limit.")
                case 500: NSLog("Something went wrong! Please file a ticket so we can investigate the problem.")
                case 503: NSLog("Behance is up, but overloaded with requests. Try again later.")
                default: NSLog("Unexpected status code")
                }
                
                if (httpResponse.statusCode != 200) {
                    callback(NSError.init(domain: "Behance CSDK", code: -1, userInfo: nil), nil)
                    return
                }
            }
            
            if error == nil {
                
                if data != nil {
                    callback(nil, data)
                } else {
                    callback(NSError.init(domain: "Behance CSDK", code: -1, userInfo: nil), nil)
                }
            } else {
                callback(NSError.init(domain: "Behance CSDK", code: -1, userInfo: nil), nil)
            }
        }
        
        dataTask.resume()
    }
}
