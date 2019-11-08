//
//  Test.m
//  AutoRefreshUI
//
//  Created by demo on 2019/11/6.
//  Copyright © 2019 demo. All rights reserved.
//

#import "Test.h"
#import <MyLayout/MyLayout.h>

IB_DESIGNABLE
@implementation Test

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeSubViews];
    }
    return self;
}


+ (UIImage *)imageNamed:(NSString *)name currentClass:(Class)currentClass {
    
#if TARGET_INTERFACE_BUILDER
    return [UIImage imageNamed:name inBundle:[NSBundle bundleForClass:currentClass] compatibleWithTraitCollection:nil];
#else
    return [UIImage imageNamed:name];
#endif
}

- (void)initializeSubViews {
  
    MyLinearLayout *layout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    layout.backgroundColor = [UIColor cyanColor];
    layout.myMargin = 0;
    [self addSubview:layout];
    
    {
        UILabel *titleLabel = [UILabel new];
        titleLabel.text = @"标题测试";
        titleLabel.backgroundColor = [UIColor redColor];
        [titleLabel sizeToFit];
        [layout addSubview:titleLabel];
        
        UILabel *descLabel = [UILabel new];
        descLabel.text = @"标题测试2222";
        descLabel.myTop = 10;
        descLabel.backgroundColor = [UIColor redColor];
        [descLabel sizeToFit];
        [layout addSubview:descLabel];
        
        UIImageView *avatarImageV = [UIImageView new];
        avatarImageV.image = [[self class] imageNamed:@"demo" currentClass:[self class]];
        avatarImageV.mySize = CGSizeMake(100, 100);
        [avatarImageV sizeToFit];
        avatarImageV.backgroundColor = [UIColor redColor];
        
        [layout addSubview:avatarImageV];
    }
    
}





- (void)drawRect:(CGRect)rect {
    [[UIColor yellowColor] setFill];
    [[UIBezierPath bezierPathWithRect:rect] fill];
}

@end
