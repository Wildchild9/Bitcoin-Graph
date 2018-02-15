//
//  ViewController.swift
//  Graph Test
//
//  Created by Noah Wilder on 2018-02-13.
//  Copyright © 2018 Noah Wilder. All rights reserved.
//

import UIKit
import ScrollableGraphView


class ViewController: UIViewController, ScrollableGraphViewDataSource {
    
  
    

    let dates = Dates()
    let baseURL = "https://api.coindesk.com/v1/bpi/historical/close.json?start=2010-07-17&end="
    let format = DateFormatter()
//    var randomNumbers : [Double] = []
    var numberOfDates : Int = 0
    var arrayOfDates : [String] = []
    var valuesArray : [Double] = []
    var line0 : Double = 0
    var line1 : Double = 0
    var line2 : Double = 0
    var line3 : Double = 0
    var line4 : Double = 0
    var line5 : Double = 0
    var line6 : Double = 0
    var line7 : Double = 0
    var line8 : Double = 0
    var line9 : Double = 0
    var line10 : Double = 0
    var referenceLinesArray : [Double] = []

    
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var myGraph: ScrollableGraphView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.isEnabled = false
        Dates.getDatesBetweenInterval(Dates.dateFromString("2010-07-17"), Date()) { (finished, datesArray) in
            if finished {
                numberOfDates = datesArray.count
                arrayOfDates = datesArray
                let finalURL = baseURL + Date().formattedDate()
                
                getBitcoinDateArrayData(url: finalURL, dates: datesArray) { (isSuccess, datesValueArray) in
                    if isSuccess {
                        self.valuesArray = datesValueArray
                        print(self.valuesArray)
                        func tenth(_ num: Double) -> Double {
                            let oneTenth = self.valuesArray.max()! * 0.1
                            let myTenth = oneTenth * num
                            return myTenth
                        }
                        self.line0 = 0
                        self.line1 = tenth(1)
                        self.line2 = tenth(2)
                        self.line3 = tenth(3)
                        self.line4 = tenth(4)
                        self.line5 = tenth(5)
                        self.line6 = tenth(6)
                        self.line7 = tenth(7)
                        self.line8 = tenth(8)
                        self.line9 = tenth(9)
                        self.line10 = tenth(10)
                        self.referenceLinesArray = [self.line0, self.line1, self.line2, self.line3, self.line4, self.line5, self.line6, self.line7, self.line8, self.line9, self.line10]
                        self.button.isEnabled = true
                    self.makeGraphView(graph: self.myGraph)
                        
                    } else {
                        print("Graph failed to load data")
                    }
                }
                
            }
        }
//        let currentDate : String = Date().formattedDate()
//        let finalURL = baseURL + currentDate
//        let graphView = ScrollableGraphView(frame: myGraph.frame, dataSource: self as ScrollableGraphViewDataSource)
//        ///   var plotPoints : [Double] = []
//        Dates.printDatesBetweenInterval((Dates.dateFromString("2010-07-18")), Date()) { (finished, datesArray) in
//            if finished {
//                getBitcoinDateArrayData(url: finalURL, dates: datesArray) { (isSuccessful, datesValueArray) in
//                    if isSuccessful {
//
//
//                        for currentPlot in 1...datesArray.count {
//                            let linePlot = LinePlot(identifier: "\(datesArray[currentPlot - 1])") // Identifier should be unique for each plot.
//                            let referenceLines = ReferenceLines()
//
//                            graphView.addPlot(plot: linePlot)
//                            graphView.addReferenceLines(referenceLines: referenceLines)
//
//                        }
//                    }
//                }
//            }
//        }
//        view.addSubview(graphView)
        
    }
    
    /*
     Dates.printDatesBetweenInterval((Dates.dateFromString("2010-07-18")), Date()) { (finished, datesArray) in
     if finished {
     return datesArray.count
     getBitcoinDateArrayData(url: finalURL, dates: datesArray) { (isSuccessful, datesValueArray) in
     if isSuccessful {
     
     for currentPlot in 1...datesArray.count {
     let linePlot = LinePlot(identifier: "\(datesArray[currentPlot - 1])") // Identifier should be unique for each plot.
     let referenceLines = ReferenceLines()
     
     graphView.addPlot(plot: linePlot)
     graphView.addReferenceLines(referenceLines: referenceLines)
     
     }
     
     
     
     
     
     
     
     
     }
     }
     }
     
     
     }
 */
    
    func value(forPlot plot: Plot, atIndex pointIndex: Int) -> Double {
        // Return the data for each plot.
//        var returnArray : [Double] = []
//        let currentDate : String = Date().formattedDate()
//        let finalURL = baseURL + currentDate
//        returnDateValue(url: finalURL, initialDate: Dates.dateFromString("2010-07-18"), endDate: Date()) { (array: [Double]) in
//            returnArray = array
//        }
//        let retValue : Double = returnArray[pointIndex - 1]
//        return retValue
        /*
         var startDate = initialDate
         let calendar = Calendar.current
         var datesCount : Int = 0
         let fmt = DateFormatter()
         fmt.dateFormat = "yyyy-MM-dd"
         
         while startDate <= endDate {
         //    print(fmt.string(from: startDate))
         
         datesCount += 1
         startDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
         if startDate == endDate {
         return datesCount
         }
         }
 */
//        return randomNumbers[pointIndex]   // [Int(arc4random_uniform(50))]
        return valuesArray[pointIndex]
        
    }
    
    func label(atIndex pointIndex: Int) -> String {
        
//        var returnArray : [String] = []
//        returnDates(initialDate: Dates.dateFromString("2010-07-18"), endDate: Date()) {
//            (array) in
//            returnArray = array
//        }
//        let retValue : String = "\(returnArray[pointIndex - 1])"
//        return retValue
//        let mintString = NSAttributedString(string: "\(String(pointIndex))", attributes: [NSAttributedStringKey.foregroundColor : UIColor.mint])
       return arrayOfDates[pointIndex].monthYR()
//        return "\(String(pointIndex))"
    }
    
    func numberOfPoints() -> Int {
        
//        var retValue : Int = 0
//        returnNumberOfDates(initialDate: Dates.dateFromString("2010-07-18"), endDate: Date()){ (count) in
//                retValue = count
//            }
//        return retValue
        // return datesValueArray.count
//        return randomNumbers.count
        return numberOfDates - 1
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
//        randomNumbers = []
//        for _ in 1...51 {
//            randomNumbers.append(Double(arc4random_uniform(51)))
//        }
        myGraph.reload()
        
        
        // myGraph.reload()
//        let currentDate : String = Date().formattedDate()
//        let finalURL = baseURL + currentDate
//        let graphView = ScrollableGraphView(frame: myGraph.frame, dataSource: self as ScrollableGraphViewDataSource)
//
//        let linePlot = LinePlot(identifier: "line")
//        // Identifier should be unique for each plot.
//        linePlot.lineColor = .mint
//        linePlot.shouldFill = true
//        linePlot.fillType = .gradient
//
//        graphView.backgroundFillColor = .clear
//        graphView.backgroundColor = .clear
//        graphView.rightmostPointPadding = 50
//        graphView.leftmostPointPadding = 50
//        // linePlot.lineCurviness = 0.2 // Value between 0-1
//        graphView.bottomMargin = 1
//
//        linePlot.fillGradientStartColor = .mint
//        linePlot.fillGradientEndColor = .blackberry
//        linePlot.adaptAnimationType = .elastic
//        linePlot.lineStyle = ScrollableGraphViewLineStyle.smooth
//        linePlot.lineWidth = 1.25
//        let referenceLines = ReferenceLines()
//
//        referenceLines.referenceLineColor = .white //.strawberry
//        referenceLines.referenceLineLabelColor = .strawberry
//        referenceLines.referenceLineLabelFont = UIFont(name: "HelveticaNeue-Medium", size: 10)!
//        referenceLines.shouldShowLabels = true
//        referenceLines.shouldShowReferenceLines = true
//
//        referenceLines.referenceLineColor = UIColor.strawberry.withAlphaComponent(0.2) //UIColor.strawberry.withAlphaComponent(0.2)
//        referenceLines.dataPointLabelColor = UIColor.white //UIColor.strawberry
//        referenceLines.dataPointLabelFont = UIFont(name: "Futura-Medium", size: 12)
//
//        graphView.addPlot(plot: linePlot)
//        let dotPlot = DotPlot(identifier: "darkLineDot") // Add dots as well.
//        dotPlot.dataPointSize = 2
//        dotPlot.dataPointFillColor = .white //.strawberry
//
//        dotPlot.adaptAnimationType = ScrollableGraphViewAnimationType.elastic
//
//        graphView.rangeMin = 1
//        graphView.addPlot(plot: dotPlot)
//        graphView.addReferenceLines(referenceLines: referenceLines)
//        // myGraph.addSubview(graphView)
//        graphView.shouldRangeAlwaysStartAtZero = false
//        graphView.shouldAdaptRange = true
//        graphView.shouldAnimateOnAdapt = true
//        graphView.shouldAnimateOnStartup = true
//
//        self.view.addSubview(graphView)
        
        ///   var plotPoints : [Double] = []
        
       
            //                            let linePlot = LinePlot(identifier: "\(datesArray[currentPlot - 1])") // Identifier should be unique for each plot.
            //                            let referenceLines = ReferenceLines()
            //
            //                            graphView.addPlot(plot: linePlot)
//    Dates.printDatesBetweenInterval((Dates.dateFromString("2010-07-18")), Date()) { (finished, datesArray) in
//        if finished {
//            getBitcoinDateArrayData(url: finalURL, dates: datesArray) { (isSuccessful, datesValueArray) in
//                if isSuccessful {
//
//                    for currentPlot in 1...datesArray.count {
//                        let linePlot = LinePlot(identifier: "\(datesArray[currentPlot - 1])") // Identifier should be unique for each plot.
//                        let referenceLines = ReferenceLines()
//
//                        graphView.addPlot(plot: linePlot)
//                        graphView.addReferenceLines(referenceLines: referenceLines)
//
//                    }
//                    self.view.addSubview(graphView)
//                    self.myGraph.addSubview(graphView)
//
//
//                }
//            }
//        }

//    }
        
//        let graphView = ScrollableGraphView(frame: myGraph.frame, dataSource: self as! ScrollableGraphViewDataSource)
//
//        let linePlot = LinePlot(identifier: "line") // Identifier should be unique for each plot.
//        let referenceLines = ReferenceLines()
//        
//        graphView.addPlot(plot: linePlot)
//        graphView.addReferenceLines(referenceLines: referenceLines)
    }
    // Mark: - Make Graph Functions
    func makeGraphView(graph: ScrollableGraphView!) {
        let graphView = ScrollableGraphView(frame: graph.frame, dataSource: self as ScrollableGraphViewDataSource)
        
        let linePlot = LinePlot(identifier: "linePlot")
        let dotPlot = DotPlot(identifier: "dotPlot")
        let referenceLines = ReferenceLines()
        
        setupLinePlot(linePlot: linePlot, backgroundColour: .blackberry, lineColour: .mint)
        setupDotPlot(dotPlot: dotPlot, dataPointColour: .white)
        setupReferenceLines(referenceLines: referenceLines, dataPointColour: .white, referenceLineColour: .strawberry)
        setGraphViewAttributes(graphView: graphView)
        graphView.bouncesZoom = true
        finalizeGraph(graphView: graphView, linePlot: linePlot, dotPlot: dotPlot, referenceLines: referenceLines)
    }
    
    func setupLinePlot(linePlot: LinePlot, backgroundColour: UIColor, lineColour: UIColor) {
        linePlot.lineColor = lineColour // Line colour
        linePlot.lineWidth = 1.25 // Line width
        linePlot.lineStyle = ScrollableGraphViewLineStyle.smooth // Line Type
        linePlot.shouldFill = true // Line with fill? (Bool)
        linePlot.fillType = .gradient // Fill type
        linePlot.fillGradientStartColor = lineColour // Top gradient colour
        linePlot.fillGradientEndColor = backgroundColour // Bottom gradient colour
        linePlot.adaptAnimationType = .elastic // Line animation
        
        
    }
    
    func setupDotPlot(dotPlot: DotPlot, dataPointColour: UIColor) {
        dotPlot.dataPointSize = 2 // Dot size (norm 2)
        dotPlot.dataPointFillColor = dataPointColour // Dot colour
        dotPlot.adaptAnimationType = ScrollableGraphViewAnimationType.elastic // Dot animation
    }
    
    func setupReferenceLines(referenceLines: ReferenceLines, dataPointColour: UIColor, referenceLineColour: UIColor) {
        
        referenceLines.referenceLineColor = UIColor.strawberry.withAlphaComponent(0.2) // Colour and opacity of reference lines
        referenceLines.dataPointLabelColor = UIColor.white // Colour of x-axis labels
        referenceLines.referenceLineLabelColor = referenceLineColour // Colour of y-axis labels
        referenceLines.dataPointLabelFont = UIFont(name: "Futura-Medium", size: 12) // Font of x-axis labels
        referenceLines.referenceLineLabelFont = UIFont(name: "HelveticaNeue-Medium", size: 10)! // Font of y-axis labels
        
        // To utilize referenceLines.positionType, make sure that graphView.shouldAdaptRange is false
      //  referenceLines.positionType = ReferenceLinePositioningType.relative
       // referenceLines.absolutePositions = referenceLinesArray//[0,0.5,1]
        // absolute positions can be and number that fits within your data set
        // relative positions have to be a value from 0-1 (like percents)
       
        // referenceLines.includeMinMax = false // Show min and max reference lines? (Bool)
        referenceLines.referenceLinePosition = .right // Position of y-axis labels
       
        
        referenceLines.shouldShowLabels = true // Show y-axis labels? (Bool)
        referenceLines.shouldShowReferenceLines = true // Show refernce lines? (Bool)
        }
    
    func setGraphViewAttributes(graphView: ScrollableGraphView) {
        graphView.backgroundFillColor = .clear // Background colour (above)
        graphView.backgroundColor = .clear // Background colour (below)
        graphView.rightmostPointPadding = 25// Right spring padding space // 50
        graphView.leftmostPointPadding = 15 // Left spring padding space // 50
        
        graphView.bottomMargin = 1 // Space between bottom edge of graph and x-axis
        graphView.shouldRangeAlwaysStartAtZero = true // Y-axis start at zero? (Bool)
      //  graphView.dataPointSpacing = view.frame.size.width / CGFloat(valuesArray.count)
        graphView.shouldAdaptRange = true // Should abide by minimum and maximum user-set values for y-axis
        // If false, this also ensures that the y-axis values will not change while in use
        
//        if graphView.shouldAdaptRange == true {
//            graphView.rangeMax = value // Max value for y-axis
//            graphView.range = value // Min value for y-axis
//        }
        
        graphView.shouldAnimateOnAdapt = true // Should utilize animations while using graph? (Bool)
        graphView.shouldAnimateOnStartup = true // Should animate building of graph? (Bool)
    }
    
    func finalizeGraph(graphView: ScrollableGraphView, linePlot: LinePlot?, dotPlot: DotPlot?, referenceLines: ReferenceLines?) {
        if linePlot != nil { // Only runs if a linePlot is set for the graph
            graphView.addPlot(plot: linePlot!)
        }
        if dotPlot != nil { // Only runs if a dotPlot is set for the graph
            graphView.addPlot(plot: dotPlot!)
        }
        if referenceLines != nil { // Only runs if referenceLines are set for the graph
            graphView.addReferenceLines(referenceLines: referenceLines!)
        }
        self.view.addSubview(graphView) // Implement the graph
    }
    
}   // End of ViewController Class



//Mark: - Extensions

extension Date {
    func formattedDate() -> String {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        let returnString : String = String(format.string(from: self))
        return returnString
    }
}
extension UIColor {
    
    static let mint = #colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1)
    static let strawberry = #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)
    static let blackberry = #colorLiteral(red: 0.01428075787, green: 0, blue: 0.1081325635, alpha: 1)
    
}
extension Double {
    mutating func roundToTens(x : Double) -> Int {
        return 10 * Int(Darwin.round(x / 10.0))
    }
}
extension Int {
    func roundToTens(x : Double) -> Int {
        return 10 * Int(round(x / 10.0))
    }
}
extension String {
    func month() -> String {
        let date = Dates.dateFromString(self)
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        let returnValue = String(formatter.string(from: date))
        return returnValue
    }
}
extension String {
    func monthYR() -> String {
      //  let space = " "
        let date = Dates.dateFromString(self)
        let monthFormatter = DateFormatter()
        let yearFormatter = DateFormatter()
        monthFormatter.dateFormat = "MMM"
        yearFormatter.dateFormat = "YY"
        let month = String(monthFormatter.string(from: date)) // + space
        let year = String(yearFormatter.string(from: date))
        let returnValue = month + year
       
        return returnValue
    }
}

