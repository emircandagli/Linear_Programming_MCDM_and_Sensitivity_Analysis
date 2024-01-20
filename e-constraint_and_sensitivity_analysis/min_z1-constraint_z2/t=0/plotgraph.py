# -*- coding: utf-8 -*-

import matplotlib.pyplot as plt


# Second set of data
epsilon_values_set1 = [3051, 3081, 3111, 3141, 3171]
objective_values_set1 = [2530150, 2511475, 2492800, 2474125, 2455450]

# Plotting for the second set
plt.plot(epsilon_values_set1, objective_values_set1, marker='o', linestyle='-', label='Set 2')

# Customize the plot
plt.title('ε-Constraint Method Plot')
plt.xlabel('Epsilon Values')
plt.ylabel('Objective Values')
plt.legend()
plt.grid(True)
plt.show()