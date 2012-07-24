//
//  AmslerGridImageView.m
//  EyeTest
//
//  Created by 叶 夏 on 07/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AmslerGridImageView.h"

@implementation AmslerGridImageView
@synthesize drawImage,redArray;

-(id)initWithImage:(UIImage *)image{
    self=[super init];
    if (self){
        self.drawImage=image;
        self.redArray=[[NSMutableArray alloc] init];
    }
    return self;
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint pt = [[touches anyObject] locationInView:self];
    CGFloat drawX= (CGFloat) ((int)(pt.x/70)*70);
    CGFloat drawY= (CGFloat) ((int)(pt.y/70)*70);
    CGPoint point= CGPointMake(drawX, drawY);

    for(int i=0;i<redArray.count;i++){
        CGPoint point;
        point = [(NSValue *)[redArray objectAtIndex:i] CGPointValue];
        if (point.x==drawX&&point.y==drawY) {
            [redArray removeObject:[NSValue value:&point withObjCType:@encode(CGPoint)]];
            break;
        }
    }
    [redArray addObject:[NSValue value:&point withObjCType:@encode(CGPoint)]];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [drawImage drawAtPoint:CGPointMake(0, 0)];
    if (redArray!= nil&&redArray.count>0){
        for(int i=0;i<redArray.count;i++){
            CGPoint point;
            point = [(NSValue *)[redArray objectAtIndex:i] CGPointValue];
            CGContextRef context= UIGraphicsGetCurrentContext();
            CGContextSetLineWidth(context, 2.0);
            CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
            CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
            CGRect redRect= CGRectMake(point.x+8, point.y+8, 60, 60);
            CGContextAddRect(context, redRect);
            CGContextDrawPath(context, kCGPathFillStroke);
        }

    }
}

- (void)dealloc {
    [drawImage release];
    [redArray release];
    [super dealloc];
}
@end
