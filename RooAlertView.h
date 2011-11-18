//
//  RooAlertView.h
//  AlertViewTest
//
//  Created by Brian Cooke on 11/18/11.
//  Copyright (c) 2011 roobasoft, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RooAlertViewCallback)(NSInteger);


@interface RooAlertView : NSObject<UIAlertViewDelegate>

@property (nonatomic, copy) RooAlertViewCallback completionCallback;
@property (nonatomic, retain) UIAlertView *alertView;

+ (void) showWithTitle:(NSString *)aTitle message:(NSString *)aMessage clickedCallback:(RooAlertViewCallback)theCallback cancelButtonTitle:(NSString *)aCancelTitle otherButtonTitles:(NSString *)theOtherTitles, ... NS_REQUIRES_NIL_TERMINATION;

@end
