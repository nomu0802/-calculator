//
//  colorSetting.swift
//  calculator
//
//  Created by 野村高志 on 2021/12/31.
//

import SwiftUI

struct colorSetting: View {

    @State private var selectedColor = Color.black
    @State var resultScreen = "" // Textの内容を保存する変数
        // Buttonで使うTextを配列にまとめる
        let inputItem = [["C","+/-","%","÷"],
                         ["7","8","9","x"],
                         ["4","5","6","-"],
                         ["1","2","3","+"],
                         ["0","ac",".","="]]
        
        var body: some View {
            VStack{
                
                ZStack{
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "gear")
                    
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(0.0)
                
             
                }
            VStack {
                Spacer()
                Text(resultScreen) // ボタン入力のモニター
                    .font(.largeTitle)
                Spacer()
                ForEach((0...4), id: \.self) { row in
                    HStack{
                        ForEach((0...3), id: \.self){ col in
                     
                                
                                Button(action: {
                                    ColorPicker(
                                            "Pick a color",
                                            selection: $selectedColor
                                          )
                                }){
                                    ZStack{
                                        if(col == 3){
                                            Circle()
                                            .fill(Color.orange)
                                            .frame(width: 90, height: 90)
                                        }
                                        else if(row == 0){
                                            Circle()
                                            .fill(Color.gray)
                                            .frame(width: 90, height: 90)
                                        }
                                        else{
                                            Circle()
                                                .fill(Color(hue: 1.0, saturation: 0.0, brightness: 0.256))
                                            .frame(width: 90, height: 90)
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
            }
        
}

struct colorSetting_Previews: PreviewProvider {
    static var previews: some View {
        colorSetting()
    }
}
