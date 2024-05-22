import SwiftUI

struct AffirmationView: View {
    let affirmation: Affirmation
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("currentDay") var currentDay: Int = 1
    @AppStorage("currentStep") var currentStep: Int = 1

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(affirmation.background)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: geometry.size.width)
                
                VStack {
                    Text(affirmation.name)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.6))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    
                    Spacer()
                    
                    HStack(alignment: .top) {
                        Text("Цель")
                            .font(.title3)
                            .bold()
                            .padding(.top, 15)
                            .padding(.trailing, 15)
                            .shadow(color: .white, radius: 3, x: 0, y: 0)
                            .shadow(color: .white, radius: 3, x: 1, y: 1)
                            .shadow(color: .white, radius: 3, x: -1, y: -1)
                            .shadow(color: .white, radius: 3, x: 1, y: -1)
                            .shadow(color: .white, radius: 3, x: -1, y: 1)
                        
                        Text(affirmation.goal)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                            .padding(5)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(5)
                            .shadow(radius: 5)
                            .frame(maxWidth: geometry.size.width - 100, alignment: .leading) // Установите ширину блока цели с учетом отступов
                    }
                    .padding()
                    
                    Spacer()
                    
                    // Разделение текста аффирмации по точкам
                    let affirmationLines = affirmation.text.split(separator: ".").map { String($0).trimmingCharacters(in: .whitespaces) }
                    
                    Text("Аффирмация")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, -3)
                        .shadow(color: .white, radius: 3, x: 0, y: 0)
                        .shadow(color: .white, radius: 3, x: 1, y: 1)
                        .shadow(color: .white, radius: 3, x: -1, y: -1)
                        .shadow(color: .white, radius: 3, x: 1, y: -1)
                        .shadow(color: .white, radius: 3, x: -1, y: 1)
                    
                    VStack(alignment: .leading) {
                        ForEach(affirmationLines, id: \.self) { line in
                            Text(line)
                                .font(.callout)
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 5)
                                .frame(maxWidth: geometry.size.width, alignment: .leading)
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    HStack(alignment: .top) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Назад")
                                .font(.title3)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                        
                        Button(action: {
                            if currentDay < affirmationRepeatCount {
                                currentDay += 1
                            } else {
                                if currentStep < affirmationSteps.count {
                                    currentDay = 1
                                }
                                currentStep += 1
                            }
                            
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Запись")
                                .font(.title3)
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                    }
                }
                .padding(2)
            }
        }
    }
}

struct AffirmationView_Previews: PreviewProvider {
    static var previews: some View {
        AffirmationView(affirmation: affirmationQueen) // affirmationQueen или affirmationSteps[6].affirmation
    }
}
