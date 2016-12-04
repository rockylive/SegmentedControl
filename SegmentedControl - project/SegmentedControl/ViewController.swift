// The MIT License (MIT)
// Copyright © 2016 Ivan Vorobei (hello@ivanvorobei.by)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

class ViewController: UIViewController, SPSegmentControlCellStyleDelegate, SPSegmentControlDelegate {

    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var segmentedControl: SPSegmentedControl!
    @IBOutlet weak var secondSegmentedControl: SPSegmentedControl!
    @IBOutlet weak var thirdSegmentedControl: SPSegmentedControl!
    
    @IBOutlet weak var percentIndicatorViewLabel: UILabel!
    
    private let borderColor: UIColor = UIColor(hue: 1, saturation: 0, brightness: 1, alpha: 0.5)
    private let backgroundColor: UIColor = UIColor(hue: 1, saturation: 0, brightness: 1, alpha: 0.08)
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgImageView.addGrade(alpha: 0.5)
        
        for segmentedControl in [segmentedControl, secondSegmentedControl, thirdSegmentedControl] {
            segmentedControl?.layer.borderColor = self.borderColor.cgColor
            segmentedControl?.backgroundColor = self.backgroundColor
            segmentedControl?.styleDelegate = self
            segmentedControl?.delegate = self
        }
        
        //first segment control
        let xFirstCell = self.createCell(
            text: "Avenir",
            image: self.createImage(withName: "cloudy-day")
        )
        let xSecondCell = self.createCell(
            text: "Bebas",
            image: self.createImage(withName: "cloudy")
        )
        let xThirdCell = self.createCell(
            text: "Oswald",
            image: self.createImage(withName: "wind-sign")
        )
        for cell in [xFirstCell, xSecondCell, xThirdCell] {
            cell.layout = .textWithImage
            self.segmentedControl.add(cell: cell)
        }
        
        //second segment control
        let yFirstCell = self.createCell(
            text: "Avenir",
            image: self.createImage(withName: "cloudy-day")
        )
        yFirstCell.layout = .onlyText
        let ySecondCell = self.createCell(
            text: "Bebas",
            image: self.createImage(withName: "cloudy")
        )
        yFirstCell.layout = .textWithImage
        self.secondSegmentedControl.roundedRelativeFactor = 0.2
        self.secondSegmentedControl.add(cells: [yFirstCell, ySecondCell])
        
        //third segment control
        let zFirstCell = self.createCell(
            text: "Avenir",
            image: self.createImage(withName: "cloudy-day")
        )
        zFirstCell.layout = .onlyImage
        let zSecondCell = self.createCell(
            text: "Bebas",
            image: self.createImage(withName: "cloudy")
        )
        zSecondCell.layout = .onlyImage
        self.thirdSegmentedControl.isRoundedFrame = false
        self.thirdSegmentedControl.add(cells: [zFirstCell, zSecondCell])
    }
    
    private func createCell(text: String, image: UIImage) -> SPSegmentedControlCell {
        let cell = SPSegmentedControlCell.init()
        cell.label.text = text
        cell.label.font = UIFont(name: "Avenir-Medium", size: 13.0)!
        cell.imageView.image = image
        return cell
    }
    
    private func createImage(withName name: String) -> UIImage {
        return UIImage.init(named: name)!.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
    }
    
    func selectedState(segmentControlCell: SPSegmentedControlCell, forIndex index: Int) {
        SPAnimation.animate(0.1, animations: {
            segmentControlCell.imageView.tintColor = UIColor.black
        })
        
        UIView.transition(with: segmentControlCell.label, duration: 0.1, options: [.transitionCrossDissolve, .beginFromCurrentState], animations: {
            segmentControlCell.label.textColor = UIColor.black
        }, completion: nil)
    }
    
    func normalState(segmentControlCell: SPSegmentedControlCell, forIndex index: Int) {
        SPAnimation.animate(0.1, animations: {
            segmentControlCell.imageView.tintColor = UIColor.white
        })
        
        UIView.transition(with: segmentControlCell.label, duration: 0.1, options: [.transitionCrossDissolve, .beginFromCurrentState], animations: {
            segmentControlCell.label.textColor = UIColor.white
        }, completion: nil)
    }
    
    func indicatorViewRelativPosition(position: CGFloat, onSegmentControl segmentControl: SPSegmentedControl) {
        let percentPosition = position / (segmentControl.frame.width - position) / CGFloat(segmentControl.cells.count - 1) * 100
        let intPercentPosition = Int(percentPosition)
        self.percentIndicatorViewLabel.text = "scrolling: \(intPercentPosition)%"
    }
}

