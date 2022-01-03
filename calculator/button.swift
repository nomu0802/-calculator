//
//  button.swift
//  calculator
//
//  Created by 野村高志 on 2021/12/30.
//

import SwiftUI

struct button: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.orange)
                .frame(width: 200, height: 100)
            Text("13")
                .font(.system(size: 50,  design: .default))
                .foregroundColor(Color.white)

        }
    }
}

struct button_Previews: PreviewProvider {
    static var previews: some View {
        button()
    }
}
