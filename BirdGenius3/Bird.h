//
//  Bird.h
//  BirdGenius3
//
//  Created by Lea Ingold on 10/27/15.
//  Copyright © 2015 Pencilskirt Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface Bird : NSObject

-(id)initWithImage:(UIImage *)image name:(NSString *)name latinName:(NSString *)latinName photogName:(NSString *)photogName;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *latinName;
@property (strong, nonatomic) NSString *photogName;
@end


