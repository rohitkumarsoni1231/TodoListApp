//
//  ListRowView.swift
//  TodoListApp
//
//  Created by Rohit Kumar on 27/11/2023.
//

import SwiftUI

struct ListRowView: View {
    
    let item : ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title3)
        .padding(.vertical , 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
   static var item1 = ItemModel(title: "1st Item!", isCompleted: false)
    static var item2 = ItemModel(title: "2nd Item!", isCompleted: true)

    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
        
    }
}
