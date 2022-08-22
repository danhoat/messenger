//
//  RegisterViewController.swift
//  Messenger
//
//  Created by Dan Nguyen on 19/08/2022.
//

import UIKit

class RegisterViewController: UIViewController {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let emailField: UITextField = {
        let field = UITextField();
        field.autocapitalizationType = .none
        field.autocorrectionType = .no;
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        //field.leftView = UIView(frame: <#T##CGRect#>(x: 0, y:0, width: 5, height: 0))
        field.placeholder = "Email Address ..."
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: frame.size.height))
        field.leftView = paddingView
        field.leftViewMode = .always
        
        return field;
    
    }()
    private let firstNameField: UITextField = {
        let field = UITextField();
        field.autocapitalizationType = .none
        field.autocorrectionType = .no;
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "First Name"
 
        return field;
    
    }()
    private let lastNameField: UITextField = {
        let field = UITextField();
        field.autocapitalizationType = .none
        field.autocorrectionType = .no;
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Last Name"
 
        return field;
    
    }()
    private let passwordField: UITextField = {
        let field = UITextField();
        field.autocapitalizationType = .none
        field.autocorrectionType = .no;
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.leftViewMode = .always
        field.placeholder = "PassWord"
        field.isSecureTextEntry = true
        
        field.backgroundColor = .white
        return field;
    
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton();
       
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.backgroundColor = .systemGreen
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 12;
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        

 
        return button;
    
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Log In"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(didtabRegister))
        
        //view.addSubview(imageView)
        registerButton.addTarget(self,
                              action: #selector(registerButtonTapped),
                              for: .touchUpInside)
        emailField.delegate = self
        passwordField.delegate = self
        
        firstNameField.delegate = self
        lastNameField.delegate = self
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        
        scrollView.addSubview(firstNameField)
        scrollView.addSubview(lastNameField)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(registerButton)
        
        imageView.isUserInteractionEnabled = true
        scrollView.isUserInteractionEnabled = true;
        
        let gesture = UITapGestureRecognizer(target: self,
                                           action: #selector((didTabChangeProfilePic)))
        
        
        imageView.addGestureRecognizer(gesture)
        
        
    }
    @objc private func didTabChangeProfilePic(){
        print("change pic calles")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        let size = scrollView.width/3
        
        imageView.frame = CGRect(x: (scrollView.width-size)/2,
                                 y: 20,
                                 width: size,
                                 height: size)
        firstNameField.frame = CGRect(x: 30,
                                  y: imageView.botom+10,
                                 width: scrollView.width - 60,
                                 height: 52)
        lastNameField.frame = CGRect(x: 30,
                                  y: firstNameField.botom+10,
                                 width: scrollView.width - 60,
                                 height: 52)
        
        emailField.frame = CGRect(x: 30,
                                  y: lastNameField.botom+10,
                                 width: scrollView.width - 60,
                                 height: 52)
        passwordField.frame = CGRect(x: 30,
                                  y: emailField.botom + 10 ,
                                 width: scrollView.width - 60,
                                 height: 52)
        registerButton.frame = CGRect(x: 30,
                                  y: passwordField.botom  + 10,
                                 width: scrollView.width - 60,
                                 height: 52)
        
    }
    
    func alertUserRegisterError(){
        let alert = UIAlertController(title: " Wrong", message: "Please enter all information to register.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss",
                                      style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    @objc private func  registerButtonTapped(){
        
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let firstName = firstNameField.text,
              let lastName = lastNameField.text,
              let email = emailField.text,
            let password = passwordField.text,
              !firstName.isEmpty,
              !lastName.isEmpty,
              !email.isEmpty, !password.isEmpty else{
                  self.alertUserRegisterError()
                return
        }
    }
    
    @objc private func didtabRegister(){
        let vc = RegisterViewController()
        vc.title = "Create Account"
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension RegisterViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if( textField == emailField){
            passwordField.becomeFirstResponder()
        } else if textField == passwordField{
            registerButtonTapped()
        }
        return true
        
    }
}
