//
//  ActivityDetailViewController.m
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/30.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "ActivityDetailViewController.h"
#import "ActivityModel.h"
@interface ActivityDetailViewController ()


@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) IBOutlet UILabel *addressLabel;

@property (strong, nonatomic) IBOutlet UIImageView *imageV;


@property (strong, nonatomic) IBOutlet UILabel *contentTextView;


@property (strong, nonatomic) IBOutlet NSLayoutConstraint *viewHeight;


@end

@implementation ActivityDetailViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = self.model.title;
    
    self.titleLabel.text = self.model.title;
    self.dateLabel.text = self.model.end_time;
    self.nameLabel.text = self.model.user.name;
    self.addressLabel.text  = self.model.address;
    [self.imageV setImageWithURL:[NSURL URLWithString:self.model.image]];

    self.contentTextView.text = self.model.content;
    
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateViewConstraints{
    [super updateViewConstraints];
    
    self.viewHeight.constant = CGRectGetMaxY(self.contentTextView.frame) +49;
    
    
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
