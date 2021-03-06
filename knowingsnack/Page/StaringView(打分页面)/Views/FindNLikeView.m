//
//  FindNLikeView.m
//  knowingsnack
//
//  Created by 汪迪岑 on 2017/11/1.
//  Copyright © 2017年 汪迪岑. All rights reserved.
//

#import "FindNLikeView.h"
#import "Header.h"
#import "SearchDetailViewController.h"
@interface FindNLikeView()
{
    UILabel *lbl20;
}
@end

@implementation FindNLikeView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        UIView *topline = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WEIGHT, 1.0f)];
        topline.backgroundColor = FlatWhite;
        [self addSubview:topline];
        
        UIView *bottomline = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height - 1.0f, SCREEN_WEIGHT, 1.0f)];
        bottomline.backgroundColor = FlatWhite;
        [self addSubview:bottomline];

        UIButton *findbtn = [[UIButton alloc] initWithFrame:CGRectMake(0,
                                                                       0,
                                                                       SCREEN_WEIGHT * (3.0f/5.0f),
                                                                       frame.size.height)];
        findbtn.backgroundColor = ClearColor;
        [self addSubview:findbtn];
        [findbtn addTarget:self action:@selector(find:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIImageView *findimageview = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                                   0,
                                                                                   frame.size.height - 40,
                                                                                   frame.size.height - 40)];
        findimageview.center = CGPointMake(findbtn.frame.size.width/5.0, findbtn.frame.size.height/2.0);
        findimageview.image = IMAGE(@"find");
        [findbtn addSubview:findimageview];
        
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(findimageview.frame.origin.x + findimageview.frame.size.width + 20.0f,
                                                                 20,
                                                                 100,
                                                                 findimageview.frame.size.width/2.0f)];
        [findbtn addSubview:lbl];
        lbl.text = @"找零食";
        lbl.font = [UIFont boldSystemFontOfSize:15.0f];
        
        UILabel *lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(findimageview.frame.origin.x + findimageview.frame.size.width + 20.0f,
                                                                 20 + findimageview.frame.size.width/2.0f + 2.0f,
                                                                 120,
                                                                 findimageview.frame.size.width/2.0f)];
        [findbtn addSubview:lbl2];
        lbl2.text = @"知食高分/聚会/代餐";
        lbl2.font = [UIFont systemFontOfSize:10.0f];
        lbl2.textColor = FlatGray;
        
        
        
        //_____________________________________________________________
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1.0f, frame.size.height - 50)];
        line.center = CGPointMake(SCREEN_WEIGHT * (3.0f/5.0f), frame.size.height/2.0f);
        line.backgroundColor = FlatWhite;
        [self addSubview:line];
        
        //______________________________________________________________
        
        UIButton *likebtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WEIGHT * (3.0f/5.0f),
                                                                       0,
                                                                       SCREEN_WEIGHT * (2.0f/5.0f),
                                                                       frame.size.height)];
        likebtn.backgroundColor = ClearColor;
        [self addSubview:likebtn];
        [likebtn addTarget:self action:@selector(like:) forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView *likeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                                   0,
                                                                                   frame.size.height - 40,
                                                                                   frame.size.height - 40)];
        likeImageView.center = CGPointMake(findbtn.frame.size.width/5.0, findbtn.frame.size.height/2.0);
        likeImageView.image = IMAGE(@"like");
        [likebtn addSubview:likeImageView];
        
        UILabel *lbl10 = [[UILabel alloc] initWithFrame:CGRectMake(likeImageView.frame.origin.x + likeImageView.frame.size.width + 15.0f,
                                                                 20,
                                                                 100,
                                                                 likeImageView.frame.size.width/2.0f)];
        [likebtn addSubview:lbl10];
        lbl10.text = @"我的零食";
        lbl10.font = [UIFont boldSystemFontOfSize:15.0f];
        
        lbl20 = [[UILabel alloc] initWithFrame:CGRectMake(likeImageView.frame.origin.x + likeImageView.frame.size.width + 15.0f,
                                                                  20 + likeImageView.frame.size.width/2.0f + 2.0f,
                                                                  120,
                                                                  likeImageView.frame.size.width/2.0f)];
        [likebtn addSubview:lbl20];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *array = [userDefaults objectForKey:@"theArrayKey"];
        lbl20.text = [NSString stringWithFormat:@"%d件",(int)array.count];
        if(array.count >= 100)
        {
            lbl20.text = @"99+件";
        }
        lbl20.font = [UIFont systemFontOfSize:10.0f];
        lbl20.textColor = FlatGray;
        
    }
    return self;
}


- (void)refreshText
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *array = [userDefaults objectForKey:@"theArrayKey"];
    lbl20.text = [NSString stringWithFormat:@"%d件",(int)array.count];
    if(array.count >= 100)
    {
        lbl20.text = @"99+件";
    }
}

- (void)find:(id)sender
{
    [self viewController].tabBarController.selectedIndex = 0;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showKeyboard" object:nil];

}

- (void)like:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"GoToLike" object:nil];
}

//获得view所在的controller
- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
