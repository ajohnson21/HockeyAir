//
//  AJGame.m
//  Air Hockey
//
//  Created by Austen Johnson on 7/29/14.
//  Copyright (c) 2014 Austen Johnson. All rights reserved.
//

#import "AJGame.h"

@interface AJGame ()

@end

@implementation AJGame

-(void)collision
{
    if (CGRectIntersectsRect(ball.frame, player.frame)) {
        y = arc4random() %5;
        y = 0 - y;
    }
    
    if (CGRectIntersectsRect(ball.frame, computer.frame)) {
        y = arc4random() %5;
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * drag = [[event allTouches] anyObject];
    player.center = [drag locationInView:self.view];
    
    if (player.center.y > 528) {
        player.center = CGPointMake(player.center.x, 528);
    }
    
    if (player.center.y < 528) {
        player.center = CGPointMake(player.center.x, 528);
    }
    
    if (player.center.x < 37) {
        player.center = CGPointMake(37, player.center.y);
    }
    
    if (player.center.x > 283) {
        player.center = CGPointMake(283, player.center.y);
    }
}

-(void)computerMovement
{
    if (computer.center.x > ball.center.x) {
        computer.center = CGPointMake(computer.center.x - 2, computer.center.y);
    }
    
    if (computer.center.x < ball.center.x) {
        computer.center = CGPointMake(computer.center.x + 2, computer.center.y);
    }
    
    if (computer.center.x < 37) {
        computer.center = CGPointMake(37, computer.center.y);
    }
    
    if (computer.center.x > 283) {
        computer.center = CGPointMake(283, computer.center.y);
    }

}

-(IBAction)startButton:(id)sender
{
    startButton.hidden = YES;
    exit.hidden = YES;
    
    y = arc4random() %11;
    y = y - 5;
    
    x = arc4random() %11;
    x = x - 5;
    
    if (y == 0) {
        y = 1;
    }
    
    if (x == 0) {
        x = 1;
    }
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(ballMovement) userInfo:nil repeats:YES];
}

-(void)ballMovement
{
    [self computerMovement];
    [self collision];
    
    ball.center = CGPointMake(ball.center.x + x, ball.center.y + y);
    
    if (ball.center.x < 15) {
        x = 0 - x;
    }
    
    if (ball.center.x > 305) {
        x = 0 - x;
    }
    
    if (ball.center.y < 0) {
        playerScoreNumber = playerScoreNumber + 1;
        playerScore.text = [NSString stringWithFormat:@"%i", playerScoreNumber];
        
        [timer invalidate];
        startButton.hidden = NO;
        ball.center = CGPointMake(160, 239);
        computer.center = CGPointMake(160, 32);
        
        if (playerScoreNumber == 10) {
            startButton.hidden = YES;
            exit.hidden = NO;
            winOrLose.hidden = NO;
            winOrLose.text = [NSString stringWithFormat:@"YOU WIN!"];
        }
    }
    
    if (ball.center.y > 580) {
        computerScoreNumber = computerScoreNumber + 1;
        computerScore.text =[NSString stringWithFormat:@"%i", computerScoreNumber];
        
        [timer invalidate];
        startButton.hidden = NO;
        ball.center = CGPointMake(160, 239);
        computer.center = CGPointMake(160, 32);
        
        if (computerScoreNumber == 10) {
            startButton.hidden = YES;
            exit.hidden = NO;
            winOrLose.hidden = NO;
            winOrLose.text = [NSString stringWithFormat:@"YOU LOSE!"];
        }
    }
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    playerScoreNumber = 0;
    computerScoreNumber = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
