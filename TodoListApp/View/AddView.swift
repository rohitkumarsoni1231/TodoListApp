//
//  AddView.swift
//  TodoListApp
//
//  Created by Rohit Kumar on 27/11/2023.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationModel
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
   
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type Something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(uiColor: UIColor.systemGray5))
                    .cornerRadius(10)
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 52)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }.padding(.top, 50)
            }.padding(12)
            
            
        }
        .navigationTitle("Add an Item 🖋️")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButtonPressed() {
        if checkCharacterLength() {
            listViewModel.addItem(title: textFieldText)
            presentationModel.wrappedValue.dismiss()
        }
    }
    
    func checkCharacterLength() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Title should be greater than 3 characters!!! 😨😰😱"
            showAlert.toggle()
            return false
        } else {
            return true
        }
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
