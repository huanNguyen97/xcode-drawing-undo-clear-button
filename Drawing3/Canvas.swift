//
//  Canvas.swift
//  Drawing3
//
//  Created by BSP Macbook on 3/24/22.
//

import Foundation
import UIKit


// New class canvas for build drawing
class Canvas: UIView {
    
    // public function to read Undo function
    func undo() {
        _ = lines.popLast()
        setNeedsDisplay()
    }
    // End func
    
    // public function to read Clear function
    func clear() {
        lines.removeAll()
        setNeedsDisplay()
    }
    // End func
    
    // Declare the line to show, adding fileprivate if needed
    fileprivate var lines = [[CGPoint]]()
    // End declaring
    
    override func draw(_ rect: CGRect) {
        
        // Customize drawing
        super.draw(rect)
        // End Customize
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
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
        // End Adding
        
        // Add lastline into biggest array
        lines.append(lastLine)
        // End adding
        
        setNeedsDisplay()
    }
    // End tracking
}
// End class
