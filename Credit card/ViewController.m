//
//  ViewController.m
//  Credit card
//
//  Created by User on 06.11.2019.
//  Copyright © 2019 Yem Anatoly. All rights reserved.
//

#import "ViewController.h"
#import "ServerManager.h"
#import "CheckButton.h"
#import "CCCheck.h"

@interface ViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *schemeDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryDecsriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *bankDescriptionLabel;
@property (weak, nonatomic) IBOutlet CheckButton *checkButton;
@property (weak, nonatomic) IBOutlet UITextField *cardNumberTextFiled;
@property (nonatomic) CCValid * validator;
@property (nonatomic) CardItem * item;

@end

@implementation ViewController

NSString * cardNumber;

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self addTapToView];
    [_checkButton disabled:true];
    
    _validator = [CCValid new];
    _cardNumberTextFiled.delegate = self;
    
}

- (void)addTapToView {
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyBoardHide)];
    [self.view addGestureRecognizer:tap];
    
}

- (void)keyBoardHide {
    
    [[UIApplication sharedApplication].keyWindow endEditing:true];
    
}

- (void)updateDataWith:(BOOL)isSuccess {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if(isSuccess) {
            self.schemeDescriptionLabel.text = self.item.scheme;
            self.typeDescriptionLabel.text = self.item.type;
            self.countryDecsriptionLabel.text = self.item.country;
            self.bankDescriptionLabel.text = self.item.bank;
        } else {
            self.schemeDescriptionLabel.text = @"?";
            self.typeDescriptionLabel.text = @"?";
            self.countryDecsriptionLabel.text = @"?";
            self.bankDescriptionLabel.text = @"?";
        }
    });
    
}

- (void)showErrorAlertWith:(NSString*)text {
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                    message:text
                                                             preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Ok"
                                              style:UIAlertActionStyleDefault
                                            handler:nil]];
    
    [self presentViewController:alert
                       animated:true
                     completion:nil];
    
}

- (IBAction)checkCardTapped:(id)sender {
    
    [[ServerManager sharedManager] getCardInfoWithCardNumber:cardNumber onSuccess:^(CardItem *card) {
        self.item = card;
        [self updateDataWith:true];
    } onFailure:^(NSError *error) {
        [self showErrorAlertWith:error.localizedDescription];
        [self updateDataWith:false];
    }];
    
}

#pragma marl - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSMutableString* cardString = [NSMutableString stringWithFormat:@"%@", textField.text];
    [cardString insertString:string atIndex:range.location];
    cardNumber = [cardString clearCardString];
    
    [_checkButton disabled:![_validator creditCardValidWith:cardNumber]];
    
    return true;
    
}



@end
