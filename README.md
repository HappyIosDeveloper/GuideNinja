# GuideNinja
Simplest way to show a pointer finger tapping or swiping on screen. (tapping works with ripple animation and swipe is very smooth).


# Usage
Simply add guideNinja to your project and just call it where ever you like, like this:

guideNinja(start: .i1, end: .i9) // there is a default enumration on guideNinja for finding screen positions. I split the screen to 9 part base of keyboard number pad. if your keyboard has a number pad on the right side, look at it to find out where is the position of "i" numbers.
  
or you can pass any view position like this:
  
guideNinja(start: button.layer.position, end: view.center)
  
  
  
for handling tapp guide, use it like this:  
guideNinja(tapPosition: view.center)


if you need any delay before starting the guide, use "asyncAfter" like this:

DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
  guideNinja(start: .i1, end: .i9) // guide will appear after 4 seconds
}
