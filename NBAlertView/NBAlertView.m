//
//  NBAlertView.m
//  NBAlertView
//
//  Created by Nanda Ballabh on 14/08/13.
//  Copyright (c) 2013 Monocept. All rights reserved.
//

#import "NBAlertView.h"

@interface NBAlertView()
@property (copy, nonatomic) NBCancelBlock  alertCancelBlock;
@property (copy, nonatomic) NBOtherBlock  alertOtherBlock;

@end

@implementation NBAlertView

@synthesize alertCancelBlock = _alertCancelBlock;
@synthesize alertOtherBlock = _alertOtherBlock;

- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
    
    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles,nil];
    if(self) {
    }
    return self;
}

+(void) showAlertWithTitle:(NSString*)title message:(NSString*)message cancelButtonTitle:(NSString*)cancelButtonTitle cancelBlock:(NBCancelBlock)cancelBlock otherButtontitle:(NSString*)otherButtontitle otherBlock:(NBOtherBlock)otherBlock {
    
    NBAlertView *alert = [[NBAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtontitle, nil];
    [alert setAlertCancelBlock:cancelBlock];
    [alert setAlertOtherBlock:otherBlock];
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{[alert show];}];
}

#pragma mark -
#pragma mark UIAlertView Delegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    //only supporting 1 or 2 button alerts.
    if (buttonIndex == 0) {
        
        if (self.alertCancelBlock)
            self.alertCancelBlock();
    }
    
    if (buttonIndex == 1) {
        
        if (self.alertOtherBlock)
            self.alertOtherBlock();
    }
}

@end
