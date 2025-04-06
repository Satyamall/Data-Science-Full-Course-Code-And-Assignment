class Customer:
    def __init__(self):
        self.cars_rented = 0
        self.rental_basis = 0
        self.rental_time = None

    def request_cars(self):
        cars = input("How many cars would you like to rent?")
        try:
            cars = int(cars)
        except ValueError:
            print("Number of cars should be a positive integer.")
            return -1

        if cars < 1:
            print("Invalid number of cars!")
            return -1
        else:
            self.cars_rented = cars
            return self.cars_rented

    def return_cars(self):
        if self.rental_time and self.rental_basis and self.cars_rented:
            return self.rental_time, self.rental_basis, self.cars_rented
        else:
            return 0, 0, 0
