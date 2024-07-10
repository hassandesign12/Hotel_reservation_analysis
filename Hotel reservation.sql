
/**1. What is the total number of reservations in the dataset?**/

select  COUNT(*) from hotel_reservation_dataset;

/**2. Which meal plan is the most popular among guests? **/

select type_of_meal_plan, count(*) as Count from hotel_reservation_dataset
group by type_of_meal_plan
limit 1;

/** 3. What is the average price per room for reservations involving children**/
select avg(avg_price_per_room) 
as Avg_price_per_room_involving_children
from hotel_reservation_dataset 
where 
no_of_children>0;
/**4. How many reservations were made for the year 20XX (replace XX with the desired year)? **/

select COUNT(*) as total_reservations
from hotel_reservation_dataset
where year(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 2018;

/** 5. What is the most commonly booked room type?**/


select room_type_reserved , count(*) from hotel_reservation_dataset
group by room_type_reserved
limit 1;

/**6. How many reservations fall on a weekend (no_of_weekend_nights > 0)? **/

select  count(no_of_weekend_nights) as NO_reservations_fall_on_weekend  from hotel_reservation_dataset
where no_of_weekend_nights>0;

/** 7. What is the highest and lowest lead time for reservations? **/


select max(lead_time) as highest_lead_time ,min(lead_time) as lowest_lead_time from hotel_reservation_dataset;

/**8. What is the most common market segment type for reservations?**/

select market_segment_type, count(*) from hotel_reservation_dataset
group by market_segment_type
limit 1;

/**9. How many reservations have a booking status of "Confirmed"? **/


select * from hotel_reservation_dataset;
select count(booking_status) as no_of_Confirmed_status from hotel_reservation_dataset
where booking_status="Confirmed";


/**10. What is the total number of adults and children across all reservations?**/

select sum(no_of_adults) as number_of_adults , sum(no_of_children) as number_of_children
from hotel_reservation_dataset;

/** 11. What is the average number of weekend nights for reservations involving children?**/

select avg(no_of_weekend_nights) as avg_weekend_nights_with_children
 from hotel_reservation_dataset 
  where  no_of_children > 0;
  
/**12. How many reservations were made in each month of the year?
**/ 
  select 
    month(STR_TO_DATE(arrival_date, '%d-%m-%Y')) as month_of_year,
    COUNT(*) as total_reservations
from hotel_reservation_dataset
group by month_of_year
order by month_of_year;

/**14. For reservations involving children, what is the most common room type, and what is the average 
price for that room type?**/

  with RoomTypeWithChildren as (
    select room_type_reserved, count(*) as count, avg(avg_price_per_room) as avg_price
    from hotel_reservation_dataset
    where no_of_children > 0
    group by room_type_reserved
)
select room_type_reserved, count, avg_price
from RoomTypeWithChildren
order by count desc
limit 1;
/**15. Find the market segment type that generates the highest average price per room.**/

select * from hotel_reservation_dataset;
 
  select  market_segment_type, avg(avg_price_per_room) as Avg_price from hotel_reservation_dataset
  group by market_segment_type
  order by Avg_price
  limit 1;















