//
//  Bird.m
//  BirdGenius3
//
//  Created by Lea Ingold on 10/27/15.
//  Copyright © 2015 Pencilskirt Studio. All rights reserved.
//

#import "Bird.h"


@implementation Bird

-(id)initWithImageURL:(NSString *)image name:(NSString *)name latinName:(NSString *)latinName photogName:(NSString *)photogName
{
    if(self = [super init]) {
        
        self.name = name;
        self.latinName = latinName;
        self.photogName = photogName;
        NSURL *imageURL = [NSURL URLWithString:image];
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        self.image = [UIImage imageWithData:imageData];
        
    }
    return self;
}


@end
