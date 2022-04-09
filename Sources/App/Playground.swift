//
//  File.swift
//  
//
//  Created by Anton Hibl on 4/8/22.
//

import Vapor

// Tea Brewer
func BrewTea()->Response.Body {
    let tea = Response.Body.init(string: """
        <html>
          <head>
            <style>
            html {
                width: 100%;
                height: 100%;
            }
            h1 {
                width: 100%;
                text-align: center;
            }
            p {
                width: 100%;
                text-align: center;
            }
            </style>
            <meta charset="utf-8">
            <meta http-equiv="Cache-Control" content="no-cache">
            <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
            <meta name="description" content="tea brewer for my vapor server">
            <meta property="og:type" content="website">
            <meta property="og:title" content="localhome">
            <meta property="og:description" content="tea brewer for my vapor server">
            <title>Vapor Teapot</title>
          </head>
          <body>
            <h1>brewing tea</h1>
            <p>this is a tea brewer page</p>
          </body>
        </html>
        """)
    return tea
}

// Homepage
func HomePage()->Response.Body {
    let homepage = Response.Body.init(string: """

""")
    return homepage
}

