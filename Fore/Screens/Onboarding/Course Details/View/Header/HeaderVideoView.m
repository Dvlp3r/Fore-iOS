//
//  HeaderVideoView.m
//  Fore
//
//  Created by pavan krishna on 05/05/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "HeaderVideoView.h"
#import "GUIPlayerView.h"

@interface HeaderVideoView ()<GUIPlayerViewDelegate>

@property (strong, nonatomic) GUIPlayerView *videoPlayerView;
@property (nonatomic, assign) BOOL isPlaying;
@property (nonatomic, assign) BOOL userRequestedPause;

@end

@implementation HeaderVideoView

-(instancetype)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        self.isPlaying = NO;
        self.userRequestedPause = NO;
        [self addViews];
        [self addGestures];
    }
    return self;
}

-(void)addGestures;
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:[self videoPlayerView] action:@selector(didTap)];
    [tapGesture setNumberOfTapsRequired:1];
    [self addGestureRecognizer:tapGesture];
}

-(void)prepareForReuse;
{
    [self setIsPlaying:NO];
    [self setUserRequestedPause:NO];
}

-(void)addViews;
{
    [self addSubview:[self videoPlayerView]];
}

-(void)didTap;
{
    self.userRequestedPause = !self.userRequestedPause;
    if (self.isPlaying) {
        [self pause];
    }else{
        [self play];
    }
}

-(void)layoutSubviews;
{
    [super layoutSubviews];
    
    CGFloat screenWidth = [self frame].size.width;
    CGFloat screenHeight = [self frame].size.height;
    
    [[self videoPlayerView] setFrame:CGRectMake(0,
                                                0,
                                                (screenWidth * 100)/100,
                                                (screenHeight * 100)/100)];
}

-(void)setVideoURL:(NSURL *)videoURL
{
    NSURL *URL = [NSURL URLWithString:@"http://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_320x180.mp4"];
    [self.videoPlayerView setVideoURL:URL];
    [self.videoPlayerView prepareAndPlayAutomatically:YES];
    
}

-(void)play;
{
    NSURL *URL = [NSURL URLWithString:@"http://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_320x180.mp4"];
    [self.videoPlayerView setVideoURL:URL];
    [self.videoPlayerView prepareAndPlayAutomatically:YES];
}

-(void)pause;
{
    [[self videoPlayerView] pause];
}

#pragma mark - Lazy Loading

-(GUIPlayerView *)videoPlayerView;
{
    if (_videoPlayerView) {
        return _videoPlayerView;
    }
    
    _videoPlayerView = [[GUIPlayerView alloc] init];
    [_videoPlayerView setDelegate:self];
    
    return _videoPlayerView;
}

#pragma mark - GUI Player View Delegate Methods

- (void)playerWillEnterFullscreen {
    //    [[self navigationController] setNavigationBarHidden:YES];
    //    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
}

- (void)playerWillLeaveFullscreen {
    //    [[self navigationController] setNavigationBarHidden:NO];
    //    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
}

- (void)playerDidEndPlaying {
    [self.videoPlayerView clean];
}

- (void)playerFailedToPlayToEnd {
    NSLog(@"Error: could not play video");
    [self.videoPlayerView clean];
}
@end
