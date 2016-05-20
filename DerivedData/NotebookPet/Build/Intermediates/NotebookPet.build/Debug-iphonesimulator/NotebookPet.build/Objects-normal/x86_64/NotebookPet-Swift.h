// Generated by Apple Swift version 2.2 (swiftlang-703.0.18.8 clang-703.0.31)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import CoreData;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class NSManagedObjectContext;
@class Note;
@class NSCoder;
@class UITableView;
@class NSIndexPath;
@class UITableViewCell;
@class UITextField;
@class UIStoryboardSegue;
@class UILabel;

SWIFT_CLASS("_TtC11NotebookPet6AddPet")
@interface AddPet : UIViewController <UIScrollViewDelegate, UITextViewDelegate, UITextFieldDelegate>
@property (nonatomic, weak) IBOutlet UITextField * _Null_unspecified nameField;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified labelSpecie;
@property (nonatomic, readonly, copy) NSString * _Nonnull tableIdentifier;
@property (nonatomic, strong) NSManagedObjectContext * _Nullable managedObjectContext;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull tableSource;
@property (nonatomic, strong) Note * _Nullable note;
- (nonnull instancetype)initWithCoder:(NSCoder * _Null_unspecified)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)viewDidAppear:(BOOL)animated;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Null_unspecified)tableView:(UITableView * _Null_unspecified)tableView cellForRowAtIndexPath:(NSIndexPath * _Null_unspecified)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (IBAction)saveNote;
- (BOOL)textFieldShouldReturn:(UITextField * _Nonnull)textField;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Null_unspecified)sender;
@end

@class UIWindow;
@class UIApplication;
@class NSObject;

SWIFT_CLASS("_TtC11NotebookPet11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate, UISplitViewControllerDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application willFinishLaunchingWithOptions:(NSDictionary * _Nullable)launchOptions;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


@interface NSManagedObjectModel (SWIFT_EXTENSION(NotebookPet))
+ (NSArray<NSManagedObjectModel *> * _Nonnull)modelVersionsForName:(NSString * _Nonnull)name;
+ (NSManagedObjectModel * _Nonnull)cloudNotesModelNamed:(NSString * _Nonnull)name;
+ (NSManagedObjectModel * _Nonnull)version1;
- (BOOL)isVersion1;
+ (NSManagedObjectModel * _Nonnull)version2;
- (BOOL)isVersion2;
+ (NSManagedObjectModel * _Nonnull)version3;
- (BOOL)isVersion3;
+ (NSManagedObjectModel * _Nonnull)version4;
- (BOOL)isVersion4;
@end

@class NSString;
@class NSDate;
@class NSEntityDescription;

SWIFT_CLASS("_TtC11NotebookPet4Note")
@interface Note : NSManagedObject
@property (nonatomic, strong) NSString * _Null_unspecified title;
@property (nonatomic, strong) NSString * _Null_unspecified body;
@property (nonatomic, strong) NSDate * _Null_unspecified dateCreated;
- (void)awakeFromInsert;
- (nonnull instancetype)initWithEntity:(NSEntityDescription * _Nonnull)entity insertIntoManagedObjectContext:(NSManagedObjectContext * _Nullable)context OBJC_DESIGNATED_INITIALIZER;
@end

@class NSFetchedResultsController;
@class NSBundle;

SWIFT_CLASS("_TtC11NotebookPet11NotebookPet")
@interface NotebookPet : UITableViewController <NSFetchedResultsControllerDelegate>
@property (nonatomic, readonly, copy) NSString * _Nonnull identifier;
@property (nonatomic, strong) NSFetchedResultsController * _Nonnull notes;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)controllerWillChangeContent:(NSFetchedResultsController * _Nonnull)controller;
- (void)controller:(NSFetchedResultsController * _Nonnull)controller didChangeObject:(id _Nonnull)anObject atIndexPath:(NSIndexPath * _Nullable)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath * _Nullable)newIndexPath;
- (void)controllerDidChangeContent:(NSFetchedResultsController * _Nonnull)controller;
- (void)execCloudKit;
- (IBAction)unwindToNotesList:(UIStoryboardSegue * _Nonnull)segue;
- (void)prepareForSegue:(UIStoryboardSegue * _Nonnull)segue sender:(id _Nullable)sender;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC11NotebookPet15NotebookPetCell")
@interface NotebookPetCell : UITableViewCell
@property (nonatomic, strong) Note * _Nullable note;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified noteNamePet;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified noteSpecie;
- (void)updateNoteInfo;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop