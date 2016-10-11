# Week 3 Homework: Mailbox

This is a copy of the Mailbox app

Time spent: roughly 18 hours spent on week 1 homework

## Mailbox

The purpose of this homework is to leverage animations and gestures to implement more sophisticated interactions. We're going to use the techniques from this week to implement the Mailbox interactions.

Time spent: `<18>`

### Features

#### Required

- [x] On dragging the message left:
  - [x] Initially, the revealed background color should be gray.
  - [x] As the reschedule icon is revealed, it should start semi-transparent and become fully opaque. If released at this point, the message should return to its initial position.
  - [x] After 60 pts, the later icon should start moving with the translation and the background should change to yellow.
    - [x] Upon release, the message should continue to reveal the yellow background. When the animation it complete, it should show the reschedule options.
  - [x] After 260 pts, the icon should change to the list icon and the background color should change to brown.
    - [x] Upon release, the message should continue to reveal the brown background. When the animation it complete, it should show the list options.

- [x] User can tap to dismiss the reschedule or list options. After the reschedule or list options are dismissed, you should see the message finish the hide animation.
- [x] On dragging the message right:
  - [x] Initially, the revealed background color should be gray.
  - [x] As the archive icon is revealed, it should start semi-transparent and become fully opaque. If released at this point, the message should return to its initial position.
  - [x] After 60 pts, the archive icon should start moving with the translation and the background should change to green.
    - [x] Upon release, the message should continue to reveal the green background. When the animation it complete, it should hide the message.
  - [x] After 260 pts, the icon should change to the delete icon and the background color should change to red.
    - [x] Upon release, the message should continue to reveal the red background. When the animation it complete, it should hide the message.


#### Optional

- [x] Panning from the edge should reveal the menu.
  - [x] If the menu is being revealed when the user lifts their finger, it should continue revealing.
  - [x] If the menu is being hidden when the user lifts their finger, it should continue hiding.
- [ ] Tapping on compose should animate to reveal the compose view.
- [ ] Tapping the segmented control in the title should swipe views in from the left or right.
- [ ] Shake to undo.

#### The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Understanding different types of animation
2. Manually create gesture recongizers and link objects to all the right views

### Video Walkthrough 

Here's a walkthrough of implemented user stories:
<img src='https://github.com/quandnguyen/codepath/blob/master/Week3-Mailbox/week3-homework.gif?raw=true' title='Video Walkthrough' width='' alt='Video Walkthrough' />


## Notes

Describe any challenges encountered while building the app.

Challenges: 
- I had a hard time understanding the concept of creating vars and attaching them to the main view, as well as the views you want to interact with. But finally I got it!
- The concept of [dot] [dot] to drill down into properties 
- Nesting if else statements inside each other makes it hard to read the code 
- Xcode gave threw me some nasty bugs I didn't know how to solve. I had to create another project from scratch to bypass it. 



