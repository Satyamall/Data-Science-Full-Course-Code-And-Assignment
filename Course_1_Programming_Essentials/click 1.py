import time
import pyautogui
import random

def autoclick_with_rotation(interval=5):
    while True:
        # Rotate the mouse cursor randomly
        x_offset = random.randint(-10, 10)
        y_offset = random.randint(-10, 10)
        pyautogui.moveRel(x_offset, y_offset, duration=0.5)
        
        # Click after rotating
        pyautogui.click()
        
        # Wait for the specified interval
        time.sleep(interval)

if __name__ == "__main__":
    autoclick_with_rotation()
