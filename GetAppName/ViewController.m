//
//  ViewController.m
//  GetAppName
//
//  Created by mac on 17/6/2.
//  Copyright © 2017年 cai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    NSLog(@"infoDictionary: %@", [[NSBundle mainBundle] infoDictionary]);
    /*
     {
     BuildMachineOSBuild = 15G1217;
     CFBundleDevelopmentRegion = en;
     CFBundleExecutable = GetAppName;
     CFBundleIdentifier = "com.cai.GetAppName";
     CFBundleInfoDictionaryVersion = "6.0";
     CFBundleName = GetAppName;
     CFBundleNumericVersion = 16809984;
     CFBundlePackageType = APPL;
     CFBundleShortVersionString = "1.0";
     CFBundleSupportedPlatforms =     (
     iPhoneSimulator
     );
     CFBundleVersion = 1;
     DTCompiler = "com.apple.compilers.llvm.clang.1_0";
     DTPlatformBuild = "";
     DTPlatformName = iphonesimulator;
     DTPlatformVersion = "10.2";
     DTSDKBuild = 14C89;
     DTSDKName = "iphonesimulator10.2";
     DTXcode = 0821;
     DTXcodeBuild = 8C1002;
     LSRequiresIPhoneOS = 1;
     MinimumOSVersion = "10.2";
     UIDeviceFamily =     (
     1
     );
     UILaunchStoryboardName = LaunchScreen;
     UIMainStoryboardFile = Main;
     UIRequiredDeviceCapabilities =     (
     armv7
     );
     UISupportedInterfaceOrientations =     (
     UIInterfaceOrientationPortrait,
     UIInterfaceOrientationLandscapeLeft,
     UIInterfaceOrientationLandscapeRight
     );
     }
     */
    
    //CFBundleExecutable    -> 获取项目工程名
    //CFBundleIdentifier    -> 获取应用唯一标识
    //CFBundleName          -> 获取项目工程名
    //CFBundleShortVersionString    -> 获取应用版本号 (App Store上版本号 -> Version)
    //CFBundleVersion               -> 获取应用内部版本号(Build)
    
    NSLog(@"%s line: %d行", __func__, __LINE__);
    
    //默认:
    NSLog(@"--%@--%@--%@", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"], [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleExecutable"], [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]);
    //输出: --GetAppName--GetAppName--(null) --> 因为Display Name未设置 则不存在此key的值
    
    //1. Display Name不为空: --> 工程 -> TARGETS -> General -> Identity -> Display Name: 简书-创作你的创作
    NSLog(@"-%@", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]);
    //输出: -简书-创作你的创作
    
    //2. Display Name 为空: --> Info.plist文件中Bundle name的值修改app名字为中文 例如: 简书
    NSDictionary *appInfo = [[NSBundle mainBundle] infoDictionary];
    NSLog(@"%@", [appInfo objectForKey:(NSString *)kCFBundleNameKey]);
    //输出: 简书
    
    //3.Info.plist文件中Bundle name的值修改app名字为中文 例如: 简书 并且 修改设置Display Name: 简书-创作你的创作
    NSLog(@"--%@--%@--%@", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"], [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleExecutable"], [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]);
    //输出: --简书--GetAppName--简书-创作你的创作
    
    /*******************************************************************/
    
    NSLog(@"--%@--%@", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"], [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleExecutable"]);
    //1. 输出: --GetAppName--GetAppName
    //2. 输出: --简书--GetAppName
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"%s line: %d行", __func__, __LINE__);
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"%s line: %d行", __func__, __LINE__);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSLog(@"%s line: %d行", __func__, __LINE__);
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    NSLog(@"%s line: %d行", __func__, __LINE__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    NSString *message = [NSString stringWithFormat:@"[%@]想要打开[微信]", appName];
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *open = [UIAlertAction actionWithTitle:@"打开" style:UIAlertActionStyleDefault handler:nil];
    [alertVC addAction:cancle];
    [alertVC addAction:open];
    
    [self presentViewController:alertVC animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
