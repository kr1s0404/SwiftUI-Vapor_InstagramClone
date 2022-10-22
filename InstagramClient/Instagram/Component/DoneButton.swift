//
//  DoneButton.swift
//  Instagram
//
//  Created by Kris on 10/22/22.
//

import SwiftUI

struct DoneButton: View
{
    @FocusState var focused: Bool
    
    var body: some View
    {
        HStack
        {
            Spacer()
            Button {
                focused = false
            } label: {
                Text("完成")
            }
        }
    }
}

struct DoneButton_Previews: PreviewProvider
{
    static var previews: some View
    {
        DoneButton()
    }
}
