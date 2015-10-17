//
//  ViewController.h
//  BirdGenius3
//
//  Created by Lea Ingolds on 10/2/15.
//  Copyright © 2015 Pencilskirt Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) IBOutlet UIImageView *birdImageView;

@property (nonatomic) NSInteger randomIndex;

@property (nonatomic) NSDictionary *birdDict;
@property (nonatomic) NSInteger index;
@property (strong, nonatomic) NSArray *myKeys;
@property (nonatomic) UIButton *answerButton;






@end

