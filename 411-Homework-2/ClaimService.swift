//
//  ClaimService.swift
//  411-Homework-2
//
//  Created by Jake Hamo Work on 12/6/20.
//  Copyright © 2020 Jake Hamo Work. All rights reserved.
//

import Foundation

class Claim : Codable {
    var title : String
    var date : String
    
    init(title: String, date: String) {
        self.title = title
        self.date = date
    }
}

struct Response: Codable {
    var success: Bool
}

class ClaimService {
    
    func addPerson(pObj : Claim, success: @escaping (_ response: Claim) -> (), failure: @escaping () -> ()) {
        let requestUrl = "http://localhost:8020/ClaimsService/add"
        var request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        let jsonData : Data! = try! JSONEncoder().encode(pObj)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: jsonData) {
            (data, response, error) in
            if let resp = data {
                do {
                    let a = try JSONDecoder().decode(Response.self, from: resp)
                    print(a) // use the json here
                    success(Claim(title: "", date: ""))
                } catch {
                    failure()
                }
            } else if let respError = error {
                print("Server Error : \(respError)")
                failure()
            }
        }
        task.resume()
    }
}
