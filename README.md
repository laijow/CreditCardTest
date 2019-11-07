# Credit card check test app


Test application for validating a credit card number

## Usage

Download this repository and copy the "CreditCardCheck" folder to your project
```python
#import "CCCheck.h"

@interface ViewController ()

@property (nonatomic) CCValid * validator;

@end
```

In the viewWillAppear method init validator

```python

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    _validator = [CCValid new];

}

```
and in the delegate method UITextFiledDelegate call "creditCardValidWith"

```python

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSMutableString* cardString = [NSMutableString stringWithFormat:@"%@", textField.text];
    [cardString insertString:string atIndex:range.location];
    cardNumber = [cardString clearCardString];
    
    [_checkButton disabled:![_validator creditCardValidWith:cardNumber]];
    
    return true;
    
}

```
