//
//  FillModeVC.m
//  KCAFillModel
//
//  Created by apple on 17/8/14.
//  Copyright © 2017年 Wang. All rights reserved.
//

#import "FillModeVC.h"

@interface FillModeVC ()
@property (nonatomic, strong) NSString *fillMode;
@end

@implementation FillModeVC
- (instancetype)initWithFillMode:(NSString *)fillMode{
    if (self = [super init]) {
        self.fillMode = fillMode;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    CALayer *colorLayer = [[ CALayer alloc] init];
    colorLayer.position = self.view.center;
    colorLayer.backgroundColor = [UIColor redColor].CGColor;
    colorLayer.bounds = CGRectMake(0.0f, 0.0f, 20.0f, 20.0f);
    [self.view.layer addSublayer:colorLayer];
    
    CABasicAnimation *boundAn = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundAn.fromValue = [NSValue valueWithCGRect:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
    boundAn.toValue = [NSValue valueWithCGRect:CGRectMake(0.0f, 0.0f, 200.0f, 200.0f)];
    boundAn.beginTime = 2.0f;
    boundAn.duration = 5.0f;
    boundAn.fillMode = self.fillMode;
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObject:boundAn];
    group.duration = 10.0f;
    [colorLayer addAnimation:group forKey:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
