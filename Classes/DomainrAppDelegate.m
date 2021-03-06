#import "DomainrAppDelegate.h"
#import "MainViewController.h"
#import "Flurry.h"

@implementation DomainrAppDelegate

	@synthesize window;
	@synthesize navigationController;

void uncaughtExceptionHandler(NSException*exception) {
    [Flurry logError:@"Uncaught" message:@"Crash" exception:exception];
}

	- (void)applicationDidFinishLaunching:(UIApplication *)application; {
        [Flurry startSession:@"XXXXXXXXXXXXXXXXXXXX"];
        NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
		MainViewController *mainViewController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
		UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
		self.navigationController = navController;
		Release(navController);
		Release(mainViewController);
		
		[self.navigationController setNavigationBarHidden:YES];
        [window addSubview:[self.navigationController view]];
//        [self.window setRootViewController:self.navigationController];
		[window makeKeyAndVisible];
	}


	- (void)dealloc; {
		[window release];
		[super dealloc];
	}

@end
