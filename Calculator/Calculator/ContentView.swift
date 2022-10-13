//
//  ContentView.swift
//  Calculator
//
//  Created by wjc on 2022/10/13.
//

import SwiftUI

let scale: CGFloat = UIScreen.main.bounds.width / 414

typealias CalculatorState = CalculatorBrain
typealias CalculatorStateAction = CalculatorButtonItem

struct Reducer {
    static func reduce(
        state: CalculatorState,
        action: CalculatorStateAction
    ) -> CalculatorState
    {
        return state.apply(item: action)
    }
}

struct ContentView: View {
    let row: [CalculatorButtonItem] = [
        .digit(1), .digit(2), .digit(3), .op(.plus),]
    
//    @State private var brain: CalculatorBrain = .left("0")
    
//    @ObservedObject var model = CalculatorModel()
    @EnvironmentObject var model: CalculatorModel
    
    @State private var editingHistory = false
    
    var body: some View {
        
        VStack(spacing: 12) {
            Spacer()
            Button("操作履历:\(model.history.count)") {
                print(self.model.history)
                self.editingHistory = true
            }.sheet(isPresented: self.$editingHistory) {
                HistoryView(model: self.model)
            }

            Text(model.brain.output)
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24 * scale)
                .lineLimit(1)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .trailing)
            Button("Test") {
                self.model.brain = .left("1.23")
            }
//            CalculatorButtonPad(brain: $model.brain)
//            CalculatorButtonPad(model: model)
            CalculatorButtonPad()
                .padding(.bottom)
        }.scaleEffect(scale)
        
//        VStack(alignment: .center, spacing: 8) {
//            CalculatorButtonRow(row: [
//                .command(.clear), .command(.flip), .command(.percent), .op(.divide)])
//
//            CalculatorButtonRow(row: [
//                .digit(7), .digit(8), .digit(9), .op(.multiply)])
//
//            CalculatorButtonRow(row: [
//                .digit(4), .digit(5), .digit(6), .op(.minus)])
//
//            CalculatorButtonRow(row: [
//                .digit(1), .digit(2), .digit(3), .op(.plus)])
//
//            CalculatorButtonRow(row: [
//                .digit(0), .dot, .op(.equal)])
//        }
        
//        HStack {
//            ForEach(row, id:\.self) {item in
//                CalculatorButton(
//                    title: item.title,
//                    size: item.size,
//                    backgroundColorName: item.backgroundColorName) {
//                    print("Button:\(item.title)")
//                }
//            }
            
//            CalculatorButton(
//                title: "1",
//                size: CGSize(width: 88, height: 88),
//                backgroundColorName: "digitBackground") {
//                print("Button:1")
//            }
//
//            CalculatorButton(
//                title: "2",
//                size: CGSize(width: 88, height: 88),
//                backgroundColorName: "digitBackground") {
//                print("Button:2")
//            }
//            CalculatorButton(
//                title: "3",
//                size: CGSize(width: 88, height: 88),
//                backgroundColorName: "digitBackground") {
//                print("Button:3")
//            }
//            CalculatorButton(
//                title: "+",
//                size: CGSize(width: 88, height: 88),
//                backgroundColorName: "operatorBackground") {
//                print("Button:+")
//            }
//            Button {
//                print("Button:+")
//            } label: {
//                Text("+")
//    //            .font(.title)//将文本字体设置为 Font.title
//                .font(.system(size: 38))
//    //            .font(.custom("Copperplate", size: 48))
//                .foregroundColor(.white)
//                .frame(width: 88, height: 88, alignment: .center)
//    //            .background(Color.orange) //1
//    //            .padding()//padding 将把当前的 View 包裹在一个新的 View 里，并在四周填充空白部分。
//    //            .background(Color.blue) //2
//                .background(Color("operatorBackground"))
//                .cornerRadius(44)
//            }
//        }
        
        

    }
}

struct CalculatorButtonPad: View {
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip),
        .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
//    @Binding var brain: CalculatorBrain
//    var model: CalculatorModel
    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) { row in
//                CalculatorButtonRow(row: row, brain: self.$brain)
//                CalculatorButtonRow(row: row, model: self.model)
                CalculatorButtonRow(row: row)
            }
        }
    }
}

struct CalculatorButtonRow: View {
    let row: [CalculatorButtonItem]
//    @Binding var brain: CalculatorBrain
    @EnvironmentObject var model: CalculatorModel
    var body: some View {
        HStack {
            ForEach(row, id:\.self) { item in
                CalculatorButton(
                    title: item.title,
                    size: item.size,
                    backgroundColorName: item.backgroundColorName) {
                        print("Button:\(item.title)")
//                        self.brain = self.brain.apply(item: item)
                        self.model.apply(item)
                }
            }
        }
    }
}

struct CalculatorButton: View {
    
    let fontSize: CGFloat = 38
    let title: String
    let size: CGSize
    let backgroundColorName: String
    let action:() -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(.white)
                .frame(width: size.width, height: size.height, alignment: .center)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width * 0.5)
        }
    }
}

struct HistoryView: View {
    @ObservedObject var model: CalculatorModel
    var body: some View {
        VStack {
            // 1
            if model.totalCount == 0 {
                Text("没有履历")
            } else {
                HStack {
                Text("履历").font(.headline)
                Text("\(model.historyDetail)").lineLimit(nil)
            }
            HStack {
                Text("显示").font(.headline)
                Text("\(model.brain.output)")
            }
            // 2
            Slider(
                value: $model.slidingIndex,
                in: 0...Float(model.totalCount),
                step: 1
                )
            }
        }.padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environmentObject(CalculatorModel())
            ContentView()
                .environment(\.colorScheme, .dark)
            ContentView().previewDevice("iPhone SE (2nd generation)")
        }
    }
}
