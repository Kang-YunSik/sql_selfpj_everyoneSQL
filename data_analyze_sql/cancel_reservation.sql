-- 분석7. 분석6에 총 예약 건수(A.reserv_no), 예약 취소 건수(A.cancel='Y')를 추가

SELECT SUBSTR(A.reserv_date,1,6) 매출월, 
		SUM(B.sales) 총매출,
		-- 전체 매출액 - 전용상품 매출액 = 전용상품 외 매출액
       SUM(b.sales)-SUM(case B.item_id when 'M0001' then b.sales else 0 end) 전용상품외매출, 
       SUM(case b.item_id when 'M0001' then b.sales else 0 end) 전용상품매출,
       -- 전용상품 매출액 / 전체상품 매출액 * 100 = 전용상품의 매출 기여율
       ROUND(SUM(case b.item_id when 'M0001' then b.sales else 0 end)/SUM(B.sales)*100,1) 매출기여율,
       -- 총예약건과 예약완료/취소 건을 검색
       COUNT(A.reserv_no) 총예약건,
       SUM(case A.cancel when 'N' then 1 else 0 end) 예약완료건,
       SUM(case A.cancel when 'Y' then 1 else 0 end) 예약취소건
-- 판매된 물품에 대한 검색을 하기 위해 테이블 조인
FROM reservation A, order_info B
WHERE A.reserv_no = B.reserv_no
AND   A.cancel    = 'N'
-- 월별 그룹화
GROUP BY SUBSTR(A.reserv_date,1,6)
-- 월별 내림차순
ORDER BY SUBSTR(A.reserv_date,1,6);