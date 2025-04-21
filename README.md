# Amazon E-Commerce Database Project

## About Me

Hello, I'm **Israel Adeleye** – a passionate **Database Enthusiast** currently working towards becoming a **Database Administrator (DBA)**. I specialize in **SQL**, **PostgreSQL**, and **Database Management Systems (DBMS)**. I enjoy working on real-world database projects that help me grow my technical skills and solve complex data-related problems. 

Previously, I created **SpotifyCloneDB**, where I designed a **Spotify-like** music database and implemented complex SQL queries to manage users, tracks, and playlists efficiently. In this repository, you’ll find my most recent project: an **Amazon-style e-commerce database** designed to manage users, products, orders, payments, and shipping.

You can connect with me on [LinkedIn](https://www.linkedin.com/in/israel-adeleye-a466b5357/).

## Project Overview

The Amazon-style e-commerce database project simulates the structure of an e-commerce platform. It includes all the key data points necessary for running such a platform, such as user data, product catalogs, orders, and payments. The project aims to demonstrate the ability to design and manage databases with **PostgreSQL** and implement various SQL queries and views to handle complex data requirements.

## Table of Contents

- [Project Overview](#project-overview)
- [Basic Queries](#basic-queries)
- [Intermediate Queries](#intermediate-queries)
- [Advanced Queries](#advanced-queries)
- [Bonus Views](#bonus-views)
- [Technologies Used](#technologies-used)

## Query Breakdown

### Basic Queries

The **basic queries** focus on retrieving foundational data from the database. These are essential for displaying user, product, order, and category information, which forms the backbone of any e-commerce system. The goal is to extract simple yet vital insights that are often required for routine operations.

1. **List All Users**  
   **Why**: To view all registered users in the platform.  
   **How**: We query the users table to retrieve all user records. This helps with user management and segmentation.

2. **Find All Products with Stock Less Than 20**  
   **Why**: To monitor inventory levels and potentially trigger restocking alerts.  
   **How**: A simple `SELECT` query with a `WHERE` clause filters products with stock quantities below 20.

3. **Get All Orders with Status 'Delivered'**  
   **Why**: To track completed orders and update stock.  
   **How**: We filter orders based on the 'delivered' status using a `WHERE` clause to get the orders that have been delivered.

4. **List All Categories Alphabetically**  
   **Why**: Sorting categories alphabetically is useful for displaying them in a user-friendly interface.  
   **How**: A `SELECT` query with an `ORDER BY` clause helps organize categories in alphabetical order.

5. **Count Total Number of Users**  
   **Why**: To determine the platform's user base size.  
   **How**: We use the `COUNT()` aggregate function to tally the total number of users.

### Intermediate Queries

**Intermediate queries** require a deeper level of data analysis. They aim to summarize, group, and aggregate data to provide meaningful insights for the business, such as tracking product performance, user behavior, and revenue generation.

6. **Total Number of Products in Each Category**  
   **Why**: Helps determine the range of products available per category and optimize inventory.  
   **How**: A `GROUP BY` query combined with the `COUNT()` function aggregates the number of products for each category.

7. **Total Orders Each User Has Made**  
   **Why**: To analyze customer engagement and order frequency.  
   **How**: By using `GROUP BY` on the user ID and `COUNT()` for orders, we track the number of orders placed by each user.

8. **Total Revenue Per Order**  
   **Why**: This metric is important for understanding revenue per transaction and identifying high-value customers.  
   **How**: We join the orders and order_items tables, calculate total order value by summing the product prices, and group them by order.

9. **Top 5 Most Expensive Products**  
   **Why**: Helps identify premium products that contribute significantly to revenue.  
   **How**: A `SELECT` query with `ORDER BY` in descending order of price, combined with `LIMIT 5`, gives us the top 5 most expensive products.

10. **Most Used Payment Method**  
    **Why**: Identifying popular payment methods can help optimize payment system integrations.  
    **How**: A `GROUP BY` query on the payment method column, using `COUNT()`, provides insights into the most used payment options.

### Advanced Queries

The **advanced queries** provide in-depth analysis, such as comparing performance over time, segmenting users based on spending, and understanding product trends. These queries help make data-driven decisions for the business.

16. **Revenue Per Category**  
    **Why**: To understand the financial contribution of each category to overall revenue.  
    **How**: We calculate revenue per category by joining the orders, order_items, and products tables and grouping by category.

17. **Which Users Have Spent the Most**  
    **Why**: To identify high-value customers who are essential to the platform’s revenue.  
    **How**: We join user data with order payment records, calculate total spending, and order the result in descending order.

18. **Which Product Appears in the Most Orders**  
    **Why**: To identify best-selling products.  
    **How**: A `GROUP BY` query on product IDs, combined with `COUNT()`, helps us find the products most frequently ordered.

19. **Average Order Value**  
    **Why**: This helps evaluate the typical transaction size, which can influence pricing strategies.  
    **How**: We calculate the average value of orders by summing order totals and dividing by the number of orders.

20. **Orders with Multiple Items**  
    **Why**: Identifying multi-item orders helps with inventory and shipping management.  
    **How**: A `HAVING` clause filters orders that have more than one item based on the count of order items.

### Bonus Views

**Bonus views** focus on creating reusable SQL views that aggregate complex data in an easily accessible format. These views simplify the process of querying frequently used data.

26. **Create a View for Total User Spending**  
    **Why**: A user spending summary view makes it easy to track total spending for each user.  
    **How**: We create a view that combines user data and order amounts to summarize total spending per user.

27. **Create a View for Order Summary**  
    **Why**: Provides an at-a-glance summary of order details.  
    **How**: We create a view that combines order ID, user details, amount, and order status for a quick overview.

28. **Create a View Showing Best-Selling Products**  
    **Why**: Displays the best-selling products, helping with inventory and marketing strategies.  
    **How**: A view that aggregates product sales, showing the top sellers based on order quantity.

29. **Create a View for Shipping Progress**  
    **Why**: Enables quick tracking of shipping status for all orders.  
    **How**: This view combines order IDs and shipping status to monitor shipping progress.

30. **Create a View Combining Products with Their Categories and Stock Level**  
    **Why**: This view provides a snapshot of products, their categories, and current stock levels for easy reference.  
    **How**: We create a view that links products, categories, and stock levels for streamlined reporting.

## Technologies Used

- **PostgreSQL** for database management
- **VS Code** for code editing
- **Git** for version control

---

