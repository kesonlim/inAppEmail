//
//  inAppEmailViewController.h
//  inAppEmail
//
//  Created by Keson on 4/5/13.
//  Copyright (c) 2013 Keson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface inAppEmailViewController : UIViewController <MFMailComposeViewControllerDelegate>

- (IBAction)emailButton:(id)sender;

@end
