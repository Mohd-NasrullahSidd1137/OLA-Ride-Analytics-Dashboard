create database ola_ride_insights;
use ola_ride_insights;

# Q1. Retrieve all successful bookings
select * from ola_cleaned
where Booking_Status = "Success";

# Q2. Average ride distance per vehicle type
select Vehicle_Type,round(avg(Ride_Distance),2) as Avg_Ride_Distance from ola_cleaned
group by Vehicle_Type
order by Avg_Ride_Distance desc;

# 3. Get the total number of rides cancelled by customers
select count(*) as Customer_Cancelled_Rides from ola_cleaned
where Canceled_Rides_by_Customer is not null and Canceled_Rides_by_Customer <> '';

# 4. List the top 5 customers who booked the highest number of rides
select Customer_ID,count(Booking_ID) as Total_Rides from ola_cleaned
group by Customer_ID
order by Total_Rides desc
limit 5;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues
select count(*) as Drive_Cancelled from ola_cleaned
where Canceled_Rides_by_Driver in ('Personal & Car related issues');

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings
select max(Driver_Ratings) as Maximum_Driver_Rating,min(Driver_Ratings) as Minimum_Driver_Rating from ola_cleaned
where Vehicle_Type = 'Prime Sedan';

# 7. Retrieve all rides where payment was made using UPI
select * from ola_cleaned
where Payment_Method = 'UPI';

# 8. Find the average customer rating per vehicle type
select Vehicle_Type,round(avg(Customer_Rating),2) as AVG_Cust_Rating from ola_cleaned
group by Vehicle_Type
order by AVG_Cust_Rating DESC;

# 9. Calculate the total booking value of rides completed successfully
select sum(Booking_Value) as Total_Revenue from ola_cleaned
where Booking_Status = "Success";

# 10. List all incomplete rides along with the reason
select Booking_ID,Customer_ID,Vehicle_Type,Incomplete_Rides,Incomplete_Rides_Reason from ola_cleaned
where Incomplete_Rides = "Yes";

