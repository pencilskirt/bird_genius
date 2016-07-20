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
@property (strong, nonatomic) IBOutlet UILabel *latinName;
@property (strong, nonatomic) IBOutlet UILabel *photogName;
@property (strong, nonatomic) IBOutlet UIImageView *birdImageView;

@property (nonatomic) NSInteger index;
@property (nonatomic) NSDictionary *birdDict;

@property (strong, nonatomic) NSMutableArray *birdArray;
@property (strong, nonatomic) NSMutableArray *bjl_shuffledArray;
@property (strong, nonatomic) NSArray *objects;

@property (nullable, strong, nonatomic) NSURL *imageFileURL;






- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer;

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer;

- (IBAction)handleDoubleTap:(UITapGestureRecognizer *)recognizer;

@end

