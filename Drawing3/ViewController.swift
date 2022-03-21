//
//  ViewController.swift
//  Drawing3
//
//  Created by BSP Macbook on 3/21/22.
//

import UIKit

// New class canvas for build drawing
class Canvas: UIView {
    
    override func draw(_ rect: CGRect) {
        
        // Customize drawing
        super.draw(rect)
        // End Customize
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
//        // Here is the line
//        // Declare var start and end
//        let startPoint = CGPoint(x: 0, y: 0)
//        let endPoint = CGPoint(x: 100, y: 100)
//        // End declaring
//
//        // Declare local physicall
//        context.move(to: startPoint)
//        context.addLine(to: endPoint)
//        // End declaring
//        // End lining
        
        // Custom display of lines
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(5)
        context.setLineCap(.butt)
        // End customing
        
        lines.forEach { (line) in
            for (i, p) in line.enumerated() {
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
        }
        
        context.strokePath()
    }
    
    // Declare the line to show
//    var line = [CGPoint]()
    var lines = [[CGPoint]]()
    // End declaring
    
    // Start adding when touch it
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    // End starting
    
    // Track the finger when moving
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Declare co-ordinate
        guard let point = touches.first?.location(in: nil) else { return }
        // End declaring
        
        // Add point into line
        guard var lastLine = lines.popLast() else { return }
        lastLine.append(point)
//        line.append(point)
        // End Adding
        
        // Add lastline into biggest array
        lines.append(lastLine)
        // End adding
        
        setNeedsDisplay()
    }
    // End tracking
}
// End class

class ViewController: UIViewController {
    
    let canvas = Canvas()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(canvas)
        canvas.backgroundColor = .white
        canvas.frame = view.frame
    }
}

