//
//  Challenge1.swift
//  Challenges
//
//  Created by Youssif Hany on 09/03/2024.
//

import SwiftUI

struct Challenge1: View {
    @State var counter = 0
    var body: some View {
        ZStack{
            VStack{
                Stepper(
                    onIncrement: {
                        counter += 1
                        print("Counter:\(counter)")},
                    onDecrement: {
                        counter -= 1
                        print("Counter:\(counter)")
                    }) {
                        Text("Count")
                    }
                Text("Hello, World!")
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5)
                        .fill(Color.gray))
                    .overlay(Badge(count: counter))
            }
            .padding()
        }
    }
}

#Preview {
    Challenge1()
}

struct Badge: View {
    let count: Int

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.clear
            Text(String(count))
                .font(.system(size: 16))
                .padding(5)
                .background(Color.red)
                .clipShape(Circle())
                // custom positioning in the top-right corner
                .alignmentGuide(.top) { $0[.bottom] }
                .alignmentGuide(.trailing) { $0[.trailing] - $0.width * 0.25 }
        }
    }
}
