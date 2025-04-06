import datetime

class CarRental:
    def __init__(self, stock=0):
        self.stock = stock

    def display_cars(self):
        print(f"Available cars: {self.stock}")
        return self.stock

    def rent_hourly(self, num_of_cars):
        if num_of_cars <= 0:
            print("Number of cars should be positive!")
            return None
        elif num_of_cars > self.stock:
            print("Sorry! Not enough cars available.")
            return None
        else:
            rental_time = datetime.datetime.now()
            self.stock -= num_of_cars
            print(f"{num_of_cars} car(s) rented on hourly basis at {rental_time.hour} hours.")
            return rental_time

    def rent_daily(self, num_of_cars):
        if num_of_cars <= 0:
            print("Number of cars should be positive!")
            return None
        elif num_of_cars > self.stock:
            print("Sorry! Not enough cars available.")
            return None
        else:
            rental_time = datetime.datetime.now()
            self.stock -= num_of_cars
            print(f"{num_of_cars} car(s) rented on daily basis at {rental_time.day} day.")
            return rental_time

    def rent_weekly(self, num_of_cars):
        if num_of_cars <= 0:
            print("Number of cars should be positive!")
            return None
        elif num_of_cars > self.stock:
            print("Sorry! Not enough cars available.")
            return None
        else:
            rental_time = datetime.datetime.now()
            self.stock -= num_of_cars
            print(f"{num_of_cars} car(s) rented on weekly basis at {rental_time.weekday()} day of the week.")
            return rental_time

    def return_cars(self, request):
        rental_time, rental_basis, num_of_cars = request
        bill = 0

        if rental_time and rental_basis and num_of_cars:
            now = datetime.datetime.now()
            rental_period = now - rental_time

            if rental_basis == 1:  # hourly
                bill = round(rental_period.seconds / 3600) * 5 * num_of_cars
            elif rental_basis == 2:  # daily
                bill = round(rental_period.days) * 20 * num_of_cars
            elif rental_basis == 3:  # weekly
                bill = round(rental_period.days / 7) * 60 * num_of_cars

            self.stock += num_of_cars
            print(f"Total bill: ${bill}")
            return bill
        else:
            print("Invalid return request.")
            return None
