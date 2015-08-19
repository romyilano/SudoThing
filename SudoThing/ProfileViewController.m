#import "ProfileViewController.h"
#import "LoginViewController.h"
#import "WebViewController.h"
#import "Constants.h"

@interface ProfileViewController ()
@property (strong, nonatomic) NSURL *wikiURL;
@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    self.userNameLabel.text = [PFUser currentUser].username;
    self.userInfoLabel.text = [[PFUser currentUser] objectForKey:@"bio"];
    if (![[PFUser currentUser] objectForKey:@"wikiLink"]) {
        self.wikiLink.hidden = YES;
    } else {
        self.wikiLink.hidden = NO;
        self.wikiURL = [[PFUser currentUser] objectForKey:@"wikiLink"];
    }
                                    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kSegueProfileWikiKey]) {
        WebViewController *webViewController = [[WebViewController alloc] init];
        webViewController.url = self.wikiURL;
    }
}

#pragma mark - Action Methods

- (void)logoutBtnPressed:(UIButton *)sender {
    [PFUser logOut];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)wikiLinkBtnPressed:(id)sender {
    [self performSegueWithIdentifier:kSegueProfileWikiKey sender:self];
}

@end
