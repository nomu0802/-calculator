//
//  ContentView.swift
//  calculator
//
//  Created by 野村高志 on 2021/12/30.
//

import SwiftUI
import CoreData



struct ContentView: View {
    
    @State var resultScreen = "" // Textの内容を保存する変数
    @State private var colorRow = 0
    @State private var colorCol = 0
    @State private var value = false //色変えモードの切り替え
    
    @State var formulaMode = 0 //1足し算、2引き算、3掛け算、4割り算
    @State var inputFlag = 0
    
    @State var  inputNum = 0
    @State var  inputNum2 = 0
    
    @State var cheak = false
    @State var tes : [[Color]] = [[.gray,.gray,.gray,.orange],
                                  [.init(hue: 1.0, saturation: 0.0, brightness: 0.256),.init(hue: 1.0, saturation: 0.0, brightness: 0.256),.init(hue: 1.0, saturation: 0.0, brightness: 0.256),.orange],
                                  [.init(hue: 1.0, saturation: 0.0, brightness: 0.256),.init(hue: 1.0, saturation: 0.0, brightness: 0.256),.init(hue: 1.0, saturation: 0.0, brightness: 0.256),.orange],
                                  [.init(hue: 1.0, saturation: 0.0, brightness: 0.256),.init(hue: 1.0, saturation: 0.0, brightness: 0.256),.init(hue: 1.0, saturation: 0.0, brightness: 0.256),.orange],[.init(hue: 1.0, saturation: 0.0, brightness: 0.256),.init(hue: 1.0, saturation: 0.0, brightness: 0.256),.init(hue: 1.0, saturation: 0.0, brightness: 0.256),.orange]]
    
    
    @State var isChecked = [[false,false,false,false],
                            [false,false,false,false],
                            [false,false,false,false],
                            [false,false,false,false],
                            [false,false,false,false]]
    
    
    
    // Buttonで使うTextを配列にまとめる
    let inputItem = [["C","+/-","%","÷"],
                     ["7","8","9","x"],
                     ["4","5","6","-"],
                     ["1","2","3","+"],
                     ["","0","ac","="]]
    
    
    
    var body: some View {
        VStack {
            HStack{
                Toggle("色変えモード", isOn: $value).frame(width: 120)
                Spacer()
                if(value){
                    ColorPicker(
                        "",
                        selection: $tes[colorRow][colorCol]
                    ).onChange(of: tes[colorRow][colorCol], perform: { value in
                        allfalse()
                    })
                }
            }
            Spacer()
            Text(resultScreen) // ボタン入力のモニター
                .font(.largeTitle)
            Spacer()
            ForEach((0...4), id: \.self) { row in
                HStack{
                    ForEach((0...3), id: \.self){ col in
                        Button(action: {
                            if(value){
                                //色選択
                                allfalse()
                                toggle(row:row,col:col)
                                colorRow = row
                                colorCol = col
                                print(row)
                                print(col)
                            }else{
                                if(inputItem[row][col] == "+"){
                                    if(resultScreen == ""){
                                        resultScreen = "0"
                                    }
                                    inputNum = Int(resultScreen)!
                                    
                                    
                                    inputNum2 = 0
                                    inputFlag = 1
                                    formulaMode = 1
                                    allfalse()
                                    toggle(row:row,col:col)
                                } else if(inputItem[row][col] == "-"){
                                    if(resultScreen == ""){
                                        resultScreen = "0"
                                    }
                                    inputNum = Int(resultScreen)!
                                    
                                    
                                    inputNum2 = 0
                                    inputFlag = 1
                                    formulaMode = 2
                                    allfalse()
                                    toggle(row:row,col:col)
                                } else if(inputItem[row][col] == "x"){
                                    if(resultScreen == ""){
                                        resultScreen = "0"
                                    }
                                    inputNum = Int(resultScreen)!
                                    
                                    
                                    inputNum2 = 0
                                    inputFlag = 1
                                    formulaMode = 3
                                    allfalse()
                                    toggle(row:row,col:col)
                                } else if(inputItem[row][col] == "÷"){
                                    if(resultScreen == ""){
                                        resultScreen = "0"
                                    }
                                    inputNum = Int(resultScreen)!
                                    inputNum2 = 0
                                    inputFlag = 1
                                    formulaMode = 4
                                    allfalse()
                                    toggle(row:row,col:col)
                                }else if(inputItem[row][col] == "+/-"){
                                    resultScreen = String(Int(resultScreen)! * -1)
                                }else if(inputItem[row][col] == "%"){
                                    resultScreen = String(Double(resultScreen)! * 0.01)
                                } else if(inputItem[row][col] == "ac"){
                                    resultScreen = "0"
                                    inputNum = 0
                                    inputNum2 = 0
                                }else if(inputItem[row][col] == "="){
                                    if(inputNum2 == 0){
                                        inputNum2 = Int(resultScreen)!
                                    }else{
                                        inputNum = Int(resultScreen)!
                                    }
                                    allfalse()
                                    keisan()
                                    
                                }else if(inputItem[row][col] == "C"){
                                    resultScreen = "0"
                                } else{
                                    if(inputFlag == 1){
                                        resultScreen = ""
                                        inputFlag = 0
                                    }
                                    if(resultScreen == "0"){
                                        resultScreen = ""
                                    }
                                    resultScreen = resultScreen + inputItem[row][col]
                                }
                            }
                        }) {
                            ZStack{
                                Spacer()
                                if(isChecked[row][col]) {
                                    Circle()
                                        .fill(tes[row][col]).opacity(0.5)
                                        .frame(width: 90, height: 90)
                                } else {
                                    if(row == 4 && col == 1){
                                        RoundedRectangle(cornerSize: .init(width: 40, height: 40))
                                            .fill(tes[row][col])
                                            .frame(width: 180, height: 90)
                                    }else if(row == 4 && col == 0){
                                    }else{
                                        Circle()
                                            .fill(tes[row][col])
                                            .frame(width: 90, height: 90)
                                    }
                                }
                                Spacer()
                                Text(self.inputItem[row][col])
                                    .font(.largeTitle)
                                    .foregroundColor(Color.white)
                                Spacer()}
                        }
                    }
                }
            }
        }
        
        
    }
    
    func toggle(row: Int, col: Int) -> Void {
        isChecked[row][col] = !isChecked[row][col]
    }
    
    func allfalse() -> Void {
        for i in 0 ..< 5{
            for j in 0 ..< 4{
                if(isChecked[i][j]) {
                    isChecked[i][j] = false
                }
            }
        }
    }
    
    func keisan()  -> Void{
        if(self.formulaMode == 1){ //足し算
            resultScreen = String(inputNum + inputNum2)
        } else if(self.formulaMode == 2){ //引き算
            resultScreen = String(inputNum - inputNum2)
        }else if(self.formulaMode == 3){ //掛算
            resultScreen = String(inputNum * inputNum2)
        }else if(self.formulaMode == 4){ //割算
            resultScreen = String(inputNum / inputNum2)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
    
}


