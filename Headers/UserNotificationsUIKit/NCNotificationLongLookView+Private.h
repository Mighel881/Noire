#import <PlatterKit/PLExpandedPlatterView.h>

@interface NCNotificationLongLookView : PLExpandedPlatterView <NRESettingsObserver>

// Added by me
@property (strong, nonatomic) MTMaterialView *overlayView;
- (void)settings:(NRESettings *)settings changedValueForKeyPath:(NSString *)keyPath;

@end