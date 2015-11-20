//
//  ViewController.h
//  BirdGenius3
//
//  Created by Lea Ingolds on 10/2/15.
//  Copyright © 2015 Pencilskirt Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) IBOutlet UIImageView *birdImageView;

@property (nonatomic) NSInteger index;

@property (nonatomic) NSDictionary *birdDict;

@property (strong, nonatomic) NSMutableArray *birdArray;

@property (strong, nonatomic) IBOutlet UILabel *latinName;

@property (strong, nonatomic) IBOutlet UILabel *photogName;


@end

