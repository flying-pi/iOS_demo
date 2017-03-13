//
//  Toster.swift
//  testLib
//
//  Created by Yura Braiko on 13.03.17.
//
//


public class Toster {
    private let name: String
    public  init(name: String) {
        self.name = name;
    }
    
    public func on() ->String {
        return "toster by name \(name) is work. Bzzzzz";
    }
}
