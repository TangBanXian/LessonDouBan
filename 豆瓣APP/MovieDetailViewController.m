
//
//  MovieDetailViewController.m
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/7/2.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "MovieDetailRequest.h"
#import "MovieDetailModel.h"

@interface MovieDetailViewController ()

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *viewHeight;
@property (strong, nonatomic) IBOutlet UIView *movieDatail;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    [self requestMovieDetailDataWith:self.model.ID];
    
}


    

- (void)requestMovieDetailDataWith:(NSString *)ID{
    MovieDetailRequest *request = [[MovieDetailRequest alloc] init];
    //    __weak typeof(self)weakself=self;
    
    [request MovieDetailRequestWithParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        
        self.detailModel = [[MovieDetailModel alloc] init];
        [self.detailModel setValuesForKeysWithDictionary:dic];
        
        self.rating.text = [NSString stringWithFormat:@"%@",self.detailModel.rating[@"average"]];
        self.largeImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.model.images[@"large"]]]];
        self.pubdate.text = self.model.pubdate;
        self.durationsLabel.text = [self.detailModel.durations lastObject];
        self.genresLabel.text = [self.detailModel.genres lastObject];
        
        self.countries.text = [self.detailModel.countries objectAtIndex:0];
        self.summaryLabel.text = self.detailModel.summary;
        

    } failure:^(NSError *error) {
        
     NSLog(@"error = %@",error);
 
        
    }];
                       
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateViewConstraints{
    [super updateViewConstraints];
    
    self.viewHeight.constant = CGRectGetMaxY(self.summaryLabel.frame) +10;
    
    
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
