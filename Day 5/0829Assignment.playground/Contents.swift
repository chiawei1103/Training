import UIKit


// Theory

/// 1. what is protocol delegate pattern, write some samle code to explain
//     - Protocol delegate pattern is used to communicate one class to another class. When using a function in other classes, instead of creating an object to call the function, just create an object of the prototol delegate.

//        protocol PlayerDelegate {
//            func addSongs()
//            func removeSongs()
//        }
//
//        class Playlist: PlayerDelegate {
//            let player = Player()
//            func setting() {
//                player.delegate = self
//            }
//
//            func addSongs() {
//
//            }
//
//            func removeSongs() {
//
//            }
//        }
//
//        class Player {
//            var delegate: PlayerDelegate?  // this is the protocol delegate
//            func play() {
//
//
//            }
//            func stop() {
//
//            }
//        }

/// 2. Steps to create tableView
//      1. Drag and drop a table view component from the library
//      2. set constrains for the table view
//      3. Drag and drop a table view cell component from the library
//      4. Assign datasource to the view controller itself
//      5. Add "UITableViewDataSource" protocol to the view controller
//      6. Add two functions based on the protocol
//      7. Finish the function that returns number of rows
//      8. Finish the function that returns UITableViewCell by using function "dequeueReusableCell" in the table view
//      9. Go back to the storyboard, select the table view cell component, click the attribute inspector, then set the identifier as same as set in the "dequeueReusableCell"

/// 3. what is use of storyboard refrence
//      - Storyboard reference is used to refer a storyboard in other storyboard to make the storyboard cleaner and more organized. Otherwise in a big scale project. Showing all view controllers in one storyboard would be hard to maintain and develop.

/// 4. what is segue
//      - Segue is a connectors between view controllers in storyboards. To trigger a segue, just call "prepare(for: )" function


// Practical


// 1. Create a talbeview and dispaly list of 10 students using array

    // Student should have name , email , dob, avtar
    // use avtar image from assets



// 2. Write logic for calculator UI.


// 3. from Loginview controller navigate to Student list .
