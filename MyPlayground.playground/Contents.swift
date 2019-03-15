//
//  Documentation Templates
//  Xcode Playgrounds
//
//  Created by Maxim Puchkov.
//  Copyright © 2019 Maxim Puchkov. All rights reserved.
//





/*    *    *    *    *    *    *    *    *    */
/*                                            */
/*        (1) Documentation syntax            */
/*                                            */
/*    *    *    *    *    *    *    *    *    */


// 1. Short, one line           ///  .......
// 2. Long, comment block       /**  .......  */









/*    *    *    *    *    *    *    *    *    */
/*                                            */
/*         Protocols for two classes          */
/*                                            */
/*    *    *    *    *    *    *    *    *    */


/// People protocol for class Person
protocol People {
    
    func wants(money: Double) -> Bool
    
    func takes(money: Double)
    
    func says(words: String)
    
}


/// Rich protocol for class Billionaire
protocol Rich {
    
    func giveMoney(_ quantity: Double, to friend: Person) -> Bool
    
}









/**
 
 <#Class Person 👤#>

 <#Person's main responsibility is to want or to take money...#>

 
 - Remark: <#❗️ This is a detailed Documentation Template for any class ❗️ 👀#>
 
 
--------------------------------------------------

 
 ◇❖◇❖◇         __OVERVIEW__         ◇❖◇❖◇
 
 - Important: <#Person documentation is important!!!#>
 
 - Note: <#🙂 this is a note 🙃#>
 
 
--------------------------------------------------

 
 ◇❖◇❖◇         __KNOWN ISSUES__         ◇❖◇❖◇
 
 - TODO:        <#Change one `return true`#>
 - TODO:        <#Add new 💰 to person's bank account#>
 - TODO:        <#Other TODOs....#>
 
 
 - Warning:     <#Incomplete implementation#>
 - Warning:     <#Bug in function `wants`#>
 
 
 - Bug:         <#Function wants always returns true#>
 
       (A) | say(words: "Thank you")
           | return true                   <---     OK
       ____|___________________________________________
       (B) | say(words: "No, I want more")
           | return true                   <---  WRONG

 

--------------------------------------------------
 
 
 ◇❖◇❖◇         __LEGAL DISCLAIMER__         ◇❖◇❖◇
 
 - Author:      Maxim Puchkov
 - Version:     1.0
 - Copyright:   Copyright © 2019 Maxim Puchkov. All rights reserved.
 - Important:   [Accept Apache License 2.0][license]
 - Date:        Created on <#YYYY-MM-DD#>
 
 [license]: (http://www.apache.org/licenses/LICENSE-2.0)
 
 
--------------------------------------------------

 */
class Person : People {
    
    
    
    public func wants(money: Double) -> Bool {
//  ^~~~~^                   ^~~~~^  ^~~~~~^
        
        // ... think ...
        
        if (money > 0) {
            // Person accepts the
            // money and says
            says(words: "Thank you")         // (A)
            return true
        }
        
        // Person refuses to take
        // so little and says
        says(words: "No, I want more")       // (B)
        return true
    }
    
    
    
    
    public func takes(money: Double) {
        // ... take ...
    }
    
    
    
    
    internal func says(words: String) {
        // ... say the words ...
    }
    
    
    
} /* Class Person */












///
class Billionaire : Rich {
    
    
    
    
    
    /**
     
     <#Summary: Give money to a friend#>
     
     <#Any amount of money may be given away to your friends. If quantity is#>
     <#too small, they might refuse...#>
     
     
     - Remark: <#❗️ This is a detailed Documentation Template for any method ❗️ 👀#>
     
     
     --------------------------------------------------
     
     
     ◇❖◇❖◇         __OVERVIEW__         ◇❖◇❖◇
     
     - Note: <#This is a placeholder#>
     - Note: <#Each placeholder is of form `<#T#>`
     
     
     --------------------------------------------------
     
     
     ◇❖◇❖◇         __KNOWN ISSUES__         ◇❖◇❖◇
     
     - TODO:    <#confirm a person is a friend#>
     - TODO:    <#unit testing & continuous integration!#>
     
     
     - Warning: <#code is unsafe due to bugs#>
     
     
     - Bug:     <#may offer negative quantity#>
     - Bug:     <#🧟‍♂️ may offer money to zombies 🧟‍♀️#>
     
     
     --------------------------------------------------
     
     
     ◇❖◇❖◇         __DETAILED DESCRIPTION__         ◇❖◇❖◇
     
     - Precondition:  <#friend must be nearby and must be alive#>
     - Postcondition: <#the quantity of money is given to the friend or he declines#>
     
     
     - Requires:
        * <#(1) friend must make a decision#>
        * <#(2) money must not be Canadian Dollars#>
        * <#(3) financial institutions must be open#>
     
     
     - Invariant:
         <#friend will not become enemy#>
     
     
     --------------------------------------------------
     
     
     ◇❖◇❖◇         __LEGAL DISCLAIMER__         ◇❖◇❖◇
     
     - Author:      Maxim Puchkov
     - Version:     1.0
     - Copyright:   Copyright © 2019 Maxim Puchkov. All rights reserved.
     - Important:   [Accept Apache License 2.0][license]
     - Date:        Created on <#YYYY-MM-DD#>
     
     [license]: (http://www.apache.org/licenses/LICENSE-2.0)
     
     
     --------------------------------------------------
     
     
     ◇❖◇❖◇         __INPUT & OUTPUT__         ◇❖◇❖◇
     
     - Parameters:
        - quantity:   <#the amount of money to be given#>
        - friend:     <#a person who will receive the money#>
     
     
     - Returns:
        - `true`:     <#if ...#>
        - `false`:    <#otherwise#>
     
     
     --------------------------------------------------
     
     */
    func giveMoney(_ quantity: Double, to friend: Person) -> Bool {
        if friend.wants(money: quantity) {
            friend.takes(money: quantity)
            return true // Friend took the money
        }
        
        return false // Quantity is too small
    }
    
    
    
    
    
} /* Class Billionaire */




/**
 
 <#Give money to a friend#>
 
 <#Any amount of money may be given away to your friends#>
 
 - Note: <#example documentation#>
 
 -------------------------------------------------------------------------------
 
 
 - Warning: <#code is unsafe due to bugs#>
 - Note:    <#another note!#>
 
 - Bug:     <#may offer negative quantity#>
 - Bug:     <#may be unfriendly person#>
 - Bug:     <#may offer money to zombies 🧟‍♂️ 🧟‍♀️#>
 
 
 -------------------------------------------------------------------------------
 
 
 - Precondition:  <#friend must be nearby and must be alive#>
 - Postcondition: <#the quantity of money is given to the friend or he declines#>
 
 - Requires:
 * <#(1) friend must make a decision#>
 * <#(2) money must not be Canadian Dollars#>
 * <#(3) financial institutions must be open#>
 
 - Invariant:
 <#friend will not become enemy#>
 
 
 -------------------------------------------------------------------------------
 
 
 - Author:      Maxim Puchkov
 - Version:     1.0
 - Copyright:   Copyright © 2019 com.maximpuchkov. All rights reserved.
 - Important:   [View license agreement in browser][doc-link]
 
 [doc-link]: (https://csil-git1.cs.surrey.sfu.ca/vision/solver/blob/master/LICENSE)
 
 
 -------------------------------------------------------------------------------
 
 
 - TODO: <#change type of `quantity`#>
 - TODO: <#confirm a `Person` is a friend#>
 - TODO: <#unit testing & continuous integration!#>
 
 
 -------------------------------------------------------------------------------
 
 
 - Parameters:
 - <#quantity#>: <#the amount of money to be given#>
 - <#friend#>:   <#a person who will receive the money#>
 
 - Returns:
 - `true`  <#if ...#>
 - `false` <#if ...#>
 
 
 */
<#method declaration ...#>



/**

 <#Give money to a friend#>

 <#Any amount of money may be given away to your friends#>

 - Note: <#example documentation#>

-------------------------------------------------------------------------------


 - Warning: <#code is unsafe due to bugs#>
 - Note:    <#another note!#>

 - Bug:     <#may offer negative quantity#>
 - Bug:     <#may be unfriendly person#>
 - Bug:     <#may offer money to zombies 🧟‍♂️ 🧟‍♀️#>


-------------------------------------------------------------------------------


 - Precondition:  <#friend must be nearby and must be alive#>
 - Postcondition: <#the quantity of money is given to the friend or he declines#>

 - Requires:
    * <#(1) friend must make a decision#>
    * <#(2) money must not be Canadian Dollars#>
    * <#(3) financial institutions must be open#>

 - Invariant:
    <#friend will not become enemy#>


-------------------------------------------------------------------------------


 - Author:      Maxim Puchkov
 - Version:     1.0
 - Copyright:   Copyright © 2019 com.maximpuchkov. All rights reserved.
 - Important:   [View license agreement in browser][doc-link]

 [doc-link]: (https://csil-git1.cs.surrey.sfu.ca/vision/solver/blob/master/LICENSE)


-------------------------------------------------------------------------------


 - TODO: <#change type of `quantity`#>
 - TODO: <#confirm a `Person` is a friend#>
 - TODO: <#unit testing & continuous integration!#>


-------------------------------------------------------------------------------


 - Parameters:
    - quantity: <#the amount of money to be given#>
    - friend:   <#a person who will receive the money#>
 - Returns:
    - `true`  <#if ...#>
    - `false` <#if ...#>


 */
