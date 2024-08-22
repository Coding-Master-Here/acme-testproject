# Acme Widget Co

## Introduction

This project implements a shopping basket designed to handle product catalogs, delivery charges, and promotional offers (discounts). The system supports products with specified prices and applies delivery cost rules based on the total order value.

## Features

- **Product Management**: Manage and display a catalog of products.
- **Basket Management**: Add and remove items from a shopping basket.
- **Discounts**: Apply different types of discounts, such as product-specific discounts and threshold-based discounts.
- **Delivery Charges**: Calculate delivery charges based on subtotal thresholds.
- **Payment Handling:** Uses an **ints of cents** approach, similar to Stripe, for handling monetary values.
- **Test Suite**: Comprehensive tests written using Minitest.

## Models Overview

### 1. Product

Represents items that are available for purchase.

- **Attributes:**
  - `code`: A unique identifier for the product.
  - `name`: The name of the product.
  - `price`: The price of the product in cents.

### 2. Basket

Manages the items that a customer adds to their shopping cart.

- **Methods:**
  - `add(product_code)`: Adds a product to the basket.
  - `total`: Calculates the total cost of the basket, including discounts and delivery charges.

### 3. Discount

Represents discounts that can be applied to the basket.

- **Attributes:**
  - `type`: The type of discount (e.g., `ProductDiscount`, `ThresholdDiscount`).
  - `options`: Discount-specific options such as product ID, required quantity, discount rate, or threshold.

### 4. DeliveryCharge

Calculates the delivery cost based on the total price of items in the basket.

- **Methods:**
  - `calculate(subtotal)`: Returns the delivery charge based on the subtotal.

### 5. PriceCalculator

Handles the application of discounts and calculates the final price after applying eligible discounts.

- **Methods:**
  - `apply(type, subtotal)`: Applies the specified discount type to the subtotal.

### 6. Constants

Contains configuration data like product information, delivery rules, and discount options.

- **Attributes:**
  - `PRODUCTS`: A hash of all available products.
  - `DELIVERY_RULES`: Rules defining delivery charges.
  - `DISCOUNTS`: An array of discount strategies and configurations.

## Technologies Used

- **Ruby**: The core programming language used for application development.
- **Minitest**: A testing framework used to write and run unit tests for the application.
- **Docker**: The application is containerized using Docker, making it easy to deploy and run in different environments.

## Setup and Installation

### Prerequisites

- [Docker](https://www.docker.com/get-started) should be installed on your machine.
- Ruby should be installed (preferably using a version manager like `rbenv` or `rvm`.

### Setup

1. **Clone the Repository**

   ```bash
   git clone https://github.com/Coding-Master-Here/acme-testproject.git
   ```
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
   ```bash
   cd acme-testproject
   ```

2. **Build docker image**
   ```bash
   docker build -t myapp .
   ```
3. **Run test cases**
   ```bash
   docker run --rm acme ruby -Itest test/*.rb
   ```
4. **Run app**
   ```bash
   docker run --rm acme ruby driver.rb
   ```
