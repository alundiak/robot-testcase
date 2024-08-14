import random

def generate_random_number_a(min_value=0, max_value=100):
    """
    Generate a random number between min_value and max_value.

    :param min_value: The minimum value.
    :param max_value: The maximum value.
    :return: A random integer between min_value and max_value.
    """
    return random.randint(min_value, max_value)
