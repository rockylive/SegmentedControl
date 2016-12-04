<img src="https://raw.githubusercontent.com/IvanVorobei/SegmentedControl/master/resources/segmented-control - animated baner.gif">

## About
Custom SegmentedСontrol for ios on swift. Basic UISegmentedСontrol edit not weak and does not use the scroll, which will be added in this control

## How use
Create cell:

	let cell = SPSegmentedControlCell.init()
	cell.label.text = "Avenir"
	cell.imageView.image = UIImage.init(named: "imageName")
	cell.layout = .textWithImage

Create SegmentedСontrol:

	let segmentedСontrol = SPSegmentedControl.init()
	segmentedСontrol.add(cell: cell)

and set frame, add as subview

## Delegates
SPSegmentedControlCellStyleDelegate use for update state cell when it happen (tap on cell or scroll optional). SPSegmentedControlDelegate you can use for detect position IndicatorView in SegmentedControl for cool animation and UI

## Other
You can use storyboard for create SegmentedСontrol. In SegmentedControl you can edit IndicatorView for customization selected view on SegmentedControl

In the project you will find my library [Sparrow](https://github.com/IvanVorobei/Sparrow), it's what I use. But if needed, you can easily to remove it and do not use [Sparrow](https://github.com/IvanVorobei/Sparrow) in their projects 

## License
SPSegmentControl project is released under the MIT license. See LICENSE.md for details.

## Contact:
 
[http://hello.ivanvorobei.by](http://hello.ivanvorobei.by)

[http://ivanvorobei.by](http://ivanvorobei.by)

hello@ivanvorobei.by
