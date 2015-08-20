//
//  WWLJLabel.m
//  WWLJLabel
//
//  Created by iShareme on 15/8/20.
//  Copyright (c) 2015年 iShareme. All rights reserved.
//

#import "WWLJLabel.h"

@implementation WWLJLabel


-(BOOL)canBecomeFirstResponder{
    return YES;
}
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
//    return (action == @selector(copy:));
    
    //设置为NO的话,界面上就不会显示
    if (action == @selector(cut:)){
        return YES;
    }
    else if(action == @selector(copy:)){
        return YES;
    }
    else if(action == @selector(selectAll:)){
        return YES;
    }
    else
    {
        return [super canPerformAction:action withSender:sender];
    }
}

//针对于copy的实现
-(void)copy:(id)sender{
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.text;
}
-(void)cut:(id)sender{
    
}

-(void)selectAll:(id)sender{
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = self.text;
}

//有了以上三个方法，我们就能处理copy了，当然，在能接收到事件的情况下：
//UILabel默认是不接收事件的，我们需要自己添加touch事件
-(void)attachTapHandler{
    self.userInteractionEnabled = YES;  //用户交互的总开关
    UITapGestureRecognizer *touch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:touch];
}

-(void)handleTap:(UIGestureRecognizer*) recognizer{
    [self becomeFirstResponder];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    [menu setTargetRect:self.frame inView:self.superview];
    [menu setMenuVisible:YES animated:YES];
}

//绑定事件
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self attachTapHandler];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self attachTapHandler];
}

@end
