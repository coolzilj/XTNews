//
//  MCTopAligningLabel.m
//  MCTopAligningLabel
//
//  Created by Baglan on 11/29/12.
//  Copyright (c) 2012 MobileCreators. All rights reserved.
//

#import "MCTopAligningLabel.h"

@implementation MCTopAligningLabel

- (void)setText:(NSString *)text
{
    [super setText:text];
    [self setNeedsLayout];
}

// http://stackoverflow.com/questions/24510596/xcode6-ios8-and-voidlayoutsubviews
// http://stackoverflow.com/questions/25789854/layoutsubviews-in-infinite-loop-on-ios-8-gm
// BUG: 估计是在 layoutSubviews 里调用 setFrame 触发了 layoutSubviews 造成了死循环。

//- (void)layoutSubviews
//{
//    CGSize size = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(self.bounds.size.width, CGFLOAT_MAX)];
//    CGAffineTransform transform = self.transform;
//    self.transform = CGAffineTransformIdentity;
//    CGRect frame = self.frame;
//    frame.size.height = size.height;
//    self.frame = frame;
//    self.transform = transform;
//    
//    [super layoutSubviews];
//}

- (void)didAddSubview:(UIView *)subview {
    CGSize size = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(self.bounds.size.width, CGFLOAT_MAX)];
    CGAffineTransform transform = self.transform;
    self.transform = CGAffineTransformIdentity;
    CGRect frame = self.frame;
    frame.size.height = size.height;
    self.frame = frame;
    self.transform = transform;
}

@end
