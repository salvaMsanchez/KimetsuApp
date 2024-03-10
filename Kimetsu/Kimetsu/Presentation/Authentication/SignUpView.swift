//
//  SignUpView.swift
//  Kimetsu
//
//  Created by Salva Moreno on 10/3/24.
//

import SwiftUI

struct SignUpView: View {
    // MARK: - Properties -
    @Environment(\.dismiss) private var dismiss
    @FocusState private var textFieldsFocused: Bool
    
    // MARK: - Main -
    var body: some View {
        ZStack {
            
        }
    }
}

private struct SignUpForm: View {
    // MARK: - Properties -
    @FocusState var focusState: Bool
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var sessionViewModel: SessionViewModel
    @EnvironmentObject private var routeViewModel: RouteViewModel
    
    // MARK: - Main -
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 5) {
                Text("sign_up")
                    .font(.largeTitle)
                
                Text("sign_up_enter_data")
                    .font(.callout)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            
            VStack(spacing: 10) {
                HStack(spacing: 5) {
                    Image(.personCircleFill)
                        .font(.system(size: 38))
                        .foregroundColor(Color(.systemGray2))
                        .padding(2)
                    
                    TextField("sign_up_name_placeholder", text: $name)
                        .textContentType(.name)
                        .textInputAutocapitalization(.words)
                        .focused($focusState)
                }
                .background(
                    RoundedRectangle(cornerRadius: .infinity)
                        .fill(Color(.systemGray5))
                )
                
                HStack(spacing: 5) {
                    Image(.envelopeCircleFill)
                        .font(.system(size: 38))
                        .foregroundColor(Color(.systemGray2))
                        .padding(2)
                    
                    TextField("sign_up_email_placeholder", text: $email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .focused($focusState)
                }
                .background(
                    RoundedRectangle(cornerRadius: .infinity)
                        .fill(Color(.systemGray5))
                )
                
                HStack(spacing: 5) {
                    Image(.lockCircleFill)
                        .font(.system(size: 38))
                        .foregroundColor(Color(.systemGray2))
                        .padding(2)
                    
                    TextField("sign_up_password_placeholder", text: $password)
                        .textContentType(.password)
                        .textInputAutocapitalization(.never)
                        .focused($focusState)
                }
                .background(
                    RoundedRectangle(cornerRadius: .infinity)
                        .fill(Color(.systemGray5))
                )
            }
            
            VStack(spacing: 10) {
                Button {
                    Task {
                        do {
                            try await sessionViewModel
                                .signUp(name: name, email: email, password: password)
                            
                            routeViewModel.screen = .tabs
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    Text("sign_up")
                        .font(.headline)
                        .foregroundColor(Color(.systemBackground))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.label))
                        .cornerRadius(.infinity)
                }
                .buttonStyle(LoadingButton(isLoading: $sessionViewModel.isLoading))
                
                Button {
                    dismiss()
                } label: {
                    let noAccount = Text("sign_up_already_account")
                        .font(.subheadline)
                        .foregroundColor(Color(.systemGray))
                    
                    let signUp = Text("sign_up_sign_in")
                        .font(.subheadline)
                        .bold()
                    
                    Text("\(noAccount) \(signUp)")
                }
            }
        }
        .padding(.horizontal)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
            .sheet(isPresented: .constant(true)) {
                SignUpView()
                    .environmentObject(SessionViewModel())
            }
    }
}
