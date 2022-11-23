/*Data Analysis*/
/*Perform the following analysis in PostgreSQL after building the complete database:*/

/*1.Write a SQL query to determine the year in which North America had highest video games sales.*/
  SELECT g.release_year,SUM(s.na_sales_in_millions) as total_na_sales
  FROM games g
  JOIN sales s 
  ON s.game_id = g.game_id
  WHERE s.na_sales_in_millions is not null
  GROUP BY 1
  ORDER BY 2 DESC
  LIMIT 1;
  

/*2.Write a SQL query to determine the year in which the global sales was highest.*/
  SELECT g.release_year,SUM(s.global_sales_in_millions) as total_global_sales
  FROM games g
  JOIN sales s 
  ON s.game_id = g.game_id
  WHERE s.global_sales_in_millions is not null
  GROUP BY 1
  ORDER BY 2 DESC
  LIMIT 1;
/*3.Write a SQL query to determine the year in which the total shipped was highest.*/
  SELECT g.release_year,SUM(s.total_shipped_in_millions) as total_shipped
  FROM games g
  JOIN sales s 
  ON s.game_id = g.game_id
  WHERE s.total_shipped_in_millions is not null
  GROUP BY 1
  ORDER BY 2 DESC
  LIMIT 1;

/*4.Write a SQL query to determine the most popular video game console in North America.*/
  WITH SUB AS (SELECT *
               FROM games g
               JOIN console c
               ON g.console_id = c.console_id)
  SELECT SUB.console,sum(sales.na_sales_in_millions) AS TOTAL_NA_SALES
  FROM SUB
  JOIN sales
  ON SUB.game_id=sales.game_id
  WHERE sales.na_sales_in_millions IS NOT NULL
  GROUP BY 1
  ORDER BY 2 DESC
  LIMIT 1;
/*5.Write a SQL query to determine the most popular video game console in PAL.*/
   WITH SUB AS (SELECT *
               FROM games g
               JOIN console c
               ON g.console_id = c.console_id)
  SELECT SUB.console,sum(sales.pal_sales_in_millions) AS TOTAL_PAL_SALES
  FROM SUB
  JOIN sales
  ON SUB.game_id=sales.game_id
  WHERE sales.pal_sales_in_millions IS NOT NULL
  GROUP BY 1
  ORDER BY 2 DESC
  LIMIT 1;

/*6.Write a SQL query to determine the most popular video game console in Japan.*/
   WITH SUB AS (SELECT *
               FROM games g
               JOIN console c
               ON g.console_id = c.console_id)
  SELECT SUB.console,sum(sales.japan_sales_in_millions) AS TOTAL_JAPAN_SALES
  FROM SUB
  JOIN sales
  ON SUB.game_id=sales.game_id
  WHERE sales.japan_sales_in_millions IS NOT NULL
  GROUP BY 1
  ORDER BY 2 DESC
  LIMIT 1;



/*7.Write a SQL query to determine the most popular video game console in Other regions.*/
  WITH SUB AS (SELECT *
               FROM games g
               JOIN console c
               ON g.console_id = c.console_id)
  SELECT SUB.console,sum(sales.other_sales_in_millions) AS TOTAL_OTHER_SALES
  FROM SUB
  JOIN sales
  ON SUB.game_id=sales.game_id
  WHERE sales.other_sales_in_millions IS NOT NULL
  GROUP BY 1
  ORDER BY 2 DESC
  LIMIT 1;


/*8.Write a SQL query to determine the most popular video game console globally.*/
  WITH SUB AS (SELECT *
               FROM games g
               JOIN console c
               ON g.console_id = c.console_id)
  SELECT SUB.console,sum(sales.global_sales_in_millions) AS TOTAL_GLOBAL_SALES
  FROM SUB
  JOIN sales
  ON SUB.game_id=sales.game_id
  WHERE sales.global_sales_in_millions IS NOT NULL
  GROUP BY 1
  ORDER BY 2 DESC
  LIMIT 1;


/*9.Write a SQL query to determine the most shipped video game console.*/
  WITH SUB AS (SELECT *
               FROM games g
               JOIN console c
               ON g.console_id = c.console_id)
  SELECT SUB.console,sum(sales.total_shipped_in_millions) AS TOTAL_SHIPPED
  FROM SUB
  JOIN sales
  ON SUB.game_id=sales.game_id
  WHERE sales.total_shipped_in_millions IS NOT NULL
  GROUP BY 1
  ORDER BY 2 DESC
  LIMIT 1;
  /*ANS.-the most shipped video game console is Series based on total SHIPPED*/

/*10.Write a SQL query to determine the most popular video game across various consoles.*/
  WITH SUB AS (SELECT *
               FROM games g
               JOIN console c
               ON g.console_id = c.console_id)
  SELECT SUB.game_name,SUB.console,SUB.user_score
  FROM SUB
  WHERE SUB.user_score is not null
  ORDER BY 3 DESC;

/*11.Write a SQL query to determine the most popular video game across various genres.*/
  WITH SUB AS (SELECT *
               FROM games 
               JOIN genre
               ON games.genre_id=genre.genre_id)
  SELECT SUB.game_name,SUB.genre,SUB.user_score
  FROM SUB
  WHERE SUB.user_score is not null
  ORDER BY 3 DESC;
