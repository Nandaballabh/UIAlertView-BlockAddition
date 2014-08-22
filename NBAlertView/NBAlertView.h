//
//  NBAlertView.h
//  NBAlertView
//
//  Created by Nanda Ballabh on 14/08/13.
//  Copyright (c) 2013 Monocept. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NBCancelBlock)(void);
typedef void(^NBOtherBlock)(void);


@interface NBAlertView : UIAlertView<UIAlertViewDelegate>

+(void) showAlertWithTitle:(NSString*)title message:(NSString*)message cancelButtonTitle:(NSString*)cancelButtonTitle cancelBlock:(NBCancelBlock)cancelBlock otherButtontitle:(NSString*)otherButtontitle otherBlock:(NBOtherBlock)otherBlock;

@end
