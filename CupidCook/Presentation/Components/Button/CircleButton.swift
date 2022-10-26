//
//  CircleButton.swift
//  TinderCook
//
//  Created by Joni Gonzalez on 25/10/2022.
//

import SwiftUI

struct CircleButton: View {
    let name: String
    let color: Color
    let sizeByPriority: CircleSizePriority
    let action: () -> Void
    
    var body: some View {
        
        Button(action: self.action) {
            Image(systemName: name)
                .font(.system(size: self.sizeByPriority.getSize(),
                              weight: .bold))
                .foregroundColor(.white)
                .shadow(radius: 5)
                .padding(self.sizeByPriority.getPadding())
                .background(self.color)
                .clipShape(Circle())
        }
        
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(name: "arrowshape.turn.up.backward",
                     color: Color.gray,
                     sizeByPriority: .medium) {
            print("Button demo")
        }
    }
}

public enum CircleSizePriority {
    case low
    case medium
    case high
    
    func getSize() -> CGFloat {
        switch self {
        case .low:
            return 15.0
        case .medium:
            return 18.0
        case .high:
            return 20.0
        }
    }
    
    func getPadding() -> CGFloat {
        switch self {
        case .low:
            return 13.0
        case .medium:
            return 15.0
        case .high:
            return 18.0
        }
    }
}
