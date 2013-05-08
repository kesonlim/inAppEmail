//
//  http://www.youtube.com/watch?feature=endscreen&v=SHiir6ZrfYs&NR=1
//
//  inAppEmailViewController.m
//  inAppEmail
//
//  Created by Keson on 4/5/13.
//  Copyright (c) 2013 Keson. All rights reserved.
//


#import "inAppEmailViewController.h"

@interface inAppEmailViewController ()

@end

@implementation inAppEmailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self emailButton:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)emailButton:(id)sender {
    
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
        
        mail.mailComposeDelegate = self;
        
        [mail setSubject:@"Note2Self"];
        
        NSArray *toRecipients = [NSArray arrayWithObjects:@"kesonlim@gmail.com", nil];
        [mail setToRecipients:toRecipients];
        
        
        NSString *emailBody = @"Notes";
        [mail setMessageBody:emailBody isHTML:NO];
        
        mail.modalPresentationStyle = UIModalPresentationPageSheet;
        [self presentModalViewController:mail animated:NO];
        
        
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your Device Is Not Supported" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    
    
    
    
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{

    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Cancelled.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Message saved in drafts folder.");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Message has been sent.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Message not sent due to error.");
            break;
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    
    [self dismissModalViewControllerAnimated:YES];
}


@end



































