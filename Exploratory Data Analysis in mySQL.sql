SELECT * 
FROM layoffs_staging ;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging  ;


SELECT company, SUM(total_laid_off)
FROM layoffs_staging 
GROUP BY company
ORDER BY SUM(total_laid_off) DESC ;

SELECT country, SUM(total_laid_off)
FROM layoffs_staging 
GROUP BY country
ORDER BY SUM(total_laid_off) DESC ;


SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging 
GROUP BY YEAR(`date`)
ORDER BY SUM(total_laid_off) DESC ;

SELECT SUBSTRING(`date`, 1, 7) AS `Month`, SUM(total_laid_off)
FROM layoffs_staging 
GROUP BY `Month`
ORDER BY SUM(total_laid_off)  ;

WITH ROLLING_TOTAL AS 
(
SELECT SUBSTRING(`date`, 1, 7) AS `Month`, SUM(total_laid_off) AS laid_off_by_month
FROM layoffs_staging 
GROUP BY `Month`
ORDER BY SUM(total_laid_off)  
)
SELECT `Month`, laid_off_by_month, SUM(laid_off_by_month ) OVER(ORDER BY `Month`)  AS rolling_total 
FROM ROLLING_TOTAL ;

SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging 
GROUP BY company, (`date`)
ORDER BY SUM(total_laid_off) DESC ;

WITH Company_Year AS 
(
SELECT company, YEAR(`date`) AS years, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging 
GROUP BY company, YEAR(`date`)
), Company_Year_Rank AS
(
SELECT *,
DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking 
FROM Company_Year
)
SELECT *
FROM Company_YEAR_Rank 
WHERE Ranking <= 5 ;
































