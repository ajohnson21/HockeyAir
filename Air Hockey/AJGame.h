//
//  AJGame.h
//  Air Hockey
//
//  Created by Austen Johnson on 7/29/14.
//  Copyright (c) 2014 Austen Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

int x;
int y;
int computerScoreNumber;
int playerScoreNumber;

@interface AJGame : UIViewController
{
    IBOutlet UIImageView *ball;
    IBOutlet UIButton *startButton;
    IBOutlet UIImageView *player;
    IBOutlet UIImageView *computer;
    IBOutlet UILabel *playerScore;
    IBOutlet UILabel *computerScore;
    IBOutlet UILabel *winOrLose;
    IBOutlet UIButton *exit;
    
    NSTimer *timer;
}

-(IBAction)startButton:(id)sender;
-(void)ballMovement;
-(void)computerMovement;
-(void)collision;

@end
