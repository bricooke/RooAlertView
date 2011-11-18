//
//  RooAlertView.m
//  AlertViewTest
//
//  Created by Brian Cooke on 11/18/11.
//  Copyright (c) 2011 roobasoft, LLC. All rights reserved.
//

#import "RooAlertView.h"

@implementation RooAlertView
@synthesize completionCallback = _completionCallback;
@synthesize alertView = _alertView;


+ (void) showWithTitle:(NSString *)aTitle message:(NSString *)aMessage clickedCallback:(RooAlertViewCallback)theCallback cancelButtonTitle:(NSString *)aCancelTitle otherButtonTitles:(NSString *)theOtherTitles, ...
{
    RooAlertView *rAV = [[RooAlertView alloc] init];
    rAV.completionCallback = theCallback;
    
    rAV.alertView = [[[UIAlertView alloc] initWithTitle:aTitle message:aMessage delegate:rAV cancelButtonTitle:aCancelTitle otherButtonTitles:nil] autorelease];
    
    if (theOtherTitles != nil) {
        [rAV.alertView addButtonWithTitle:theOtherTitles];
        va_list args;
        va_start(args, theOtherTitles);
        NSString *title = nil;
        while((title = va_arg(args, NSString*))) {
            [rAV.alertView addButtonWithTitle:title];
        }
        va_end(args);
    }
    
    [rAV.alertView show];
}


- (void) dealloc
{
    self.alertView = nil;
    [super dealloc];
}


- (void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    self.completionCallback(buttonIndex);
    [self release];
}

@end
