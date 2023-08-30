import UIKit


// Due date : 08/31

// Store below Products URL Json locally in local json file , read local json file data , parse it and disply in TableView.


//   https://dummyjson.com/products



// 1. what is app life cycle methods
///     - App life cycle methods are the motheds that are intended for initial application setup, such as
///     "didFinishLaunchingWithOptions()",
///     "aplicationWillEnterForeground()",
///     "applicationDidBecomeActive()",
///     "applicationWillResignActive()",
///     "applicationDidEnterBackground()",
///     "applicationWillTerminate()"
///
// 2. what is view controller life cycle methods
///     - ViewController life sycle methods are methods that created from the initializer of storyboards. In each phases of initializing a view controller, there are methods to be created.
///     "viewDidLoad()",
///     "viewWillAppear()",
///     "viewDidAppear()",
///     "viewWillDisappear()",
///     "viewDIdDisappear()"
///
// 3. different App States
///        1. Non-running - The app is not running
///        2. inactive - The app is running in the foreground, but not receiving events. For example, when a call is called, an ios app can become inactive state.
///        3. Active - The app is running in the foreground and receiving events.
///        4. Background - The app is running in the background, and executing code.
///        5. Suspended - The app is in the background, but not executing any code.
///
// 4. Diff b/w background and Suspended
///     - The big difference betweeen them is that Backbround State means the app could execute code in the background. In the Suspended state the app is not executing any code in the background.
///
// 5. Diff b/w try, try? and try!
///     - "try" should be used with "do and catch"
///         "try?" could return nil, if the function throws an error
///         "try!" should be avoided, since the system would crash when the function throws an error
///
// 6. different type of inheritance
///     - Single inheritance: inherit from a parent
///     - Multi level inheritance: parents can inherit from grandparents
///     - Multiple inheritance: Not supported in iOS
///
// 7. why multiple inheritance is not supported
///     - Only multiple inheritace of proocol is allowed in iOS. Multiple inheritance of class is not allowed in iOS is because of interfaces. Interfaces are often used for delegates, and if there's multiple inheritance of class, then the whole system would too complex .
///
// 8. diff b/w Struct and classes
///     - There's no inheritance for Struct, but there's inheritance for Class
///     The vavariables in Struct are  not immutable, but they are in Class
///     Hence, we will usually use struct to create the modal from database. 




